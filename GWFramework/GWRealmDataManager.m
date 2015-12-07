//
//  GWRealmDataManager.m
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Realm.h>

#import "GWRealmDataManager.h"
#import "ServerCommunication.h"
#import "GWRLMImage.h"
#import "GWRLMIntention.h"
#import "GWRLMText.h"
#import "RLMResults+GWExtension.h"


@interface GWRealmDataManager () {
    ServerCommunication *serverComm;
}

@end

@implementation GWRealmDataManager

-(id)init {
    if (self = [super init]) {
        serverComm = [[ServerCommunication alloc] init];
    }
    
    return self;
}


#pragma mark - Fetching Intentions Locally

- (RLMResults *)fetchImages {
    RLMResults *images = [GWRLMImage allObjects];
    
    return images;
}

- (RLMResults *)fetchImagesWithIds:(NSArray *)theImageIds {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"imageId IN %@", theImageIds];
    RLMResults *images = [GWRLMImage objectsWithPredicate:predicate];
    
    return images;
}

-(RLMResults *)fetchIntentionsWithCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture = %@", theCulture];
    RLMResults *intentions = [GWRLMIntention objectsWithPredicate:predicate];
    
    return intentions;
}

-(RLMResults *)fetchIntentionsWithCulture:(NSString *)theCulture intentionId:(NSString *)theIntentionId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture = %@ AND intentionId = %@", theCulture, theIntentionId];
    RLMResults *intentions = [GWRLMIntention objectsWithPredicate:predicate];
    
    return intentions;
}

-(RLMResults *)fetchIntentionsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName intentionId:(NSString *)theIntentionId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture = %@ AND intentionId = %@ AND areaName = %@", theCulture, theIntentionId, theAreaName];
    RLMResults *intentions = [GWRLMIntention objectsWithPredicate:predicate];
    
    return intentions;
}


#pragma mark - Fetching Texts Locally

-(RLMResults *)fetchTextsWithCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture = %@", theCulture];
    RLMResults *texts = [GWRLMText objectsWithPredicate:predicate];
    
    return texts;
}

-(RLMResults *)fetchTextsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture = %@ AND areaName = %@", theCulture, theAreaName];
    RLMResults *texts  = [GWRLMText objectsWithPredicate:predicate];
    
    return texts;
}

-(RLMResults *)fetchTextsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName intentionId:(NSString *)theIntentionId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture = %@ AND areaName = %@ AND intentionId = %@", theCulture, theAreaName, theIntentionId];
    RLMResults *texts = [GWRLMText objectsWithPredicate:predicate];
    
    return texts;
}

-(RLMResults *)fetchTextsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName textId:(NSString *)theTextId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture = %@ AND areaName = %@ AND textId = %@", theCulture, theAreaName, theTextId];
    RLMResults *texts = [GWRLMText objectsWithPredicate:predicate];
    
    return texts;
}


#pragma mark - Download Functions

-(void)downloadAllTextsWithArea:(NSString *)theArea culture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSArray *, NSError *))block {
    
    [self downloadIntentionsWithArea:theArea culture:theCulture withCompletion:^(NSArray *theIntentions, NSError *theError) {
       
        if (theError != nil) {
            block(nil, nil, theError);
            return ;
        }
        
        NSArray *theIntentionIds = [theIntentions valueForKey:@"intentionId"];
        
        GWRealmDataManager *dataMan = [[GWRealmDataManager alloc] init];
        
        __block int numIntentions = 0;
        
        for (NSString *theIntentionId in theIntentionIds) {
            [dataMan downloadTextsWithArea:theArea intentionId:theIntentionId culture:theCulture withCompletion:^(NSArray *theTexts, NSError *theError) {
               
                numIntentions++;
                
                if (numIntentions == theIntentionIds.count) {
                    block(theIntentions, theTexts, nil);
                }
                
            }];
        }
        
    }];
    
}

-(void)downloadIntentionsWithArea:(NSString *)theArea culture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadIntentionsWithArea:theArea withCulture:theCulture withCompletion:^(NSArray *theIntentions, NSError *error) {
        
        RLMRealm *theRealm = [RLMRealm defaultRealm];
        GWRealmDataManager *dataMan = [[GWRealmDataManager alloc] init];
        NSMutableArray *intentionsToReturn = [NSMutableArray array];
        
        
        for (NSDictionary *intentionDict in theIntentions) {
            NSString *theIntenionId = intentionDict[@"IntentionId"];
            
            GWRLMIntention *currentIntention = nil;
            RLMResults *storedIntentions = [dataMan fetchIntentionsWithCulture:theCulture areaName:theArea intentionId:theIntenionId];
            
            if (storedIntentions.count == 0) {
                currentIntention = [[GWRLMIntention alloc] init];
                
                [theRealm beginWriteTransaction];
                [currentIntention updateIntentionWithAreaName:theArea jsonData:intentionDict];
                [theRealm addObject:currentIntention];
                [theRealm commitWriteTransaction];
                
            }
            else {
                currentIntention = [storedIntentions firstObject];
                
                [theRealm beginWriteTransaction];
                [currentIntention updateIntentionWithAreaName:theArea jsonData:intentionDict];
                [theRealm commitWriteTransaction];
                
            }
            
            [intentionsToReturn addObject:currentIntention];
        }
        
        theRealm = nil;
        
        block(intentionsToReturn, nil);
        
    }];
    
}

-(void)downloadTextsWithArea:(NSString *)theArea intentionId:(NSString *)theIntentionId culture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadTextsWithAreaName:theArea withIntentionId:theIntentionId withCulture:theCulture withCompletion:^(NSArray *theTexts, NSError *theError) {
       
        GWRealmDataManager *dataMan = [[GWRealmDataManager alloc] init];
        NSArray *textsToReturn = [dataMan updateOrPersistTextWithRealm:[RLMRealm defaultRealm] area:theArea culture:theCulture intentionId:theIntentionId texts:theTexts];
        dataMan = nil;
        block(textsToReturn, nil);
        
    }];
    
}

-(NSArray *)updateOrPersistTextWithRealm:(RLMRealm *)theRealm area:(NSString *)theArea culture:(NSString *)theCulture texts:(NSArray *)theTexts {
    
    NSLog(@"new method called");
    
    NSMutableArray *textsToReturn = [NSMutableArray array];
    int progress = 0;
    
    for (NSDictionary *textDict in theTexts) {
        
        progress++;
        
        NSString *textId = textDict[@"TextId"];
        
        GWRLMText *currentText = nil;
        RLMResults *storedTexts = [self fetchTextsWithCulture:theCulture areaName:theArea textId:textId];
        
        if (storedTexts.count == 0) {
            currentText = [[GWRLMText alloc] init];
            
            [theRealm beginWriteTransaction];
            [currentText updateWithAreaName:theArea jsonDict:textDict];
            [theRealm addObject:currentText];
            [theRealm commitWriteTransaction];
            
        }
        else {
            
            currentText = [storedTexts firstObject];
            
            [theRealm beginWriteTransaction];
            [currentText updateWithAreaName:theArea jsonDict:textDict];
            [theRealm commitWriteTransaction];
            
        }
        
        [textsToReturn addObject:currentText];
        storedTexts = nil;
    }
    
    [theRealm invalidate];
    theRealm = nil;
    return textsToReturn;
}

-(NSArray *)updateOrPersistTextWithRealm:(RLMRealm *)theRealm area:(NSString *)theArea culture:(NSString *)theCulture intentionId:(NSString *)theIntentionId texts:(NSArray *)theTexts {
    
    NSLog(@"new method called");
    
    RLMResults *textsForIntention = [self fetchTextsWithCulture:theCulture areaName:theArea intentionId:theIntentionId];
    NSMutableArray *textsToReturn = [NSMutableArray array];
    int progress = 0;
    
    for (NSDictionary *textDict in theTexts) {
        
        progress++;
        
        NSString *textId = textDict[@"TextId"];
        
        GWRLMText *currentText = [textsForIntention findRLMTextWithId:textId];

        if (currentText == nil) {
            currentText = [[GWRLMText alloc] init];
            
            [theRealm beginWriteTransaction];
            [currentText updateWithAreaName:theArea jsonDict:textDict];
            [theRealm addObject:currentText];
            [theRealm commitWriteTransaction];
            
        }
        else {
            
            [theRealm beginWriteTransaction];
            [currentText updateWithAreaName:theArea jsonDict:textDict];
            [theRealm commitWriteTransaction];
            
        }
        
        [textsToReturn addObject:currentText];
    }
    
    [theRealm invalidate];
    theRealm = nil;
    return textsToReturn;
}

#pragma mark - Image downloading

-(void)downloadImagesWithRelativePath:(NSString *)theRelativePath withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadImageIdsForRelativePath:theRelativePath withCompletion:^(NSArray *theImagePaths, NSError *theError) {
       
        
        
    }];
}

-(void)downloadImagesWithIntentionId:(NSString *)theIntentionId withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
}

@end

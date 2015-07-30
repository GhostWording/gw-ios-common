//
//  GWDataManager.m
//  GWFramework
//
//  Created by Mathieu Skulason on 24/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWDataManager.h"
#import "ServerCommunication.h"
#import "GWCoreDataManager.h"

// data Objects
#import "GWArea.h"
#import "GWIntention.h"
#import "GWText.h"

@interface GWDataManager () {
    ServerCommunication *serverComm;
}

@end

@implementation GWDataManager

-(id)init {
    if (self = [super init]) {
        serverComm = [[ServerCommunication alloc] initWithAreaName:@"IThinkOfYou"];
    }
    
    return self;
}


#pragma mark - Local data store

-(NSArray*)fetchTexts {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionId like[c] '%@'", theIntentionId]];
    NSLog(@"predicate is: %@", predicate);
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionIds:(NSArray *)theIntentionIds {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionId IN %@", theIntentionIds];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return  theTexts;
}

-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionLabel like[c] '%@'", theIntentionSlug]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionSlugs:(NSArray *)theIntentionSlugs {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel IN %@", theIntentionSlugs];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId andRecipientType:(NSString *)recipientTypeTag {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionId like[c] '%@' AND '%@' IN tagIds", theIntentionId, recipientTypeTag]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

#pragma mark - Server Comm

#pragma mark - Text downloads

-(void)downloadTextsForIntention:(NSString *)intentionId withCompletion:(void (^)(NSArray *, NSError *))block {
    
    NSLog(@"download texts for intention");
    
    [serverComm downloadTextsWithIntentionId:intentionId withCompletion:^(NSArray *theTexts, NSError *error) {
        
        NSMutableArray *textToReturn;
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        
        for (NSDictionary *textJson in theTexts) {
            
            GWText *text = [GWText createGWTextWithDict:textJson withContext:childContext];
            [textToReturn addObject:text.textId];
            
        }
        
        NSLog(@"texts after for loop");
        [childContext save:nil];
        
        [[GWCoreDataManager sharedInstance] saveContext];
         
        block(textToReturn, error);
        
    }];
}

-(void)downloadTextsForIntentions:(NSArray *)theIntentionsIds withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    __block NSMutableArray *textsIdsToReturn = [NSMutableArray array];
    __block NSError *theError = nil;
    __block int numTextDownloads = 0;
    int numTextDownloadsToComplete = (int)theIntentionsIds.count;
    
    
    for (NSString *theIntentionId in theIntentionsIds) {
        
        [self downloadTextsForIntention:theIntentionId withCompletion:^(NSArray *theTextIds, NSError *error) {
            
            if (error != nil) {
                theError = error;
            }
            
            numTextDownloads = numTextDownloads + 1;
            [textsIdsToReturn addObjectsFromArray:theTextIds];
            
            if (numTextDownloadsToComplete == numTextDownloads) {
                NSLog(@"Completed download: %d of %d", numTextDownloads, numTextDownloadsToComplete);
                block(textsIdsToReturn, theError);
            }
            else {
                NSLog(@"Completed download: %d of %d", numTextDownloads, numTextDownloadsToComplete);
            }
            
        }];
        
    }
    
}

-(void)downloadTextsForIntentionSlug:(NSString *)intentionSlug withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"Download the slugs");
    
    [serverComm downloadTextsWithIntentionSlug:intentionSlug withCompletion:^(NSArray *theTexts, NSError *error) {
       
        NSMutableArray *textToReturn;
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        
        for (NSDictionary *textJson in theTexts) {
            
            GWText *text = [GWText createGWTextWithDict:textJson withContext:childContext];
            [textToReturn addObject:text.textId];
            
        }
        
        NSLog(@"texts after for loop");
        [childContext save:nil];
        
        block(textToReturn, error);
        
    }];
}

-(void)downloadTextsForIntentionSlugs:(NSArray *)theIntentionSlugs withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    __block NSMutableArray *textsIdsToReturn = [NSMutableArray array];
    __block NSError *theError = nil;
    __block int numTextDownloads = 0;
    int numTextDownloadsToComplete = (int)theIntentionSlugs.count;
    
    for (NSString *intentionSlug in theIntentionSlugs) {
        [self downloadTextsForIntentionSlug:intentionSlug withCompletion:^(NSArray *textIds, NSError *error) {
            
            if (error != nil) {
                theError = error;
            }
            
            numTextDownloads = numTextDownloads + 1;
            [textsIdsToReturn addObjectsFromArray:textIds];
            
            if (numTextDownloads == numTextDownloadsToComplete) {
                block(textsIdsToReturn, theError);
            }
            
        }];
    }
    
}


#pragma mark - Intention Download


-(void)downloadAllIntentionsWithCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"downloading all intentions, not supported aborting");
    
    return ;
    
    [serverComm downloadAllIntentions:^(NSArray *intentions, NSError *error) {
                
    }];
}


-(void)downloadIntentionsWithArea:(NSString *)theArea withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"downloading intentions with area");
    
    [serverComm downloadIntentionsWithArea:theArea withCompletion:^(NSArray *intentions, NSError *error) {
        NSLog(@"Finished downloading intentions with area");
        NSMutableArray *intentionsToReturn = [NSMutableArray array];
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        
        for (NSDictionary *jsonDict in intentions) {
            GWIntention *intention = [GWIntention createGWIntentionWithDict:jsonDict withContext:childContext];
            [intentionsToReturn addObject:intention.intentionId];
        }
        
        
        
    }];
    
}


#pragma mark - Area Download


-(void)downloadAllAreasWithCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"Downloading all areas");
    
    [serverComm downloadAllAreasWithCompletion:^(NSArray *theAreas, NSError *error) {
        NSLog(@"Finished downloading all areas");
    }];
}

-(void)downloadArea:(NSString *)theAreaName withCompletion:(void (^)(NSString *, NSError *))block {
    [block copy];
    
    NSLog(@"downloading area with name: %@", theAreaName);
    
    [serverComm downloadArea:theAreaName withCompletion:^(NSArray *theAreas, NSError *error) {
        NSLog(@"Finished download area with name: %@", theAreaName);
    }];
}

@end

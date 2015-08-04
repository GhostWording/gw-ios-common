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
#import "GWTag.h"

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

// MARK: Area methods

-(NSArray*)fetchAreas {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWArea"];
    NSArray *theAreas = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theAreas;
}

// MARK: Intention methods

-(NSArray*)fetchIntentions {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWIntention"];
    NSArray *theIntentions = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theIntentions;
}

-(NSArray*)fetchIntentionsWithCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture like[c] '%@'", theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWIntention"];
    [request setPredicate:predicate];
    
    NSArray *theIntentions = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theIntentions;
}

// MARK: Text methods

-(NSArray*)fetchTexts {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture like[c] '%@'", theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
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

-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionId like[c] '%@' AND culture like[c] '%@'", theIntentionId, theCulture];
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

-(NSArray*)fetchTextsForIntentionIds:(NSArray *)theIntentionIds withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionId IN %@ and culture like[c] '%@'", theIntentionIds, theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionLabel like[c] '%@'", theIntentionSlug]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel like[c] '%@' AND culture like[c] '%@'", theIntentionSlug, theCulture];
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

-(NSArray*)fetchTextsForIntentionSlugs:(NSArray *)theIntentionSlugs withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel IN %@ AND culture like[c] '%@'", theIntentionSlugs, theCulture];
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

-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId andRecipientType:(NSString *)recipientTypeTag withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionId like[c] '%@' AND '%@' IN tagIds AND culture like[c] '%@'", theIntentionId, recipientTypeTag, theCulture];;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug andRecipientType:(NSString *)recipientTypeTag {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel like[c] '%@' AND '%@' IN tagIds", theIntentionSlug, recipientTypeTag];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}


-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug andRecipientType:(NSString *)recipientTypeTag withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel like[c] '%@' AND '%@' IN tagIds AND culture like[c] '%@'", theIntentionSlug, recipientTypeTag, theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}


// MARK: Tag methods

-(NSArray*)fetchTags {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWTag"];
    
    NSArray *theTags = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTags;
}

-(NSArray*)fetchTagsOnBackgroundThread {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWTag"];
    
    NSArray *theTags = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTags;
}


#pragma mark - Local Data Store Background Thread

// MARK: Areas background thread methods

-(NSArray*)fetchAreasOnBackgroundThread {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWArea"];
    NSArray *theAreas = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theAreas;
}

// MARK: Intention background thread methods

-(NSArray*)fetchIntentionsOnBackgroundThread {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWIntention"];
    NSArray *theIntentions = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theIntentions;
}

-(NSArray*)fetchIntentionsOnBackgroundThreadWithCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture like[c] '%@'", theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWIntention"];
    [request setPredicate:predicate];
    
    NSArray *theIntentions = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theIntentions;
}

// MARK: Text background thread methods

-(NSArray*)fetchTextsOnBackgroundThread {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"culture like[c] '%@'", theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionId:(NSString *)theIntentionID withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionId like[c] '%@' AND culture like[c] '%@'", theIntentionID, theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionId:(NSString *)theIntentionID withRecipientType:(NSString *)recipientTypeTag withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionId like[c] '%@' AND '%@' IN tagIds AND culture like[c] '%@'", theIntentionID, recipientTypeTag, theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionSlug:(NSString *)theIntentionSlug withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel like[c] '%@' AND culture like[c] '%@'", theIntentionSlug, theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionSlug:(NSString *)theIntentionSlug withRecipientType:(NSString *)recipientTypeTag withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel like[c] '%@' AND '%@' in tagIds AND culture like[c] '%@'", theIntentionSlug, recipientTypeTag, theCulture];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}


#pragma mark - Local Data Store Helper Methods

-(BOOL)textExistsWithId:(NSString *)theTextId inArray:(NSArray *)theArray {
    
    for (GWText *theText in theArray) {
        if ([theText.textId isEqualToString:theTextId]) {
            return YES;
        }
    }
    
    return NO;
    
}

-(GWText*)textWithId:(NSString *)theTextId inArray:(NSArray *)theArray {
    for (GWText *theText in theArray) {
        //NSLog(@"the text is: %@", theText);
        if ([theText.textId isEqualToString:theTextId]) {
            NSLog(@"Found text with id");
            return theText;
        }
    }
    
    return nil;
}

-(BOOL)tagExistsWithId:(NSString *)theTagId inArray:(NSArray *)theArray {
    
    for (GWTag *tag in theArray) {
        if ([tag.tagId isEqualToString:theTagId]) {
            return YES;
        }
    }
    
    return NO;
}

-(GWTag*)tagWithId:(NSString *)theTagId inArray:(NSArray *)theArray {
    
    for (GWTag *theTag in theArray) {
        if ([theTag.tagId isEqualToString:theTagId]) {
            return theTag;
        }
    }
    
    return nil;
}

-(GWIntention*)intentionWithId:(NSString *)theIntentionId inArray:(NSArray *)theArray {
    
    for (GWIntention *theIntention in theArray) {
        if ([theIntention.intentionId isEqualToString:theIntentionId]) {
            return theIntention;
        }
    }
    
    return nil;
}

-(GWArea*)areaWithId:(NSString *)theAreaId inArray:(NSArray *)theArray {
    
    for (GWArea *theArea in theArray) {
        if ([theArea.areaId isEqualToString:theAreaId]) {
            return theArea;
        }
    }
    
    return nil;
}


-(GWText*)persistTextOrUpdateWithJson:(NSDictionary*)textJson withArray:(NSArray*)theArray withContext:(NSManagedObjectContext*)theContext {
    
    NSString *textId = [textJson objectForKey:@"TextId"];
    NSLog(@"text id is: %@", textId);
    GWText *theText = [self textWithId:textId inArray:theArray];
    
    if (theText == nil) {
        theText = [GWText createGWTextWithDict:textJson withContext:theContext];
        NSLog(@"create text");
    }
    else {
        [theText updateTextWithDict:textJson withContext:theContext];
        NSLog(@"updating text");
    }
    
    return theText;
}

-(GWIntention*)persistIntentionOrUpdateWithJson:(NSDictionary *)intentionJson withArray:(NSArray *)theArray withContext:(NSManagedObjectContext *)theContext {
    
    NSString *intentionId = [intentionJson objectForKey:@"IntentionId"];
    
    GWIntention *theIntention = [self intentionWithId:intentionId inArray:theArray];
    
    if (theIntention == nil) {
        theIntention = [GWIntention createGWIntentionWithDict:intentionJson withContext:theContext];
    }
    else {
        [theIntention updateIntentionWithDict:intentionJson withContext:theContext];
    }
    
    return theIntention;
}

-(GWArea*)persistAreaOrUpdateWithJson:(NSDictionary *)areaJson withArray:(NSArray *)theArray withContext:(NSManagedObjectContext *)theContext {
    
    NSString *areaId = [areaJson objectForKey:@"AreaId"];
    
    GWArea *theArea = [self areaWithId:areaId inArray:theArray];
    
    if (theArea == nil) {
        theArea = [GWArea createAreaWithDict:areaJson withContext:theContext];
    }
    else {
        [theArea updateAreaWithDict:areaJson withContext:theContext];
    }
    
    return theArea;
}

#pragma mark - Server Comm

#pragma mark - Text downloads

-(void)downloadTextsWithArea:(NSString *)theArea withIntentionIds:(NSArray *)theIntentionsIds withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    __block NSMutableArray *textsIdsToReturn = [NSMutableArray array];
    __block NSError *theError = nil;
    __block int numTextDownloads = 0;
    int numTextDownloadsToComplete = (int)theIntentionsIds.count;
    
    for (NSString *theIntentionId in theIntentionsIds) {
        
        [self downloadTextsWithArea:theArea withIntentionId:theIntentionId withCulture:theCulture withCompletion:^(NSArray *theTextIds, NSError *error) {
            
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

-(void)downloadTextsWithArea:(NSString *)theArea withIntentionId:(NSString *)intentionId withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"Download texts for intention");
    
    [serverComm downloadTextsWithAreaName:theArea withIntentionId:intentionId withCulture:theCulture withCompletion:^(NSArray *theTexts, NSError *error) {
        
        NSMutableArray *textToReturn;
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        GWDataManager *dataMan = [[GWDataManager alloc] init];
        NSArray *textsForIntention = [dataMan fetchTextsOnBackgroundThread];
        NSLog(@"Texts for intention: %@", textsForIntention);
        
        for (NSDictionary *textJson in theTexts) {
            
            GWText *text = [dataMan persistTextOrUpdateWithJson:textJson withArray:textsForIntention withContext:childContext];
            [textToReturn addObject:text.textId];
            
        }
        
        NSLog(@"texts after for loop");
        [childContext save:nil];
        
        [[GWCoreDataManager sharedInstance] saveContext];
        
        block(textToReturn, error);
        
    }];
}

-(void)downloadTextsWithArea:(NSString *)theArea withIntentionSlugs:(NSArray *)theIntentionSlugs withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    __block NSMutableArray *textsIdsToReturn = [NSMutableArray array];
    __block NSError *theError = nil;
    __block int numTextDownloads = 0;
    int numTextDownloadsToComplete = (int)theIntentionSlugs.count;
    
    for (NSString *intentionSlug in theIntentionSlugs) {
        [self downloadTextsWithArea:theArea withIntentionSlug:intentionSlug withCulture:theCulture withCompletion:^(NSArray *textIds, NSError *error) {
            
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


-(void)downloadTextsWithArea:(NSString *)theArea withIntentionSlug:(NSString *)intentionSlug withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadTextsWithAreaName:theArea withIntentionSlug:intentionSlug withCulture:theCulture withCompletion:^(NSArray *theTexts, NSError *error) {
        
        NSMutableArray *textToReturn;
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        GWDataManager *dataMan = [[GWDataManager alloc] init];
        NSArray *textsForIntentionSlug = [dataMan fetchTextsForIntentionSlug:intentionSlug withCulture:theCulture];
        
        for (NSDictionary *textJson in theTexts) {
            
            GWText *text = [dataMan persistTextOrUpdateWithJson:textJson withArray:textsForIntentionSlug withContext:childContext];
            [textToReturn addObject:text.textId];
            
        }
        
        NSLog(@"texts after for loop");
        [childContext save:nil];
        
        [[GWCoreDataManager sharedInstance] saveContext];
        
        block(textToReturn, error);
        
    }];
    
}


#pragma mark - Intention Download


-(void)downloadAllIntentionsWithCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"downloading all intentions, not supported aborting");
    
    return ;
    
    /*
    [serverComm downloadAllIntentions:^(NSArray *intentions, NSError *error) {
                
    }];
    */
}


-(void)downloadIntentionsWithArea:(NSString *)theArea withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *theIntentionIds, NSError *error))block {
    [block copy];
    
    NSLog(@"downloading intentions with area");
    
    [serverComm downloadIntentionsWithArea:theArea withCulture:theCulture withCompletion:^(NSArray *intentions, NSError *error) {
        NSLog(@"Finished downloading intentions with area");
        NSMutableArray *intentionsToReturn = [NSMutableArray array];
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        GWDataManager *dataMan = [[GWDataManager alloc] init];
        NSArray *intentionsForCulture = [dataMan fetchIntentionsOnBackgroundThreadWithCulture:theCulture];
        
        for (NSDictionary *jsonDict in intentions) {
            GWIntention *intention = [dataMan persistIntentionOrUpdateWithJson:jsonDict withArray:intentionsForCulture withContext:childContext];
            [intentionsToReturn addObject:intention.intentionId];
        }
        
        [childContext save:nil];
        
        [[[GWCoreDataManager sharedInstance] childContext] save:nil];
        
        block(intentionsToReturn, error);
        
    }];
    
}


#pragma mark - Area Download


-(void)downloadAllAreasWithCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block{
    [block copy];
    
    NSLog(@"Downloading all areas");
    
    [serverComm downloadAllAreasWithCulture:theCulture withCompletion:^(NSArray *theAreas, NSError *error) {
        NSLog(@"Finished downloading all areas");
        NSMutableArray *areasToReturn = [NSMutableArray array];
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        GWDataManager *dataMan = [[GWDataManager alloc] init];
        NSArray *localAreas = [dataMan fetchAreas];
        
        for (NSDictionary *jsonDict in theAreas) {
            GWArea *area = [dataMan persistAreaOrUpdateWithJson:jsonDict withArray:localAreas withContext:childContext];
            [areasToReturn addObject:area.areaId];
        }
        
        [childContext save:nil];
        
        [[[GWCoreDataManager sharedInstance] mainObjectContext] save:nil];
        
        block(areasToReturn, error);
        
    }];
}

-(void)downloadArea:(NSString *)theAreaName withCulture:(NSString *)theCulture withCompletion:(void (^)(NSString *, NSError *))block {
    [block copy];
    
    NSLog(@"downloading area with name: %@", theAreaName);
    
    [serverComm downloadArea:theAreaName withCulture:theCulture withCompletion:^(NSArray *theArea, NSError *error) {
        NSLog(@"Finished download area with name: %@", theAreaName);
    }];
}

@end

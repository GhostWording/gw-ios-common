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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionId == %@", theIntentionId]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

#pragma mark - Server Comm


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
         
        block(textToReturn, error);
        
    }];
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

@end

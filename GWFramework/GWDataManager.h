//
//  GWDataManager.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
        Look into a different design for managed object contexts
        As portrayed here: http://www.cocoanetics.com/2012/07/multi-context-coredata/
*/

@interface GWDataManager : NSObject

#pragma mark - Local Data Store Methods

/* Fetches all the texts on the main queue. **/
-(NSArray*)fetchTexts;
/* Fetch texts on a background thread if they need to be used on that thread. NSManagedObjects are not thread safe and should only be used on the thread they are created. **/
-(NSArray*)fetchTextsOnBackgroundThread;
/* Fetches all the texts for the given intention id on the main queue. **/
-(NSArray*)fetchTextsForIntentionId:(NSString*)theIntentionId;
/* Fetches all the texts for the intention ids on the main queue **/
-(NSArray*)fetchTextsForIntentionIds:(NSArray*)theIntentionIds;
/* Fetches all the texts for the given intention on the main queue. **/
-(NSArray*)fetchTextsForIntentionSlug:(NSString*)theIntentionSlug;
/* Fetches all the texts for the given intention slugs on the main queue **/
-(NSArray*)fetchTextsForIntentionSlugs:(NSArray*)theIntentionSlugs;
/* Fetches all the texts for the given intention and recipient on the main queue. **/
-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId andRecipientType:(NSString*)recipientTypeTag;
/* Fetches all the texts for the given intention and recipient on the main queue. **/
-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug andRecipientType:(NSString*)recipientTypeTag;

#pragma mark - Text Download Methods

/* Downloads all the texts with the given intention id in the array and returns all the textIds associated. **/
-(void)downloadTextsForIntentions:(NSArray*)theIntentionsIds withCompletion:(void (^)(NSArray *textIds, NSError *error))block;
/* Downloads the texts for a given intention id with an asynchruous NSURLSession data task. **/
-(void)downloadTextsForIntention:(NSString*)intentionId withCompletion:(void (^)(NSArray *textIds, NSError *error))block;
/* Downloads all the texts with the given intention slug in the array and returns all the textIds associated. **/
-(void)downloadTextsForIntentionSlugs:(NSArray*)theIntentionSlugs withCompletion:(void (^)(NSArray *textIds, NSError *error))block;
/* Downloads the texts for a given intention slug with an asynchruous NSURLSession data tas **/
-(void)downloadTextsForIntentionSlug:(NSString *)intentionSlug withCompletion:(void (^)(NSArray *textIds, NSError *error))block;

#pragma mark - Intention Download Methods

/* currently not supported, the data is not saved. **/
-(void)downloadAllIntentionsWithCompletion:(void (^)(NSArray *intentionIds, NSError *error))block;
/* Downloads all the intentions associated with an area. **/
-(void)downloadIntentionsWithArea:(NSString*)theArea withCompletion:(void (^)(NSArray *intentionIds, NSError *error))block;

#pragma mark - Text Dwonload Methods

/* Downloads all areas  **/
-(void)downloadAllAreasWithCompletion:(void (^)(NSArray *areaIds, NSError *error))block;
-(void)downloadArea:(NSString*)theAreaName withCompletion:(void (^)(NSString *areaId, NSError *error))block;

@end

//
//  GWDataManager.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GWText, GWTag, GWArea, GWIntention;

/*
        Look into a different design for managed object contexts
        As portrayed here: http://www.cocoanetics.com/2012/07/multi-context-coredata/
*/

@interface GWDataManager : NSObject

#pragma mark - Local Data Store Methods Main Thread

// MARK: Area methods

-(NSArray*)fetchAreas;

// MARK: Intention methods

-(NSArray*)fetchIntentions;
-(NSArray*)fetchIntentionsWithCulture:(NSString*)theCulture;

// MARK: Text methods

/* Fetches all the texts on the main queue. **/
-(NSArray*)fetchTexts;
/* Fetches all the texts for the given culture on the main **/
-(NSArray*)fetchTextsForCulture:(NSString*)theCulture;
/* Fetches all the texts for the given intention id on the main queue. **/
-(NSArray*)fetchTextsForIntentionId:(NSString*)theIntentionId;
/* Fetches all the texts for the given intention id and culture on the main queue. **/
-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId withCulture:(NSString*)theCulture;
/* Fetches all the texts for the intention ids on the main queue **/
-(NSArray*)fetchTextsForIntentionIds:(NSArray*)theIntentionIds;
/* Fetches all the texts for the given intention ids with the culture on the main queue. **/
-(NSArray*)fetchTextsForIntentionIds:(NSArray *)theIntentionIds withCulture:(NSString*)theCulture;
/* Fetches all the texts for the given intention on the main queue. **/
-(NSArray*)fetchTextsForIntentionSlug:(NSString*)theIntentionSlug;
/* Fetches all texts for the given intentino slug and culture on the main queue. **/
-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug withCulture:(NSString*)theCulture;
/* Fetches all the texts for the given intention slugs on the main queue **/
-(NSArray*)fetchTextsForIntentionSlugs:(NSArray*)theIntentionSlugs;
/* Fetches all the texts for the given intention slugs and culture on the main queue. **/
-(NSArray*)fetchTextsForIntentionSlugs:(NSArray *)theIntentionSlugs withCulture:(NSString*)theCulture;
/* Fetches all the texts for the given intention id and recipient on the main queue. NOT TESTED. **/
-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId andRecipientType:(NSString*)recipientTypeTag;
/* Fetches all the texts for the given intention id, recipient tag and culture on the main queue. NOT TESTED. **/
-(NSArray*)fetchTextsForIntentionId:(NSString *)theIntentionId andRecipientType:(NSString *)recipientTypeTag withCulture:(NSString*)theCulture;
/* Fetches all the texts for the given intention slug and recipien tagt on the main queue. NOT TESTED. **/
-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug andRecipientType:(NSString*)recipientTypeTag;
/* Fetches all the texts for the given intention slug, recipient tag and culture on the main queue. NOT TESTED. **/
-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug andRecipientType:(NSString *)recipientTypeTag withCulture:(NSString*)theCulture;

// MARK: Tag methods

-(NSArray*)fetchTags;
-(NSArray*)fetchTagsOnBackgroundThread;

#pragma mark - Local Data Store Methods Background Thread

// MARK: Background Area methods

-(NSArray*)fetchAreasOnBackgroundThread;

// MARK: Background Intention methods

-(NSArray*)fetchIntentionsOnBackgroundThread;
-(NSArray*)fetchIntentionsOnBackgroundThreadWithCulture:(NSString*)theCulture;

// MARK: Background Text methods

/* Fetch texts on a background thread if they need to be used on that thread. NSManagedObjects are not thread safe and should only be used on the thread they are created. **/
-(NSArray*)fetchTextsOnBackgroundThread;
/* Fetch texts on a background thread for the given culture. **/
-(NSArray*)fetchTextsOnBackgroundThreadForCulture:(NSString*)theCulture;
/* Fetch texts on background thread for the given intention id and culture **/
-(NSArray*)fetchTextsOnBackgroundThreadForIntentionId:(NSString*)theIntentionID withCulture:(NSString*)theCulture;
/* Fetch texts on background thread for the given intention id, recipient tag and culture **/
-(NSArray*)fetchTextsOnBackgroundThreadForIntentionId:(NSString *)theIntentionID withRecipientType:(NSString*)recipientTypeTag withCulture:(NSString *)theCulture;
/* Fetch texts on backgorund thread for the given intetion slug and culture **/
-(NSArray*)fetchTextsOnBackgroundThreadForIntentionSlug:(NSString*)theIntentionSlug withCulture:(NSString*)theCulture;
/* Fetch texts on background thread for the given intention slug, recipient tag and culture **/
-(NSArray*)fetchTextsOnBackgroundThreadForIntentionSlug:(NSString *)theIntentionSlug withRecipientType:(NSString*)recipientTypeTag withCulture:(NSString *)theCulture;


#pragma mark - Local Data Store Helper Methods

/* takes the text dictionary serialized from the json and checks the array fetched from the local datastore if it exists, if it exists it returns,
 that object if not it returns a newly created GWText instance.**/
-(GWText*)persistTextOrUpdateWithJson:(NSDictionary*)textJson withArray:(NSArray*)theArray withContext:(NSManagedObjectContext*)theContext;
/* takes the intention dictionary serialized from the json and checks the array fetched from the local datastore if it exists, if it exists it returns,
 that object if not it returns a newly created GWIntention instance.**/
-(GWIntention*)persistIntentionOrUpdateWithJson:(NSDictionary*)intentionJson withArray:(NSArray*)theArray withContext:(NSManagedObjectContext*)theContext;
/* takes the area dictionary serialized from the json and checks the array fetched from the local datastore if it exists, if it exists it returns
 that object if not it returns a newly created GWText instance. **/
-(GWArea*)persistAreaOrUpdateWithJson:(NSDictionary*)areaJson withArray:(NSArray*)theArray withContext:(NSManagedObjectContext*)theContext;


-(BOOL)textExistsWithId:(NSString*)theTextId inArray:(NSArray*)theArray;
-(GWText*)textWithId:(NSString*)theTextId inArray:(NSArray*)theArray;
-(BOOL)tagExistsWithId:(NSString*)theTagId inArray:(NSArray*)theArray;
-(GWTag*)tagWithId:(NSString*)theTagId inArray:(NSArray*)theArray;
-(BOOL)intentionExistsWithId:(NSString*)theIntentionId inArray:(NSArray*)theArray;
-(GWIntention*)intentionWithId:(NSString*)theIntentionId inArray:(NSArray*)theArray;
-(BOOL)areaExistsWithId:(NSString*)theAreaId inArray:(NSArray*)theArray;
-(GWArea*)areaWithId:(NSString*)theAreaId inArray:(NSArray*)theArray;

#pragma mark - Download Methods

#pragma mark - Text Download Methods

/* Downloads all the texts with the given intention id in the array and returns all the textIds associated. **/
-(void)downloadTextsWithArea:(NSString*)theArea withIntentionIds:(NSArray*)theIntentionsIds withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *textIds, NSError *error))block;
/* Downloads the texts for a given intention id with an asynchruous NSURLSession data task. **/
-(void)downloadTextsWithArea:(NSString*)theArea withIntentionId:(NSString*)intentionId withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *textIds, NSError *error))block;
/* Downloads all the texts with the given intention slug in the array and returns all the textIds associated. **/
-(void)downloadTextsWithArea:(NSString*)theArea withIntentionSlugs:(NSArray*)theIntentionSlugs withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *textIds, NSError *error))block;
/* Downloads the texts for a given intention slug with an asynchruous NSURLSession data tas **/
-(void)downloadTextsWithArea:(NSString*)theArea withIntentionSlug:(NSString *)intentionSlug withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *textIds, NSError *error))block;

#pragma mark - Intention Download Methods

/* currently not supported, the data is not saved. **/
-(void)downloadAllIntentionsWithCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *intentionIds, NSError *error))block;
/* Downloads all the intentions associated with an area. **/
-(void)downloadIntentionsWithArea:(NSString*)theArea withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *intentionIds, NSError *error))block;

#pragma mark - Text Dwonload Methods

/* Downloads all areas  **/
-(void)downloadAllAreasWithCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *areaIds, NSError *error))block;
/* Download Area for the given area name with the given culture **/
-(void)downloadArea:(NSString*)theAreaName withCulture:(NSString*)theCulture withCompletion:(void (^)(NSString *areaId, NSError *error))block;

@end

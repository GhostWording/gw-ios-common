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
#import "GWImage.h"

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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"culture like[c] '%@'", theCulture]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWIntention"];
    [request setPredicate:predicate];
    
    NSArray *theIntentions = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theIntentions;
}

-(NSArray*)fetchIntentionsWithArea:(NSString*)theArea withCulture:(NSString*)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"culture like[c] '%@' AND areaName like[c] '%@'", theCulture, theArea]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWIntention"];
    [request setPredicate:predicate];
    
    NSArray *intentions = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return intentions;
}

// MARK: Text methods

-(NSInteger)fetchNumTexts {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setIncludesSubentities:NO];
    
    NSInteger count = [[[GWCoreDataManager sharedInstance] mainObjectContext] countForFetchRequest:request error:nil];
        
    return count;
}

-(NSArray*)fetchTexts {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"culture like[c] '%@'", theCulture]];
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionId like[c] '%@' AND culture like[c] '%@'", theIntentionId, theCulture]];
    NSLog(@"predicate for intention id and culture is: %@", predicate);
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionId IN %@ and culture like[c] %@", theIntentionIds, theCulture];
    NSLog(@"predicate is: %@", predicate);
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionLabel like[c] '%@' AND culture like[c] '%@'", theIntentionSlug, theCulture]];
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intentionLabel IN %@ AND culture like[c] %@", theIntentionSlugs, theCulture];
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionId like[c] '%@' AND '%@' IN tagIds AND culture like[c] '%@'", theIntentionId, recipientTypeTag, theCulture]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug andRecipientType:(NSString *)recipientTypeTag {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionLabel like[c] '%@' AND '%@' IN tagIds", theIntentionSlug, recipientTypeTag]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}


-(NSArray*)fetchTextsForIntentionSlug:(NSString *)theIntentionSlug andRecipientType:(NSString *)recipientTypeTag withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionLabel like[c] '%@' AND '%@' IN tagIds AND culture like[c] '%@'", theIntentionSlug, recipientTypeTag, theCulture]];
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

// MARK: Image methods

-(NSArray*)randomIndexesFromArray:(NSArray*)theArray withNumRandomIndexes:(NSInteger)numRandomIndexes {
    
    if (numRandomIndexes >= theArray.count) {
        return theArray;
    }
    
    NSMutableArray *allRandomImages = [NSMutableArray arrayWithArray:theArray];
    NSMutableArray *randomImages = [NSMutableArray array];
    
    while (randomImages.count != numRandomIndexes && allRandomImages.count != 0) {
        int position = arc4random_uniform((int)allRandomImages.count);
        [randomImages addObject:[allRandomImages objectAtIndex:position]];
        [allRandomImages removeObjectAtIndex:position];
    }
    
    return randomImages;
}

-(NSInteger)fetchNumImages {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWImage"];
    [request setIncludesSubentities:NO];
    
    NSInteger count = [[[GWCoreDataManager sharedInstance] mainObjectContext] countForFetchRequest:request error:nil];
    
    return count;
}

-(NSArray*)fetchRandomImagesWithNum:(int)numImages {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWImage"];
    
    NSMutableArray *theImagesToReturn = [NSMutableArray array];
    
    NSArray *theImages = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    NSMutableArray *allMutableImages = [NSMutableArray arrayWithArray:theImages];
    
    int imagesFound = 0;
    
    while (imagesFound != numImages && allMutableImages.count > 0) {
        int randPos = arc4random_uniform((int)allMutableImages.count);
        [theImagesToReturn addObject:[allMutableImages objectAtIndex:randPos]];
        [allMutableImages removeObjectAtIndex:randPos];
        imagesFound = imagesFound + 1;
    }
    
    return theImagesToReturn;
}

-(NSArray*)fetchImages {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWImage"];
    
    NSArray *theImages = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:request error:nil];
    
    return theImages;
    
}

-(NSArray*)fetchImagesWithImagePaths:(NSArray *)theImagePaths {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"imageId IN %@", theImagePaths];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"GWImage"];
    [fetchRequest setPredicate:predicate];
    
    NSArray *theImages = [[[GWCoreDataManager sharedInstance] mainObjectContext] executeFetchRequest:fetchRequest error:nil];
    
    return theImages;
}

-(NSArray*)fetchRandomImagesOnBackgroundThreadWithNum:(int)numImages {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWImage"];
    
    NSMutableArray *theImagesToReturn = [NSMutableArray array];
    
    NSArray *theImages = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    NSMutableArray *allMutableImages = [NSMutableArray arrayWithArray:theImages];
    
    int imagesFound = 0;
    
    while (imagesFound != numImages && allMutableImages.count > 0) {
        int randPos = arc4random_uniform((int)allMutableImages.count);
        [theImagesToReturn addObject:[allMutableImages objectAtIndex:randPos]];
        [allMutableImages removeObjectAtIndex:randPos];
        imagesFound = imagesFound + 1;
    }
    
    return allMutableImages;
}

-(NSArray*)fetchImagesOnBackgroundThread {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWImage"];
    
    NSArray *theImages = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theImages;
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"culture like[c] '%@'", theCulture]];
    NSLog(@"predicate is: %@", predicate);
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWIntention"];
    [request setPredicate:predicate];
    
    NSArray *theIntentions = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theIntentions;
}

-(NSArray*)fetchIntentionsOnBackgroundThreadWithArea:(NSString *)theAreaName withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"culture like[c] '%@' AND areaName like[c] '%@'", theCulture, theAreaName]];
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"culture like[c] '%@'", theCulture]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionId:(NSString *)theIntentionID withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionId like[c] '%@' AND culture like[c] '%@'", theIntentionID, theCulture]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionId:(NSString *)theIntentionID withRecipientType:(NSString *)recipientTypeTag withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionId like[c] '%@' AND '%@' IN tagIds AND culture like[c] '%@'", theIntentionID, recipientTypeTag, theCulture]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionSlug:(NSString *)theIntentionSlug withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionLabel like[c] '%@' AND culture like[c] '%@'", theIntentionSlug, theCulture]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}

-(NSArray*)fetchTextsOnBackgroundThreadForIntentionSlug:(NSString *)theIntentionSlug withRecipientType:(NSString *)recipientTypeTag withCulture:(NSString *)theCulture {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"intentionLabel like[c] '%@' AND '%@' in tagIds AND culture like[c] '%@'", theIntentionSlug, recipientTypeTag, theCulture]];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GWText"];
    [request setPredicate:predicate];
    
    NSArray *theTexts = [[[GWCoreDataManager sharedInstance] childContext] executeFetchRequest:request error:nil];
    
    return theTexts;
}


#pragma mark - Local Data Store Helper Methods

// MARK: Search methods

-(GWText*)textWithId:(NSString *)theTextId inArray:(NSArray *)theArray {
    for (GWText *theText in theArray) {
        //NSLog(@"the text is: %@", theText);
        if ([theText.textId isEqualToString:theTextId]) {
            //NSLog(@"Found text with id");
            return theText;
        }
    }
    
    return nil;
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

/* New functions so that we don't overwrit the same intentions with different areas. **/
-(GWIntention*)intentionWithId:(NSString *)theIntentionId andAreaName:(NSString*)theAreaName inArray:(NSArray *)theArray {
    for (GWIntention *theIntention in theArray) {
        if ([theIntention.intentionId isEqualToString:theIntentionId] && [theIntention.areaName isEqualToString:theAreaName]) {
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

-(GWImage*)imageWithId:(NSString *)theImageId inArray:(NSArray *)theArray {
    
    for (GWImage *theImage in theArray) {
        if ([theImage.imageId isEqualToString:theImageId]) {
            return theImage;
        }
    }
    
    return nil;
}

// MARK: data manipulation methods

-(NSArray*)removeImagePathsInArray:(NSArray*)theImagePaths withImagePathsToRemove:(NSArray*)theImagePathsToRemove {
    
    NSMutableArray *imagePathsToReturn = [NSMutableArray arrayWithArray:theImagePaths];
    
    for (NSString *imagePathToRemove in theImagePathsToRemove) {
        
        for (int i = 0; i < imagePathsToReturn.count; i++) {
            
            NSString *theImagePath = [imagePathsToReturn objectAtIndex:i];
            
            if ([imagePathToRemove isEqualToString:theImagePath]) {
                [imagePathsToReturn removeObject:theImagePath];
                --i;
            }
        }
        
    }
    
    return imagePathsToReturn;
}

-(NSArray *)removeImagePathsInArray:(NSArray*)theImagePaths withImagesToRemove:(NSArray*)theImagesToRemove {
    
    NSMutableArray *imagePathsToReturn = [NSMutableArray arrayWithArray:theImagePaths];
    
    for (GWImage *theImage in theImagesToRemove) {
        
        for (int i = 0; i < imagePathsToReturn.count; i++) {
            
            NSString *theImagePath = [imagePathsToReturn objectAtIndex:i];
            
            if ([theImage.imageId isEqualToString:theImagePath]) {
                [imagePathsToReturn removeObject:theImagePath];
                --i;
            }
        }
        
    }
    
    return imagePathsToReturn;
    
}

// MARK: persist and update methods

-(GWText*)persistTextOrUpdateWithJson:(NSDictionary*)textJson withArray:(NSArray*)theArray withContext:(NSManagedObjectContext*)theContext {
    
    NSString *textId = [textJson objectForKey:@"TextId"];
    //NSLog(@"text id is: %@", textId);
    GWText *theText = [self textWithId:textId inArray:theArray];
    
    if (theText == nil) {
        theText = [GWText createGWTextWithDict:textJson withContext:theContext];
        //NSLog(@"create text");
    }
    else {
        [theText updateTextWithDict:textJson withContext:theContext];
        //NSLog(@"updating text");
    }
    
    return theText;
}

-(GWIntention*)persistIntentionOrUpdateWithAreaName:(NSString*)theAreaName withJson:(NSDictionary*)intentionJson withArray:(NSArray*)theArray withContext:(NSManagedObjectContext*)theContext {
    
    NSString *intentionId = [intentionJson objectForKey:@"IntentionId"];
    
    GWIntention *theIntention = [self intentionWithId:intentionId andAreaName:theAreaName inArray:theArray];
    
    if (theIntention == nil) {
        theIntention = [GWIntention createGWIntentionWithAreaName:theAreaName withDict:intentionJson withContext:theContext];
    }
    else {
        [theIntention updateIntentionWithAreaName:theAreaName withDict:intentionJson withContext:theContext];
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

-(GWImage*)persistImageIfNotExistWithImageId:(NSString*)theImageId withImageData:(NSData*)theImageData withImageIds:(NSArray*)theImageIds withContext:(NSManagedObjectContext*)theContext {
    
    GWImage *theImage = [self imageWithId:theImageId inArray:theImageIds];
    
    if (theImage == nil) {
        theImage = [GWImage createGWImageWithImagePath:theImageId withImageData:theImageData withManagedContext:theContext];
    }
    
    return theImage;
    
}

#pragma mark - Server Comm

-(void)downloadImagesAndPersistWithRelativePath:(NSString*)theRelativePath withNumImagesToDownload:(NSInteger)theNumImages withCompletion:(void(^)(NSArray *theImageIds, NSError *error))block {
    [block copy];
    
    NSLog(@"Relative path is: %@", theRelativePath);
    
    [serverComm downloadImageIdsForRelativePath:theRelativePath withCompletion:^(NSArray *theImagePaths, NSError *error) {
       
        GWDataManager *newDataMan = [[GWDataManager alloc] init];
        
        //NSLog(@"all image paths downloaded: %d", (int)theImageIds.count);
        
        NSLog(@"image paths are: %@", theImagePaths);
        
        // fetch all the images in the datastore
        NSArray *allImages = [newDataMan fetchImagesOnBackgroundThread];
        NSLog(@"all images to persist are: %d", (int)allImages.count);
        // remove the images that we have in the datastore from the paths sent from the array
        NSArray *imagePathsLeft = [newDataMan removeImagePathsInArray:theImagePaths withImagesToRemove:allImages];
        NSLog(@"the image paths left: %d", (int)imagePathsLeft.count);
        
        if (imagePathsLeft.count == 0) {
            block([NSArray array], nil);
            return ;
        }
        
        // get random image paths from those left based on the num images to download
        NSArray *randomImagePaths = [newDataMan randomIndexesFromArray:imagePathsLeft withNumRandomIndexes:theNumImages];
        NSLog(@"num random images: %d", (int)randomImagePaths.count);
        
        [newDataMan downloadImagesWithUrls:randomImagePaths withCompletion:^(NSArray *theImagePaths, NSError *error) {
            
            block(theImagePaths, error);
            
        }];

        
    }];
    
}

-(void)downloadImagesAndPersistWithIntentionSlug:(NSString *)theIntentionSlug withNumImagesToDownload:(NSInteger)theNumImages withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadImageIdsForIntentionSlug:theIntentionSlug withCompletion:^(NSArray *theImageIds, NSError *error) {
       
        GWDataManager *newDataMan = [[GWDataManager alloc] init];
        
        //NSLog(@"all image paths downloaded: %d", (int)theImageIds.count);
        
        // fetch all the images in the datastore
        NSArray *allImages = [newDataMan fetchImagesOnBackgroundThread];
        NSLog(@"all images to persist are: %d", (int)allImages.count);
        // remove the images that we have in the datastore from the paths sent from the array
        NSArray *imagePathsLeft = [newDataMan removeImagePathsInArray:theImageIds withImagesToRemove:allImages];
        NSLog(@"the image paths left: %d", (int)imagePathsLeft.count);
        
        if (imagePathsLeft.count == 0) {
            block([NSArray array], nil);
            return ;
        }
        
        // get random image paths from those left based on the num images to download
        NSArray *randomImagePaths = [newDataMan randomIndexesFromArray:imagePathsLeft withNumRandomIndexes:theNumImages];
        NSLog(@"num random images: %d", (int)randomImagePaths.count);
        
        [newDataMan downloadImagesWithUrls:randomImagePaths withCompletion:^(NSArray *theImagePaths, NSError *error) {
            
            block(theImagePaths, error);
            
        }];
        
    }];
    
}

-(void)downloadImagesAndPersistWithRecipientId:(NSString *)theRecipientId withNumImagesToDownload:(NSInteger)theNumImages withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadImageIdsForRecipientId:theRecipientId withCompletion:^(NSArray *theImageIds, NSError *error) {
       
        GWDataManager *newDataMan = [[GWDataManager alloc] init];
        
        // fetch all the image in the datastore
        NSArray *allImages = [newDataMan fetchImagesOnBackgroundThread];
        // remove the images that we have in the datastore from the paths sent form the array
        NSArray *imagePathsLeft = [newDataMan removeImagePathsInArray:theImageIds withImagesToRemove:allImages];
        
        if (imagePathsLeft.count == 0) {
            block([NSArray array], nil);
            return ;
        }
        
        // get random image paths from those left based on the num images to download
        NSArray *randomImagePaths = [newDataMan randomIndexesFromArray:imagePathsLeft withNumRandomIndexes:theNumImages];
        
        [newDataMan downloadImagesWithUrls:randomImagePaths withCompletion:^(NSArray *theImagePaths, NSError *error) {
           
            block(theImagePaths, error);
            
        }];
        
    }];
}

-(void)downloadImagePathsWithRelativePath:(NSString*)theRelativePath withCompletion:(void (^)(NSArray *theImagePaths, NSError *error))block {
    [block copy];
    
    [serverComm downloadImageIdsForRelativePath:theRelativePath withCompletion:block];
}

-(void)downloadImagePathsWithIntentionSlug:(NSString *)theIntentionSlug withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadImageIdsForIntentionSlug:theIntentionSlug withCompletion:^(NSArray *theIntentionSlugs, NSError *error) {
       
        block(theIntentionSlugs, error);
    }];
}

-(void)downloadImagePathsWithRecipientId:(NSString *)theRecipientId withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadImageIdsForRecipientId:theRecipientId withCompletion:^(NSArray *theImagePaths, NSError *error) {
       
        block(theImagePaths, error);
        
    }];
}

-(void)downloadImagesWithUrls:(NSArray *)theImageUrls withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSMutableArray *theImages = [NSMutableArray array];
    int allImagesCount = (int)theImageUrls.count;
    __block int numImages = 0;
    
    for (NSString *theImagePath in theImageUrls) {
        
        [self downloadImageWithUrl:theImagePath withCompletion:^(NSString *theImageId, NSError *error) {
            NSLog(@"dowloaded image with url: %@", theImagePath);
            if (theImageId != nil) {
                [theImages addObject:theImageId];
            }
            
            numImages = numImages + 1;
                        
            if (numImages == allImagesCount) {
                NSLog(@"all images to download: %d, num images downloaded: %d", numImages, allImagesCount);
                block(theImages, nil);
            }
            
        }];
        
    }
    
}

-(void)downloadImageWithUrl:(NSString*)theImageUrl withCompletion:(void (^)(NSString *imageId, NSError *error))block {
    [block copy];
    
    NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
    
    NSData *theData = [serverComm downloadImageWithImagePath:theImageUrl];
    
    if (theData == nil) {
        block(nil, [NSError errorWithDomain:@"api.cvd.io" code:1000 userInfo:@{NSLocalizedDescriptionKey : @"No image found"}]);
    }
    else {
        GWImage *theImage = [GWImage createGWImageWithImagePath:theImageUrl withImageData:theData withManagedContext:childContext];
        
        [childContext save:nil];
        
        //[[GWCoreDataManager sharedInstance] saveContext];
        
        block(theImage.imageId, nil);
    }
  
}

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
        
        NSMutableArray *textToReturn = [NSMutableArray array];
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        GWDataManager *dataMan = [[GWDataManager alloc] init];
        NSArray *textsForIntention = [dataMan fetchTextsOnBackgroundThreadForIntentionId:intentionId withCulture:theCulture];
        NSLog(@"Texts for intention: %@", textsForIntention);
        
        for (NSDictionary *textJson in theTexts) {
            
            GWText *text = [dataMan persistTextOrUpdateWithJson:textJson withArray:textsForIntention withContext:childContext];
            [textToReturn addObject:text.textId];
            
        }
        
        NSLog(@"texts after for loop");
        [childContext save:nil];
        
        //[[GWCoreDataManager sharedInstance] saveContext];
        
        block(textToReturn, error);
        
    }];
}

-(void)downloadTextsWithArea:(NSString *)theArea withIntentionSlugs:(NSArray *)theIntentionSlugs withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    
    [self downloadTextsRecursiveWithArea:theArea withIntentionSlugs:theIntentionSlugs withCulture:theCulture withNum:0 withCompletion:block];
    
    /*
    
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
    */
}

-(void)downloadTextsRecursiveWithArea:(NSString*)theArea withIntentionSlugs:(NSArray*)theIntentionSlugs withCulture:(NSString*)theCulture withNum:(int)theNumber withCompletion:(void (^)(NSArray*, NSError*))block {
    [block copy];
    
    
    if (theNumber >= theIntentionSlugs.count) {
        NSLog(@"finished iterating through all intentions");
        block(nil, nil);
        return ;
    }
    else {
        
        __strong typeof (self) wSelf = self;
        
        NSString *intentionToDownload = [theIntentionSlugs objectAtIndex:theNumber];
        [self downloadTextsWithArea:theArea withIntentionSlug:intentionToDownload withCulture:theCulture withCompletion:^(NSArray *textIds, NSError *error) {
           
            if (!error) {
                NSLog(@"weak self is: %@", wSelf);
                [wSelf downloadTextsRecursiveWithArea:theArea withIntentionSlugs:theIntentionSlugs withCulture:theCulture withNum:(theNumber + 1) withCompletion:block];
            }
            else {
                block(nil, error);
            }
            
        }];
    }
    
    
    
}


-(void)downloadTextsWithArea:(NSString *)theArea withIntentionSlug:(NSString *)intentionSlug withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    [serverComm downloadTextsWithAreaName:theArea withIntentionSlug:intentionSlug withCulture:theCulture withCompletion:^(NSArray *theTexts, NSError *error) {
        
        NSMutableArray *textToReturn = [NSMutableArray array];
        NSManagedObjectContext *childContext = [[GWCoreDataManager sharedInstance] childContext];
        GWDataManager *dataMan = [[GWDataManager alloc] init];
        NSArray *textsForIntentionSlug = [dataMan fetchTextsOnBackgroundThreadForIntentionSlug:intentionSlug withCulture:theCulture];
        
        for (NSDictionary *textJson in theTexts) {
            
            GWText *text = [dataMan persistTextOrUpdateWithJson:textJson withArray:textsForIntentionSlug withContext:childContext];
            [textToReturn addObject:text.textId];
            
        }
        
        NSLog(@"texts after for loop");
        [childContext save:nil];
        
        //[[GWCoreDataManager sharedInstance] saveContext];
        
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
        NSLog(@"intentions for culture: %d", (int)intentionsForCulture.count);
        
        for (NSDictionary *jsonDict in intentions) {
            GWIntention *intention = [dataMan persistIntentionOrUpdateWithAreaName:theArea withJson:jsonDict withArray:intentionsForCulture withContext:childContext];
            [intentionsToReturn addObject:intention.intentionId];
        }
        
        [childContext save:nil];
        
        //[[GWCoreDataManager sharedInstance] saveContext];
        
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
        
        //[[GWCoreDataManager sharedInstance] saveContext];
        
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

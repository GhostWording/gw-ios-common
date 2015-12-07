//
//  GWRealmDataManager.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>

@interface GWRealmDataManager : NSObject

#pragma mark - Fetching

- (RLMResults *)fetchImages;
- (RLMResults *)fetchImagesWithIds:(NSArray *)theImageIds;

/** to be used when the application has only a single area */
- (RLMResults *)fetchIntentionsWithCulture:(NSString *)theCulture;
- (RLMResults *)fetchIntentionsWithCulture:(NSString *)theCulture intentionId:(NSString *)theIntentionId;
/** to be used when the application has multiple areas, the intentions are discerned based on their areas */
- (RLMResults *)fetchIntentionsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName intentionId:(NSString *)theIntentionId;


- (RLMResults *)fetchTextsWithCulture:(NSString *)theCulture;
- (RLMResults *)fetchTextsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName;
- (RLMResults *)fetchTextsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName intentionId:(NSString *)theIntentionId;
- (RLMResults *)fetchTextsWithCulture:(NSString *)theCulture areaName:(NSString *)theAreaName textId:(NSString *)theTextId;

#pragma mark - Downloading

- (void)downloadAllTextsWithArea:(NSString *)theArea culture:(NSString *)theCulture withCompletion:(void (^)(NSArray *theIntentions, NSArray *theTexts, NSError *error))block;

- (void)downloadIntentionsWithArea:(NSString *)theArea culture:(NSString *)theCulture withCompletion:(void (^)(NSArray *theIntentions, NSError *theError))block;

- (void)downloadTextsWithArea:(NSString *)theArea intentionId:(NSString *)theIntentionId culture:(NSString *)theCulture withCompletion:(void (^)(NSArray *theTexts, NSError *error))block;


// used to persist text based on the json data with a given culture and intention
-(NSArray *)updateOrPersistTextWithRealm:(RLMRealm *)theRealm area:(NSString *)theArea culture:(NSString *)theCulture texts:(NSArray *)theTexts;
-(NSArray *)updateOrPersistTextWithRealm:(RLMRealm *)theRealm area:(NSString *)theArea culture:(NSString *)theCulture intentionId:(NSString *)theIntentionId texts:(NSArray *)theTexts;

#pragma mark - Image Downloading

- (void)downloadImagesWithRelativePath:(NSString *)theRelativePath withCompletion:(void (^)(NSArray *theImages, NSError *theError))block;

- (void)downloadImagesWithIntentionId:(NSString *)theIntentionId withCompletion:(void (^)(NSArray *theImages, NSError *theError))block;

- (void)downloadimagesWithRecipientId:(NSString *)theRecipientId withCompletion:(void (^)(NSArray *theImages, NSError *theError))block;

@end

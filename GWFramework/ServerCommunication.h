//
//  ServerCommunication.h
//  GWFramework
//
//  Created by Mathieu Skulason on 20/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCommunication : NSObject

-(id)initWithAreaName:(NSString*)theAreaName;
-(id)initWithAreaName:(NSString *)theAreaName andAcceptLanguage:(NSString*)theAcceptLanguage;

@property (nonatomic, strong) NSString *areaName;
@property (nonatomic, strong) NSString *acceptLanguage;

// Mark: Theme download
-(void)downloadImageThemesWithCompletion:(void (^)(NSDictionary *theImageThemes, NSError *error))block;

// MARK: Image download
-(void)downloadImageIdsForRelativePath:(NSString*)theRelativePath withCompletion:(void (^)(NSArray *theImagePaths, NSError *error))block;
-(void)downloadImageIdsForIntentionSlug:(NSString*)theIntentionSlug withCompletion:(void (^)(NSArray *theImagePaths, NSError *error))block;
-(void)downloadImageIdsForRecipientId:(NSString*)theRecipientId withCompletion:(void (^)(NSArray *theImagePaths, NSError *error))block;
-(NSData*)downloadImageWithRelativeImagePath:(NSString*)theImagePath;
-(NSData*)downloadImageWithImageURL:(NSString *)theImagePath;

// MARK: Text Downloads
-(void)downloadTextsWithAreaName:(NSString*)theAreaName withIntentionId:(NSString*)theIntentionId withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *theTexts, NSError *error))block;
-(void)downloadTextsWithAreaName:(NSString *)theAreaName withIntentionSlug:(NSString *)theIntentionSlug withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *, NSError *))block;

// MARK: Intention downloads

/* Currently not supported as the data is not fully constructed **/
-(void)downloadAllIntentionsWithCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *intentions, NSError *error))block;
-(NSURLSessionDataTask *)downloadIntentionsWithArea:(NSString*)theArea withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *intentions, NSError *error))block;

// MARK: Area Downloads

-(void)downloadAllAreasWithCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *theAreas, NSError *error))block;
-(void)downloadArea:(NSString*)theAreaName withCulture:(NSString*)theCulture withCompletion:(void (^)(NSArray *intentions, NSError *error))block;

@end

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

-(void)downloadTextsWithAreaName:(NSString*)theAreaName withIntentionId:(NSString*)theIntentionId withCompletion:(void (^)(NSArray *theTexts, NSError *error))block;
-(void)downloadTextsWithAreaName:(NSString *)theAreaName withIntentionSlug:(NSString *)theIntentionSlug withCompletion:(void (^)(NSArray *, NSError *))block;

// Text Downloads
-(void)downloadTextsWithIntentionsIds:(NSArray*)theIntentionIds withCompletion:(void (^)(BOOL finished, NSArray *theTexts, NSError *error))block;
-(void)downloadTextsWithIntentionSlugs:(NSArray*)theIntnetionSlugs withCompletion:(void (^)(BOOL finished, NSArray *theTexts, NSError *error))block;
-(void)downloadTextsWithIntentionId:(NSString*)theIntentionId withCompletion:(void (^)(NSArray *theTexts, NSError *error))block;
-(void)downloadTextsWithIntentionSlug:(NSString*)theIntentionSlug withCompletion:(void (^)(NSArray *theTexts, NSError *error))block;

// Intention downloads

/* Currently not supported as the data is not fully constructed **/
-(void)downloadAllIntentions:(void (^)(NSArray *intentions, NSError *error))block;
-(void)downloadIntentionsWithArea:(NSString*)theArea withCompletion:(void (^)(NSArray *intentions, NSError *error))block;

// Area Downloads

-(void)downloadAllAreasWithCompletion:(void (^)(NSArray *theAreas, NSError *error))block;
-(void)downloadArea:(NSString*)theAreaName withCompletion:(void (^)(NSArray *intentions, NSError *error))block;

@end

//
//  GWDataManager.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWDataManager : NSObject

-(void)downloadTextsForIntention:(NSString*)intentionId withCompletion:(void (^)(NSArray *textIds, NSError *error))block;
-(void)downloadTextsForIntentionSlug:(NSString *)intentionSlug withCompletion:(void (^)(NSArray *textIds, NSError *error))block;

-(NSArray*)fetchTexts;
-(NSArray*)fetchTextsForIntentionId:(NSString*)theIntentionId;

@end

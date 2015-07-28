//
//  GWTag.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GWCoreDataManager.h"

@class GWText;

@interface GWTag : NSManagedObject

@property (nonatomic, retain) NSString * tagId;
@property (nonatomic, retain) GWText *text;

+(instancetype)createGWTag;
+(instancetype)createGWTagWithContext:(NSManagedObjectContext*)theContext;
+(instancetype)createGWTagWithId:(NSString*)theTagId andText:(GWText*)theText withContext:(NSManagedObjectContext*)theContext;

-(void)updateTagWithId:(NSString*)theTagId andText:(GWText*)theText;

@end

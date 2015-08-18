//
//  GWIntentionAreaBehavior.h
//  GWFramework
//
//  Created by Mathieu Skulason on 18/08/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GWIntention;

@interface GWIntentionAreaBehavior : NSManagedObject

@property (nonatomic, retain) NSNumber * hasImage;
@property (nonatomic, retain) NSString * imagePath;
@property (nonatomic, retain) NSString * areaName;
@property (nonatomic, retain) NSNumber * sortOrderInArea;
@property (nonatomic, retain) GWIntention *intention;

+(instancetype)createGWIntentionAreaBehavior;
+(instancetype)createGWIntentionAreaBehaviorWithContext:(NSManagedObjectContext*)theContext;
+(instancetype)createGWIntentionAreaBehaviorWithDict:(NSDictionary*)jsonDict withIntention:(GWIntention*)theIntention withContext:(NSManagedObjectContext*)theContext;

-(void)updateGWIntentionAreaBehaviorWithDict:(NSDictionary*)jsonDict withIntention:(GWIntention*)theIntention;

@end

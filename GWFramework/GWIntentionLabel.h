//
//  GWIntentionLabel.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GWCoreDataManager.h"

@class GWIntention;

@interface GWIntentionLabel : NSManagedObject

@property (nonatomic, retain) NSString * intentionId;
@property (nonatomic, retain) NSString * culture;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString * slug;
@property (nonatomic, retain) GWIntention *intention;

+(instancetype)createGWIntention;
+(instancetype)createGWIntentionWithDict:(NSDictionary*)jsonDict withIntention:(GWIntention*)theIntention withContext:(NSManagedObjectContext*)theContext;

-(void)updateIntentionLabelWithDict:(NSDictionary*)jsonDict withIntention:(GWIntention*)theIntention;

@end

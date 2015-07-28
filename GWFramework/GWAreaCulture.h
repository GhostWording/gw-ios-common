//
//  GWAreaCulture.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GWArea;

@interface GWAreaCulture : NSManagedObject

@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) GWArea *area;

+(instancetype)createAreaCulture;
+(instancetype)createAreaCultureWithContext:(NSManagedObjectContext*)theContext;
+(instancetype)createAreaCultureFromDict:(NSDictionary*)jsonDict withArea:(GWArea*)theArea withContext:(NSManagedObjectContext*)theContext;

-(void)updateAreaCultureWithDict:(NSDictionary*)jsonDict withArea:(GWArea*)theArea;

@end

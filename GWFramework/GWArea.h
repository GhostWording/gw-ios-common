//
//  GWArea.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GWAreaCulture;

@interface GWArea : NSManagedObject

@property (nonatomic, retain) NSString * areaId;
@property (nonatomic, retain) NSDate * lastChangeTime;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *availableCultures;

+(instancetype)createArea;
+(instancetype)createAreaWithContext:(NSManagedObjectContext*)theContext;
+(instancetype)createAreaWithDict:(NSDictionary*)jsonDict withContext:(NSManagedObjectContext*)theContext;

-(void)updateAreaWithDict:(NSDictionary*)jsonDict withContext:(NSManagedObjectContext*)theContext;

@end

@interface GWArea (CoreDataGeneratedAccessors)

- (void)insertObject:(GWAreaCulture *)value inAvailableCulturesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromAvailableCulturesAtIndex:(NSUInteger)idx;
- (void)insertAvailableCultures:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeAvailableCulturesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInAvailableCulturesAtIndex:(NSUInteger)idx withObject:(GWAreaCulture *)value;
- (void)replaceAvailableCulturesAtIndexes:(NSIndexSet *)indexes withAvailableCultures:(NSArray *)values;
- (void)addAvailableCulturesObject:(GWAreaCulture *)value;
- (void)removeAvailableCulturesObject:(GWAreaCulture *)value;
- (void)addAvailableCultures:(NSOrderedSet *)values;
- (void)removeAvailableCultures:(NSOrderedSet *)values;
@end

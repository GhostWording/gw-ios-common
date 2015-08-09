//
//  GWIntention.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GWCoreDataManager.h"

@class NSManagedObject;

@interface GWIntention : NSManagedObject

@property (nonatomic, retain) NSString * areaId;
@property (nonatomic, retain) NSNumber * sortOrderInArea;
@property (nonatomic, retain) NSNumber * hasImage;
@property (nonatomic, retain) NSString * imagePath;
@property (nonatomic, retain) NSString * intentionId;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSString * culture;
@property (nonatomic, retain) NSString * intentionDescription;
@property (nonatomic, retain) NSString * slug;
@property (nonatomic, retain) NSString * slugPrototypeLink;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSDate * mostRecentTextUpdate;
@property (nonatomic, retain) NSNumber * mostRecentTextUpdateEpoch;
@property (nonatomic, retain) NSNumber * weightingCoefficient;
@property (nonatomic, retain) NSString * recurring;
@property (nonatomic, retain) NSString * impersonal;
@property (nonatomic, retain) NSOrderedSet *labels;

+(instancetype)createGWIntention;
+(instancetype)createIntentionWithContext:(NSManagedObjectContext*)theContext;
+(instancetype)createGWIntentionWithDict:(NSDictionary*)jsonDict withContext:(NSManagedObjectContext*)theContext;

-(void)updateIntentionWithDict:(NSDictionary*)jsonDict withContext:(NSManagedObjectContext*)theContext;

@end

@interface GWIntention (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inLabelsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromLabelsAtIndex:(NSUInteger)idx;
- (void)insertLabels:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeLabelsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInLabelsAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceLabelsAtIndexes:(NSIndexSet *)indexes withLabels:(NSArray *)values;
- (void)addLabelsObject:(NSManagedObject *)value;
- (void)removeLabelsObject:(NSManagedObject *)value;
- (void)addLabels:(NSOrderedSet *)values;
- (void)removeLabels:(NSOrderedSet *)values;
@end

//
//  GWIntention.h
//  GWFramework
//
//  Created by Mathieu Skulason on 18/08/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GWIntentionAreaBehavior, GWIntentionLabel;

@interface GWIntention : NSManagedObject

@property (nonatomic, retain) NSString * culture;
@property (nonatomic, retain) NSString * imagePath;
@property (nonatomic, retain) NSNumber * hasImage;
@property (nonatomic, retain) NSString * impersonal;
@property (nonatomic, retain) NSString * intentionDescription;
@property (nonatomic, retain) NSString * intentionId;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString *mediaUrl;
@property (nonatomic, retain) NSDate * mostRecentTextUpdate;
@property (nonatomic, retain) NSNumber * mostRecentTextUpdateEpoch;
@property (nonatomic, retain) NSString * recurring;
@property (nonatomic, retain) NSString * slug;
@property (nonatomic, retain) NSString * slugPrototypeLink;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) NSNumber * weightingCoefficient;
@property (nonatomic, retain) NSNumber * sortOrderInArea;
@property (nonatomic, retain) NSString * areaName;
@property (nonatomic, retain) NSOrderedSet *labels;
@property (nonatomic, retain) NSSet *intentionBehavior;

+(instancetype)createGWIntention;
+(instancetype)createIntentionWithContext:(NSManagedObjectContext*)theContext;
+(instancetype)createGWIntentionWithAreaName:(NSString*)theAreaName withDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext;

/* Updates the intention with the given json dictionary values. **/
-(void)updateIntentionWithAreaName:(NSString*)theAreaName withDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext;

@end

@interface GWIntention (CoreDataGeneratedAccessors)

- (void)insertObject:(GWIntentionLabel *)value inLabelsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromLabelsAtIndex:(NSUInteger)idx;
- (void)insertLabels:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeLabelsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInLabelsAtIndex:(NSUInteger)idx withObject:(GWIntentionLabel *)value;
- (void)replaceLabelsAtIndexes:(NSIndexSet *)indexes withLabels:(NSArray *)values;
- (void)addLabelsObject:(GWIntentionLabel *)value;
- (void)removeLabelsObject:(GWIntentionLabel *)value;
- (void)addLabels:(NSOrderedSet *)values;
- (void)removeLabels:(NSOrderedSet *)values;
- (void)addIntentionBehaviorObject:(GWIntentionAreaBehavior *)value;
- (void)removeIntentionBehaviorObject:(GWIntentionAreaBehavior *)value;
- (void)addIntentionBehavior:(NSSet *)values;
- (void)removeIntentionBehavior:(NSSet *)values;

@end

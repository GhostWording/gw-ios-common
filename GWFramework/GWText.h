//
//  GWText.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GWCoreDataManager.h"

@class NSManagedObject;

@interface GWText : NSManagedObject

@property (nonatomic, retain) NSString * abstract;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * culture;
@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) NSString * impersonal;
@property (nonatomic, retain) NSString * intentionId;
@property (nonatomic, retain) NSString * intentionLabel;
@property (nonatomic, retain) NSNumber * isQuote;
@property (nonatomic, retain) NSString * politeForm;
@property (nonatomic, retain) NSString * prototypeId;
@property (nonatomic, retain) NSString * proximity;
@property (nonatomic, retain) NSString * referenceUrl;
@property (nonatomic, retain) NSString * sender;
@property (nonatomic, retain) NSNumber * sortBy;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * target;
@property (nonatomic, retain) NSString * textId;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) NSString * tagsString;
@property (nonatomic, retain) NSOrderedSet *tagIds;

+(instancetype)createGWText;
+(instancetype)createGWTextWithDict:(NSDictionary*)jsonDict;
+(instancetype)createGWTextWithDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext*)theContext;

-(void)updateTextWithDict:(NSDictionary*)jsonDict withContext:(NSManagedObjectContext*)theContext;

@end

@interface GWText (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inTagIdsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTagIdsAtIndex:(NSUInteger)idx;
- (void)insertTagIds:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTagIdsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTagIdsAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceTagIdsAtIndexes:(NSIndexSet *)indexes withTagIds:(NSArray *)values;
- (void)addTagIdsObject:(NSManagedObject *)value;
- (void)removeTagIdsObject:(NSManagedObject *)value;
- (void)addTagIds:(NSOrderedSet *)values;
- (void)removeTagIds:(NSOrderedSet *)values;
@end

//
//  GWRLMIntention.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import <Realm.h>
#import "RLMObject.h"
#import "GWRLMIntetionBehavior.h"

@interface GWRLMIntention : RLMObject

@property NSString * culture;
@property NSString * imagePath;
@property BOOL hasImage;
@property NSString * impersonal;
@property NSString * intentionDescription;
@property NSString * intentionId;
@property NSString * label;
@property NSDate * mostRecentTextUpdate;
@property long mostRecentTextUpdateEpoch;
@property NSString * recurring;
@property NSString * slug;
@property NSString * slugPrototypeLink;
@property int sortOrder;
@property NSDate * updateDate;
@property float weightingCoefficient;
@property int sortOrderInArea;
@property NSString * areaName;

@property RLMArray <GWRLMIntetionBehavior *> <GWRLMIntetionBehavior> *intentionBehavior;

-(void)updateIntentionWithAreaName:(NSString *)theAreaName jsonData:(NSDictionary *)jsonDict;

@end

RLM_ARRAY_TYPE(GWRLMIntention);
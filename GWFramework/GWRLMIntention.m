//
//  GWRLMIntention.m
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import "GWRLMIntention.h"
#import "GWRLMIntetionBehavior.h"
#import "NSDate+GWDateExtension.h"
#import "GWCoreDataManager.h"

@implementation GWRLMIntention

/*
@dynamic culture;
@dynamic hasImage;
@dynamic imagePath;
@dynamic impersonal;
@dynamic intentionDescription;
@dynamic intentionId;
@dynamic label;
@dynamic mostRecentTextUpdate;
@dynamic mostRecentTextUpdateEpoch;
@dynamic recurring;
@dynamic slug;
@dynamic slugPrototypeLink;
@dynamic sortOrder;
@dynamic sortOrderInArea;
@dynamic updateDate;
@dynamic weightingCoefficient;
@dynamic areaName;
*/

-(void)updateIntentionWithAreaName:(NSString *)theAreaName jsonData:(NSDictionary *)jsonDict {
    
    self.areaName = theAreaName;
    self.culture = jsonDict[@"Culture"];
    
    if (jsonDict[@"Description"] != [NSNull null]) {
        self.intentionDescription = jsonDict[@"Description"];
    }
    
    self.hasImage = [jsonDict[@"HasImage"] boolValue];
    
    if (jsonDict[@"ImagePath"] != [NSNull null]) {
        self.imagePath = jsonDict[@"ImagePath"];
    }
    
    if (jsonDict[@"SortOrderInArea"] != [NSNull null]) {
        self.sortOrderInArea = [jsonDict[@"SortOrderInArea"] intValue];
    }
    
    self.impersonal = jsonDict[@"Impersonal"];
    self.intentionId = jsonDict[@"IntentionId"];
    self.label = jsonDict[@"Label"];
    self.updateDate = [NSDate dateFromJsonString: (NSString*) jsonDict[@"MostRecentTextUpdate"] formatter:[[GWCoreDataManager sharedInstance] dateFormatter]];
    self.mostRecentTextUpdate = self.updateDate;
    self.mostRecentTextUpdateEpoch = [jsonDict[@"MostRecentTextUpdateEpoch"] longValue];
    self.recurring = jsonDict[@"Recurring"];
    self.slug = jsonDict[@"Slug"];
    self.slugPrototypeLink = jsonDict[@"SlugPrototypeLink"];
    self.sortOrder = [jsonDict[@"SortOrder"] intValue];
    //self.sortOrderInArea = jsonDict[@"SortOrderInArea"];
    self.weightingCoefficient = [jsonDict[@"WeightingCoefficient"] floatValue];
}

@end

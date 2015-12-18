//
//  GWIntention.m
//  GWFramework
//
//  Created by Mathieu Skulason on 18/08/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWIntention.h"
#import "GWIntentionAreaBehavior.h"
#import "GWIntentionLabel.h"


@implementation GWIntention

@dynamic culture;
@dynamic hasImage;
@dynamic imagePath;
@dynamic impersonal;
@dynamic intentionDescription;
@dynamic intentionId;
@dynamic label;
@dynamic mediaUrl;
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
@dynamic labels;
@dynamic intentionBehavior;


+(instancetype)createGWIntention {
    GWIntention *intention = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntention" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    return intention;
}

+(instancetype)createIntentionWithContext:(NSManagedObjectContext*)theContext {
    GWIntention *intention = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntention" inManagedObjectContext:theContext];
    return intention;
}


+(instancetype)createGWIntentionWithAreaName:(NSString *)theAreaName withDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext {
    GWIntention *intention = [GWIntention createIntentionWithContext:theContext];
    [intention updateIntentionWithAreaName:theAreaName withDict:jsonDict withContext:theContext];
    
    return intention;
}

-(void)updateIntentionWithAreaName:(NSString *)theAreaName withDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext {
    
    self.areaName = theAreaName;
    self.culture = jsonDict[@"Culture"];
    
    if (jsonDict[@"Description"] != [NSNull null]) {
        self.intentionDescription = jsonDict[@"Description"];
    }

    self.hasImage = jsonDict[@"HasImage"];
    
    if (jsonDict[@"ImagePath"] != [NSNull null]) {
        self.imagePath = jsonDict[@"ImagePath"];
    }
    
    if (jsonDict[@"SortOrderInArea"] != [NSNull null]) {
        self.sortOrderInArea = jsonDict[@"SortOrderInArea"];
    }
    
    if (jsonDict[@"MediaUrl"] != [NSNull null
                                  ]) {
        self.mediaUrl = jsonDict[@"MediaUrl"];
    }
    
    self.impersonal = jsonDict[@"Impersonal"];
    self.intentionId = jsonDict[@"IntentionId"];
    self.label = jsonDict[@"Label"];
    self.updateDate = [[GWCoreDataManager sharedInstance] dateFromJsonString: (NSString*) jsonDict[@"MostRecentTextUpdate"]];
    self.mostRecentTextUpdate = self.updateDate;
    self.mostRecentTextUpdateEpoch = jsonDict[@"MostRecentTextUpdateEpoch"];
    self.recurring = jsonDict[@"Recurring"];
    self.slug = jsonDict[@"Slug"];
    self.slugPrototypeLink = jsonDict[@"SlugPrototypeLink"];
    self.sortOrder = jsonDict[@"SortOrder"];
    //self.sortOrderInArea = jsonDict[@"SortOrderInArea"];
    self.weightingCoefficient = jsonDict[@"WeightingCoefficient"];
    
    NSArray *labels = jsonDict[@"Labels"];
    NSMutableOrderedSet *labelSet = [NSMutableOrderedSet orderedSet];
    
    if (self.labels != nil) {
        for (GWIntentionLabel *label in self.labels) {
            [theContext deleteObject:label];
        }
    }
    
    for (NSDictionary *jsonDict in labels) {
        GWIntentionLabel *label = [GWIntentionLabel createGWIntentionWithDict:jsonDict withIntention:self withContext:theContext];
        [labelSet addObject:label];
    }
    
    self.labels = labelSet;
    
    /*
    NSMutableSet *intentionBehaviorSet = [NSMutableSet set];
    
    if (self.intentionBehavior != nil) {
        for (GWIntentionAreaBehavior *intentionBehavior in self.intentionBehavior) {
            
            if ([intentionBehavior.areaName isEqualToString:theAreaName]) {
                
                [theContext deleteObject:intentionBehavior];
                
            }
            
            GWIntentionAreaBehavior *newIntentionBehavior = [GWIntentionAreaBehavior createGWIntentionAreaBehaviorWithDict:jsonDict withIntention:self withContext:theContext];
            [intentionBehaviorSet addObject:newIntentionBehavior];
            
        }
    }
    
    self.intentionBehavior = intentionBehaviorSet;
    */
}

-(NSString*)description {
    return [NSString stringWithFormat:@"GWIntention culture: %@, intentionDescription: %@, impersonal: %@, intentionId: %@, label: %@, updateDate: %@, mostRecentTextUpdateEpoch: %@, recurring: %@, slug: %@, slugPrototypeLink: %@, sortOrder: %@, weightingCoefficient: %@", self.culture, self.intentionDescription, self.impersonal, self.intentionId, self.label, self.updateDate, self.mostRecentTextUpdateEpoch, self.recurring, self.slug, self.slugPrototypeLink, self.sortOrder, self.weightingCoefficient];
}



@end

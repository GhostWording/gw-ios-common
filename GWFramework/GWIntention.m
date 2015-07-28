//
//  GWIntention.m
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWIntention.h"
#import "GWIntentionLabel.h"

@implementation GWIntention

@dynamic areaId;
@dynamic sortOrderInArea;
@dynamic hasImage;
@dynamic imagePath;
@dynamic intentionId;
@dynamic updateDate;
@dynamic sortOrder;
@dynamic culture;
@dynamic intentionDescription;
@dynamic slug;
@dynamic slugPrototypeLink;
@dynamic label;
@dynamic mostRecentTextUpdate;
@dynamic mostRecentTextUpdateEpoch;
@dynamic weightingCoefficient;
@dynamic recurring;
@dynamic impersonal;
@dynamic labels;

+(instancetype)createGWIntention {
    GWIntention *intention = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntention" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    return intention;
}

+(instancetype)createIntentionWithContext:(NSManagedObjectContext*)theContext {
    GWIntention *intention = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntention" inManagedObjectContext:theContext];
    return intention;
}


+(instancetype)createGWIntentionWithDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext {
    GWIntention *intention = [GWIntention createIntentionWithContext:theContext];
    [intention updateIntentionWithDict:jsonDict withContext:theContext];
    
    return intention;
}

-(void)updateIntentionWithDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext {
    
    self.areaId = jsonDict[@"AreaId"];
    self.culture = jsonDict[@"Culture"];
    self.intentionDescription = jsonDict[@"Description"];
    self.hasImage = jsonDict[@"HasImage"];
    self.imagePath = jsonDict[@"ImagePath"];
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
    self.sortOrderInArea = jsonDict[@"SortOrderInArea"];
    self.weightingCoefficient = jsonDict[@"WeightingCoefficient"];
    
    NSArray *labels = jsonDict[@"Labels"];
    NSMutableOrderedSet *labelSet = [NSMutableOrderedSet orderedSet];
    
    for (NSDictionary *jsonDict in labels) {
        GWIntentionLabel *label = [GWIntentionLabel createGWIntentionWithDict:jsonDict withIntention:self withContext:theContext];
        [labelSet addObject:label];
    }
    
    self.labels = labelSet;
    
}

-(NSString*)description {
    return [NSString stringWithFormat:@"GWIntention areaId: %@, culture: %@, intentionDescription: %@, hasImage: %@, imagePath: %@, impersonal: %@, intentionId: %@, label: %@, updateDate: %@, mostRecentTextUpdateEpoch: %@, recurring: %@, slug: %@, slugPrototypeLink: %@, sortOrder: %@, sortOrderInArea: %@, weightingCoefficient: %@, labels: %@", self.areaId, self.culture, self.intentionDescription, self.hasImage, self.imagePath, self.impersonal, self.intentionId, self.label, self.updateDate, self.mostRecentTextUpdateEpoch, self.recurring, self.slug, self.slugPrototypeLink, self.sortOrder, self.sortOrderInArea, self.weightingCoefficient, self.labels];
}

@end

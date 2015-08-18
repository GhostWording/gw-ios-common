//
//  GWIntentionAreaBehavior.m
//  GWFramework
//
//  Created by Mathieu Skulason on 18/08/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWIntentionAreaBehavior.h"
#import "GWIntention.h"
#import "GWCoreDataManager.h"


@implementation GWIntentionAreaBehavior

@dynamic hasImage;
@dynamic imagePath;
@dynamic areaName;
@dynamic sortOrderInArea;
@dynamic intention;

+(instancetype)createGWIntentionAreaBehavior {
    
    GWIntentionAreaBehavior *intentionBehavior = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntentionAreaBehavior" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    
    return intentionBehavior;
}

+(instancetype)createGWIntentionAreaBehaviorWithContext:(NSManagedObjectContext *)theContext {
    GWIntentionAreaBehavior *intentionBehavior = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntentionAreaBehavior" inManagedObjectContext:theContext];
    
    return intentionBehavior;
}

+(instancetype)createGWIntentionAreaBehaviorWithDict:(NSDictionary *)jsonDict withIntention:(GWIntention *)theIntention withContext:(NSManagedObjectContext *)theContext {
    GWIntentionAreaBehavior *intentionBehavior = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntentionAreaBehavior" inManagedObjectContext:theContext];
    [intentionBehavior updateGWIntentionAreaBehaviorWithDict:jsonDict withIntention:theIntention];
    
    return intentionBehavior;
}

-(void)updateGWIntentionAreaBehaviorWithDict:(NSDictionary *)jsonDict withIntention:(GWIntention*)theIntention {
    
    self.hasImage = jsonDict[@"HasImage"];
    
    if (jsonDict[@"ImagePath"] != [NSNull null]) {
        self.imagePath = jsonDict[@"ImagePath"];
    }
    
    if (jsonDict[@"SortOrderInArea"] != [NSNull null]) {
        self.sortOrderInArea = jsonDict[@"SortOrderInArea"];
    }
    
    self.intention = theIntention;
    self.areaName = theIntention.areaName;
}

@end

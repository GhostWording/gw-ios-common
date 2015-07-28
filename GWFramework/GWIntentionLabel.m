//
//  GWIntentionLabel.m
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWIntentionLabel.h"
#import "GWIntention.h"
#import "GWCoreDataManager.h"


@implementation GWIntentionLabel

@dynamic intentionId;
@dynamic culture;
@dynamic label;
@dynamic slug;
@dynamic intention;

+(instancetype)createGWIntention {
    GWIntentionLabel *intentionLabel = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntentionLabel" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    return intentionLabel;
}

+(instancetype)createIntentionLabelWithContext:(NSManagedObjectContext*)theContext {
    GWIntentionLabel *intentionLabel = [NSEntityDescription insertNewObjectForEntityForName:@"GWIntentionLabel" inManagedObjectContext:theContext];
    
    return intentionLabel;
}

+(instancetype)createGWIntentionWithDict:(NSDictionary *)jsonDict withIntention:(GWIntention *)theIntention withContext:(NSManagedObjectContext *)theContext {
    GWIntentionLabel *intentionLabel = [GWIntentionLabel createIntentionLabelWithContext:theContext];
    [intentionLabel updateIntentionLabelWithDict:jsonDict withIntention:theIntention];
    
    return intentionLabel;
}

-(void)updateIntentionLabelWithDict:(NSDictionary *)jsonDict withIntention:(GWIntention *)theIntention {
    
    self.culture = jsonDict[@"Culture"];
    self.intentionId = jsonDict[@"IntentionId"];
    self.label = jsonDict[@"Label"];
    self.slug = jsonDict[@"Slug"];
    self.intention = theIntention;
    
}


-(NSString*)description {
    return [NSString stringWithFormat:@"GWIntentionLabel culture: %@, intentionId: %@, label: %@, slug: %@, intention: %@", self.culture, self.intentionId, self.label, self.slug, self.intention];
}


@end

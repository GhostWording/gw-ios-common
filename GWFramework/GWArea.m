//
//  GWArea.m
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWArea.h"
#import "GWAreaCulture.h"
#import "GWCoreDataManager.h"


@implementation GWArea

@dynamic areaId;
@dynamic lastChangeTime;
@dynamic name;
@dynamic availableCultures;

+(instancetype)createArea {
    GWArea *area = [NSEntityDescription insertNewObjectForEntityForName:@"GWArea" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    return area;
}

+(instancetype)createAreaWithContext:(NSManagedObjectContext*)theContext {
    GWArea *area = [NSEntityDescription insertNewObjectForEntityForName:@"GWArea" inManagedObjectContext:theContext];
    return area;
}

+(instancetype)createAreaWithDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext {
    
    GWArea *area = [GWArea createAreaWithContext:theContext];
    [area updateAreaWithDict:jsonDict withContext:theContext];
    
    return area;
}

-(void)updateAreaWithDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext*)theContext {
    
    self.areaId = jsonDict[@"AreaId"];
    self.name = jsonDict[@"Name"];
    self.lastChangeTime = jsonDict[@"LastChangeTime"];
    
    NSArray *availableCultures = jsonDict[@"AvailableCultures"];
    
    if (self.availableCultures != nil) {
        for (GWAreaCulture *culture in self.availableCultures) {
            [theContext deleteObject:culture];
        }
    }
    
    NSMutableOrderedSet *cultures = [NSMutableOrderedSet orderedSet];
    
    for (NSDictionary *culture in availableCultures) {
        GWAreaCulture *areaCulture = [GWAreaCulture createAreaCultureFromDict:culture withArea:self withContext:theContext];
        [cultures addObject:areaCulture];
    }
    
    self.availableCultures = cultures;
    
}

-(NSString*)description {
    return [NSString stringWithFormat:@"GWArea areaId: %@, lastChangeTime: %@, name: %@, availableCultures: %@", self.areaId, self.lastChangeTime, self.name, self.availableCultures];
}

@end

//
//  GWAreaCulture.m
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWAreaCulture.h"
#import "GWArea.h"
#import "GWCoreDataManager.h"


@implementation GWAreaCulture

@dynamic code;
@dynamic name;
@dynamic area;

+(instancetype)createAreaCulture {
    
    GWAreaCulture *culture = [NSEntityDescription insertNewObjectForEntityForName:@"GWAreaCulture" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    
    return culture;
}

+(instancetype)createAreaCultureWithContext:(NSManagedObjectContext*)theContext {
    GWAreaCulture *culture = [NSEntityDescription insertNewObjectForEntityForName:@"GWAreaCulture" inManagedObjectContext:theContext];
    return culture;
}

+(instancetype)createAreaCultureFromDict:(NSDictionary *)jsonDict withArea:(GWArea *)theArea withContext:(NSManagedObjectContext *)theContext {
    
    GWAreaCulture *culture = [GWAreaCulture createAreaCultureWithContext:theContext];
    [culture updateAreaCultureWithDict:jsonDict withArea:theArea];
    
    return culture;
}

-(void)updateAreaCultureWithDict:(NSDictionary *)jsonDict withArea:(GWArea *)theArea {
    
    self.code = jsonDict[@"Code"];
    self.name = jsonDict[@"Name"];
    self.area = theArea;
    
}

-(NSString*)description {
    return [NSString stringWithFormat:@"GWAreaCulture code: %@, name: %@", self.code, self.name];
}

@end

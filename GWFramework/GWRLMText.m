//
//  GWRLMText.m
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import "GWRLMText.h"
#import "GWCoreDataManager.h"
#import "NSDate+GWDateExtension.h"

@implementation GWRLMText

-(void)updateWithAreaName:(NSString *)theAreaName jsonDict:(NSDictionary *)jsonDict {
    
    self.areaName = theAreaName;
    
    if (jsonDict[@"Abstract"] != [NSNull null]) {
        self.abstract = jsonDict[@"Abstract"];
    }
    
    self.author = jsonDict[@"Author"];
    self.content = jsonDict[@"Content"];
    self.culture = jsonDict[@"Culture"];
    self.impersonal = jsonDict[@"Impersonal"];
    self.intentionId = jsonDict[@"IntentionId"];
    
    if (jsonDict[@"IntentionLabel"] != [NSNull null]) {
        self.intentionLabel = jsonDict[@"IntentionLabel"];
    }
    
    if (jsonDict[@"ImageUrl"] != [NSNull null]) {
        self.imageUrl = jsonDict[@"ImageUrl"];
    }
    
    if (jsonDict[@"ReferenceUrl"] != [NSNull null]) {
        self.referenceUrl = jsonDict[@"ReferenceUrl"];
    }
    
    self.isQuote = [jsonDict[@"IsQuote"] boolValue];
    self.politeForm = jsonDict[@"PoliteForm"];
    self.prototypeId = jsonDict[@"PrototypeId"];
    self.proximity = jsonDict[@"Proximity"];
    self.sender = jsonDict[@"Sender"];
    self.sortBy = [jsonDict[@"SortBy"] intValue];
    self.status = jsonDict[@"Status"];
    self.tagsString = jsonDict[@"TagsString"];
    self.target = jsonDict[@"Target"];
    self.textId = jsonDict[@"TextId"];
    
    self.updateDate = [NSDate dateFromJsonString:(NSString*) jsonDict[@"Updated"] formatter:[[GWCoreDataManager sharedInstance] dateFormatter]];

}

@end

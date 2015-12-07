//
//  RLMResults+GWExtension.m
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import "RLMResults+GWExtension.h"
#import "GWRLMText.h"

@implementation RLMResults (GWExtension)

-(GWRLMText *)findRLMTextWithId:(NSString *)theTextId {
    
    for (GWRLMText *text in self) {
        
        if ([text.textId isEqualToString:theTextId]) {
            return text;
        }
    }
    
    return nil;
}

@end

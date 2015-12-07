//
//  RLMResults+GWExtension.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import "RLMResults.h"

@class GWRLMText;

@interface RLMResults (GWExtension)

-(GWRLMText *)findRLMTextWithId:(NSString *)theTextId;

@end

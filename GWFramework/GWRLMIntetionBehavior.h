//
//  GWRLMIntetionBehavior.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import "RLMObject.h"

@interface GWRLMIntetionBehavior : RLMObject

@property (nonatomic, retain) NSString * intentionId;
@property (nonatomic, retain) NSString * culture;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString * slug;

@end

RLM_ARRAY_TYPE(GWRLMIntetionBehavior);
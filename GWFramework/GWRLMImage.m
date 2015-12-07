//
//  GWRLMImage.m
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import "GWRLMImage.h"

@implementation GWRLMImage

@dynamic imageData;
@dynamic imageId;

+(NSString *)primaryKey {
    return @"imageId";
}

@end

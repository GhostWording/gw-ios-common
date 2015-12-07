//
//  NSDate+GWDateExtension.m
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import "NSDate+GWDateExtension.h"

@implementation NSDate (GWDateExtension)

+(NSDate*)dateFromJsonString:(NSString *)dateString formatter:(NSDateFormatter *)theDateFormatter {
    
    [theDateFormatter setDateFormat:@"yyyy'-'mm'-'dd'T'HH:mm:ss.SSS"];
    
    if (![theDateFormatter dateFromString:dateString]) {
        
        [theDateFormatter setDateFormat:@"yyyy'-'mm'-'dd'T'HH:mm:ss"];
        
        if (![theDateFormatter dateFromString:dateString]) {
            return [NSDate date];
        }
        else {
            return [theDateFormatter dateFromString:dateString];
        }
    }
    else {
        return [theDateFormatter dateFromString:dateString];
    }
    
}

@end

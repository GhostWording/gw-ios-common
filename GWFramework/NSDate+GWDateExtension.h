//
//  NSDate+GWDateExtension.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GWDateExtension)

+(NSDate*)dateFromJsonString:(NSString *)dateString formatter:(NSDateFormatter *)theDateFormatter;

@end

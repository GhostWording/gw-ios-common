//
//  GWLocalizedBundle.m
//  GWFramework
//
//  Created by Mathieu Skulason on 04/08/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWLocalizedBundle.h"

@implementation GWLocalizedBundle

static NSBundle *bundle = nil;

+(void)initialize {
    
    NSLocale *currentLocale = [GWLocalizedBundle currentLocale];
    NSString *langPath = [[NSBundle mainBundle] pathForResource:currentLocale.localeIdentifier ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:langPath];
    
}

+(NSBundle*)GWBundle {
    return bundle;
}

+(void)setLanguage:(NSString *)lang {
    NSLog(@"setting language to: %@", lang);
    [GWLocalizedBundle setCurrentLocaleString:lang];
    NSString *localeIdentifier = [GWLocalizedBundle currentLocaleString];
    NSString *langPath = [[NSBundle mainBundle] pathForResource:localeIdentifier ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:langPath];
    NSLog(@"new bundle: %@", bundle);
}

+(NSString*)GWLocalizedStringForKey:(NSString *)key {
    return [bundle localizedStringForKey:key value:@"Value not found" table:@"IntentionLocalizedStrings"];
}

#pragma mark - Locale

+(NSLocale*)currentLocale {
    return [NSLocale localeWithLocaleIdentifier:[GWLocalizedBundle currentLocaleString]];
}

+(NSString*)currentLocaleString {
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"currentLocale"] == nil) {
        [GWLocalizedBundle setCurrentLocaleString:@"fr"];
    }
    
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"currentLocale"];
}

+(void)setCurrentLocaleString:(NSString *)theLocale {
    
    if ([theLocale isEqualToString:@"en"] || [theLocale isEqualToString:@"fr"] || [theLocale isEqualToString:@"es"]) {
        [[NSUserDefaults standardUserDefaults] setValue:theLocale forKey:@"currentLocale"];
    }
    else {
        NSLog(@"not setting current locale string");
    }
}

+(NSString*)currentLocaleAPIString {
    NSString *locale = [GWLocalizedBundle currentLocaleString];
    
    if ([locale hasPrefix:@"fr"]) {
        return @"fr-FR";
    }
    else if([locale hasPrefix:@"en"]) {
        return @"en-EN";
    }
    else if([locale hasPrefix:@"es"]) {
        return @"es-ES";
    }
    else {
        return @"fr-FR";
    }
    
}

@end

//
//  GWIntentionPresenter.m
//  GWFramework
//
//  Created by Mathieu Skulason on 03/08/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWIntentionPresenter.h"
#import "GWLocalizedBundle.h"

#undef NSLocalizedString
#define NSLocalizedString(key, comment) [GWLocalizedBundle GWLocalizedStringForKey:(key)]
#define GWLocalizedString(key, comment) [GWLocalizedBundle GWLocalizedStringForKey:(key)]

@implementation GWIntentionPresenter

-(id)initWithIntentionId:(NSString *)theIntentionId withIntentionSlug:(NSString *)theIntentionSlug withSlugPrototypeLink:(NSString *)theSlugPrototypeLink withIntentionLabel:(NSString *)theIntentionLabel withWeightingCoefficient:(NSNumber *)theCoefficient {
    
    if (self = [super init]) {
        _intentionId = theIntentionId;
        _intentionSlug = theIntentionSlug;
        _intentionSlugPrototypeLink = theSlugPrototypeLink;
        _intentionLabel = theIntentionLabel;
        _imagePath = nil;
        
        if (theCoefficient == nil) {
            _weightingCoefficient = [NSNumber numberWithFloat:100.0];
        }
        else {
            _weightingCoefficient = theCoefficient;
        }
        
        _culture = [GWLocalizedBundle currentLocaleString];
        
    }
    
    return self;
}

+(instancetype)intentionBravo {
    return [[self alloc] initWithIntentionId:@"006B9F" withIntentionSlug:@"bravo" withSlugPrototypeLink:@"bravo" withIntentionLabel:GWLocalizedString(@"<IntentionBravo>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100.0]];
}

+(instancetype)intentionIThinkOfYou {
    return [[self alloc] initWithIntentionId:@"016E91" withIntentionSlug:@"je-pense-a-toi" withSlugPrototypeLink:@"I-think-of-you" withIntentionLabel:GWLocalizedString(@"<IntentionIThinkOfYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100.0]];
}

+(instancetype)intentionGoodMorning {
    return [[self alloc] initWithIntentionId:@"030FD0" withIntentionSlug:@"bonjour" withSlugPrototypeLink:@"good-morning" withIntentionLabel:GWLocalizedString(@"<IntentionGoodMorning>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100.0]];
}

+(instancetype)intentionIAmHereForYou {
    return [[self alloc] initWithIntentionId:@"03B6E4" withIntentionSlug:@"je-suis-la-pour-toi" withSlugPrototypeLink:@"I-am-here-for-you" withIntentionLabel:GWLocalizedString(@"<intentionIAmHereForYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100.0]];
}

+(instancetype)intentionJokes {
    return [[self alloc] initWithIntentionId:@"0B1EA1" withIntentionSlug:@"humour" withSlugPrototypeLink:@"jokes" withIntentionLabel:GWLocalizedString(@"<IntentionJokes>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:40]];
}

+(instancetype)intentionGetHomeSafe {
    return [[self alloc] initWithIntentionId:@"0B27A8" withIntentionSlug:@"rentrez-bien" withSlugPrototypeLink:@"get-home-safe" withIntentionLabel:GWLocalizedString(@"<IntentionGetHomeSafe>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100.0]];
}

+(instancetype)intentionHumorousInsults {
    return [[self alloc] initWithIntentionId:@"0ECC82" withIntentionSlug:@"exutoire" withSlugPrototypeLink:@"humorous-insults" withIntentionLabel:GWLocalizedString(@"<IntentionHumorousInsults>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:20.0]];
}

+(instancetype)intentionThankYouForTheInvitation {
    return [[self alloc] initWithIntentionId:@"12636D" withIntentionSlug:@"merci-pour-l-invitation" withSlugPrototypeLink:@"thank-you-for-the-invitation" withIntentionLabel:GWLocalizedString(@"<IntentionThankYouForTheInvitation>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

@end

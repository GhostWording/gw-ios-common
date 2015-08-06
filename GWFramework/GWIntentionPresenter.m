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

+(instancetype)intentionSurpriseMe {
    return [[self alloc] initWithIntentionId:@"1395B6" withIntentionSlug:@"surprends-moi" withSlugPrototypeLink:@"surprise-me" withIntentionLabel:GWLocalizedString(@"<IntentionSurpriseMe>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:40]];
}

+(instancetype)intentionThankYou {
    return [[self alloc] initWithIntentionId:@"1778B7" withIntentionSlug:@"merci" withSlugPrototypeLink:@"thank-you" withIntentionLabel:GWLocalizedString(@"<IntentionThankYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:20]];
}

+(instancetype)intentionSampleLetterInsurance {
    return [[self alloc] initWithIntentionId:@"1CEE9B" withIntentionSlug:@"lettre-type-assurance" withSlugPrototypeLink:@"sample-letter-insurance" withIntentionLabel:GWLocalizedString(@"<IntentionSampleLetterInsurance>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionComeBackToMe {
    return [[self alloc] initWithIntentionId:@"23769A" withIntentionSlug:@"reviens-moi" withSlugPrototypeLink:@"come-back-to-me" withIntentionLabel:GWLocalizedString(@"<IntentionComeBackToMe>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionINeedAFavor {
    return [[self alloc] initWithIntentionId:@"2D4079" withIntentionSlug:@"j-ai-besoin-d-un-service" withSlugPrototypeLink:@"I-need-a-favour" withIntentionLabel:GWLocalizedString(@"<IntentionINeedAFavor>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionFacebookStatus {
    return [[self alloc] initWithIntentionId:@"2E2986" withIntentionSlug:@"statuts-facebook" withSlugPrototypeLink:@"facebook-status" withIntentionLabel:GWLocalizedString(@"<IntentionFacebookStatus>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:30]];
}

+(instancetype)intentionStopTheWorld {
    return [[self alloc] initWithIntentionId:@"451563" withIntentionSlug:@"arretez-le-monde" withSlugPrototypeLink:@"stop-the-world" withIntentionLabel:GWLocalizedString(@"<IntentionStopTheWorld>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:30]];
}

+(instancetype)intentionFarewellParty {
    return [[self alloc] initWithIntentionId:@"4EA651" withIntentionSlug:@"pot-de-depart" withSlugPrototypeLink:@"farewell-party" withIntentionLabel:GWLocalizedString(@"<IntentionFarewellParty>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionRetirementCongratulations {
    return [[self alloc] initWithIntentionId:@"577D28" withIntentionSlug:@"felicitations-pour-la-retraite" withSlugPrototypeLink:@"retirement-congratulations" withIntentionLabel:GWLocalizedString(@"<IntentionRetirementCongratulations>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionILoveYou {
    return [[self alloc] initWithIntentionId:@"5CDCF2" withIntentionSlug:@"je-t-aime" withSlugPrototypeLink:@"I-love-you" withIntentionLabel:GWLocalizedString(@"<IntentionILoveYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionWaitingForABaby {
    return [[self alloc] initWithIntentionId:@"5D0CE1" withIntentionSlug:@"je-vais-etre-maman-ou-papa" withSlugPrototypeLink:@"waiting-for-a-baby" withIntentionLabel:GWLocalizedString(@"<IntentionWaitingForABaby>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIAmAskingForAMeeting {
    return [[self alloc] initWithIntentionId:@"5FF18A" withIntentionSlug:@"je-demande-un-rendez-vous" withSlugPrototypeLink:@"I-am-asking-for-a-meeting" withIntentionLabel:GWLocalizedString(@"<IntentionIAmAskingForAMeeting>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionCongratulationOnTheBirthOfYourBaby {
    return [[self alloc] initWithIntentionId:@"63BF3A" withIntentionSlug:@"felicitations-pour-la-naissance" withSlugPrototypeLink:@"congratulations-on-the-birth-of-your-baby" withIntentionLabel:GWLocalizedString(@"<IntentionCongratulationOnTheBirthOfYourBaby>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionILikeYou {
    return [[self alloc] initWithIntentionId:@"64B504" withIntentionSlug:@"tu-me-plais" withSlugPrototypeLink:@"I-like-you" withIntentionLabel:GWLocalizedString(@"<IntentionILikeYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionPositiveThoughts {
    return [[self alloc] initWithIntentionId:@"67CC40" withIntentionSlug:@"pensees-positives" withSlugPrototypeLink:@"positive-thoughts" withIntentionLabel:GWLocalizedString(@"<IntentionPositiveThoughts>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:50]];
}

+(instancetype)intentionIAmSorry {
    return [[self alloc] initWithIntentionId:@"70D12F" withIntentionSlug:@"pardon" withSlugPrototypeLink:@"sorry" withIntentionLabel:GWLocalizedString(@"<IntentionIAmSorry>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIWantToKnowAboutYou {
    return [[self alloc] initWithIntentionId:@"7445BC" withIntentionSlug:@"faisons-connaissance" withSlugPrototypeLink:@"I-want-to-know-about-you" withIntentionLabel:GWLocalizedString(@"<IntentionIWantToKnowAboutYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionWeddingCongratulations {
    return [[self alloc] initWithIntentionId:@"764A35" withIntentionSlug:@"felicitations-pour-le-mariage" withSlugPrototypeLink:@"wedding-congratulations" withIntentionLabel:GWLocalizedString(@"<IntentionWeddingCongratulations>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionNoThankYou {
    return [[self alloc] initWithIntentionId:@"78B5D3" withIntentionSlug:@"non-merci" withSlugPrototypeLink:@"no-thank-you" withIntentionLabel:GWLocalizedString(@"<IntentionNoThankYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIMissYou {
    return [[self alloc] initWithIntentionId:@"8ED62C" withIntentionSlug:@"tu-me-manques" withSlugPrototypeLink:@"I-miss-you" withIntentionLabel:GWLocalizedString(@"<IntentionIMissYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionWouldYouCareForADrink {
    return [[self alloc] initWithIntentionId:@"916FFC" withIntentionSlug:@"prenons-un-verre" withSlugPrototypeLink:@"would-you-care-for-a-drink" withIntentionLabel:GWLocalizedString(@"<IntentionWouldYouCareForADrink>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionHappyNewYear {
    return [[self alloc] initWithIntentionId:@"938493" withIntentionSlug:@"bonne-annee" withSlugPrototypeLink:@"happy-new-year" withIntentionLabel:GWLocalizedString(@"<IntentionHappyNewYear>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionHowAreYou {
    return [[self alloc] initWithIntentionId:@"950C3C" withIntentionSlug:@"comment-vas-tu" withSlugPrototypeLink:@"how-are-you" withIntentionLabel:GWLocalizedString(@"<IntentionHowAreYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionSampleLetterForBanksAndCredits {
    return [[self alloc] initWithIntentionId:@"9B2807" withIntentionSlug:@"lettre-type-banques-et-credits" withSlugPrototypeLink:@"sample-letter-for-banks-and-credits" withIntentionLabel:GWLocalizedString(@"<IntentionSampleLetterForBanksAndCredits>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIAmLate {
    return [[self alloc] initWithIntentionId:@"9B2C8B" withIntentionSlug:@"je-suis-en-retard" withSlugPrototypeLink:@"I-am-late" withIntentionLabel:GWLocalizedString(@"<IntentionIAmLate>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionAFewWordsForYou {
    return [[self alloc] initWithIntentionId:@"A64962" withIntentionSlug:@"quelques-mots-pour-toi" withSlugPrototypeLink:@"a-few-words-for-you" withIntentionLabel:GWLocalizedString(@"<IntentionAFewWordsForYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionHappyBirthday {
    return [[self alloc] initWithIntentionId:@"A730B4" withIntentionSlug:@"joyeux-anniversaire" withSlugPrototypeLink:@"happy-birthday" withIntentionLabel:GWLocalizedString(@"<IntentionHappyBirthday>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionSampleLetterConsumerRights {
    return [[self alloc] initWithIntentionId:@"AC9979" withIntentionSlug:@"lettre-type-droit-du-consommateur" withSlugPrototypeLink:@"sample-letter-consumer-rights" withIntentionLabel:GWLocalizedString(@"<IntentionSampleLetterConsumerRights>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionThereIsSomethingMissing {
    return [[self alloc] initWithIntentionId:@"B0D576" withIntentionSlug:@"il-manque-quelque-chose" withSlugPrototypeLink:@"there-is-something-missing" withIntentionLabel:GWLocalizedString(@"<IntentionThereIsSomethingMissing>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionSampleLetter {
    return [[self alloc] initWithIntentionId:@"B0FD26" withIntentionSlug:@"lettre-type" withSlugPrototypeLink:@"sample-letter" withIntentionLabel:GWLocalizedString(@"<IntentionSampleLetter>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionCondolences {
    return [[self alloc] initWithIntentionId:@"B47AE0" withIntentionSlug:@"condoleances" withSlugPrototypeLink:@"condolences" withIntentionLabel:GWLocalizedString(@"<IntentionCondolences>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIWouldLikeToSeeYouAgain {
    return [[self alloc] initWithIntentionId:@"BD7387" withIntentionSlug:@"j-aimerais-vous-revoir" withSlugPrototypeLink:@"I-would-like-to-see-you-again" withIntentionLabel:GWLocalizedString(@"<IntentionIWouldLikeToSeeYouAgain>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionThankYouForTheMeeting {
    return [[self alloc] initWithIntentionId:@"C0EDB0" withIntentionSlug:@"merci-pour-le-rendez-vous" withSlugPrototypeLink:@"thank-you-for-the-meeting" withIntentionLabel:GWLocalizedString(@"<IntentionThankYouForTheMeeting>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionRoutineIsLurking {
    return [[self alloc] initWithIntentionId:@"C51DB4" withIntentionSlug:@"la-routine-nous-guette" withSlugPrototypeLink:@"routine-is-lurking" withIntentionLabel:GWLocalizedString(@"<IntentionRoutineIsLurking>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionComeOverForDinner {
    return [[self alloc] initWithIntentionId:@"D19840" withIntentionSlug:@"venez-diner-a-la-maison" withSlugPrototypeLink:@"come-over-for-dinner" withIntentionLabel:GWLocalizedString(@"<IntentionComeOverForDinner>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionLetMeIntroduceMyself {
    return [[self alloc] initWithIntentionId:@"D1A4ED" withIntentionSlug:@"je-me-presente" withSlugPrototypeLink:@"let-me-introduce-myself" withIntentionLabel:GWLocalizedString(@"<IntentionLetMeIntroduceMyself>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionGoodNight {
    return [[self alloc] initWithIntentionId:@"D392C1" withIntentionSlug:@"bonne-nuit" withSlugPrototypeLink:@"good-night" withIntentionLabel:GWLocalizedString(@"<IntentionGoodNight>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIAmLeavingYou {
    return [[self alloc] initWithIntentionId:@"D78AFB" withIntentionSlug:@"je-te-quitte" withSlugPrototypeLink:@"I-am-leaving-you" withIntentionLabel:GWLocalizedString(@"<IntentionIAmLeavingYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIAmJealous {
    return [[self alloc] initWithIntentionId:@"DF7A10" withIntentionSlug:@"je-suis-jaloux" withSlugPrototypeLink:@"I-am-jealous" withIntentionLabel:GWLocalizedString(@"<IntentionIAmJealous>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionCelebrateTheOccasion {
    return [[self alloc] initWithIntentionId:@"EB020F" withIntentionSlug:@"bonne-fete" withSlugPrototypeLink:@"celebrate-the-occasion" withIntentionLabel:GWLocalizedString(@"<IntentionCelebrateTheOccasion>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionLetUsStayInTouch {
    return [[self alloc] initWithIntentionId:@"F18A92" withIntentionSlug:@"restons-en-contact" withSlugPrototypeLink:@"let-us-stay-in-touch" withIntentionLabel:GWLocalizedString(@"<IntentionLetUsStayInTouch>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionThankYouFortheGift {
    return [[self alloc] initWithIntentionId:@"F3F2F4" withIntentionSlug:@"merci-pour-le-cadeau" withSlugPrototypeLink:@"thank-you-for-the-gift" withIntentionLabel:GWLocalizedString(@"<IntentionThankYouForTheGift>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionIWantYou {
    return [[self alloc] initWithIntentionId:@"F4566D" withIntentionSlug:@"j-ai-envie-de-toi" withSlugPrototypeLink:@"I-want-you" withIntentionLabel:GWLocalizedString(@"<IntentionIWantYou>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionGiveMeSomeNews {
    return [[self alloc] initWithIntentionId:@"F57DBD" withIntentionSlug:@"donne-moi-des-nouvelles" withSlugPrototypeLink:@"give-me-some-news" withIntentionLabel:GWLocalizedString(@"<IntentionGiveMeSomeNews>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionWhatIsUpWithYouLately {
    return [[self alloc] initWithIntentionId:@"F82B5C" withIntentionSlug:@"que-deviens-tu" withSlugPrototypeLink:@"what-is-up-with-you-lately" withIntentionLabel:GWLocalizedString(@"<IntentionWhatIsUpWithYouLately>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionMerryChristmas {
    return [[self alloc] initWithIntentionId:@"FD29D6" withIntentionSlug:@"joyeux-noel" withSlugPrototypeLink:@"Merry-Christmas" withIntentionLabel:GWLocalizedString(@"<IntentionMerryChristmas>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

+(instancetype)intentionSalutationClosingFormula {
    return [[self alloc] initWithIntentionId:@"FFF937" withIntentionSlug:@"formule-de-politesse" withSlugPrototypeLink:@"salutation-closing-formula" withIntentionLabel:GWLocalizedString(@"<IntentionSalutationClosingFormula>", @"") withWeightingCoefficient:[NSNumber numberWithFloat:100]];
}

@end

//
//  GWIntentionPresenter.h
//  GWFramework
//
//  Created by Mathieu Skulason on 03/08/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWIntentionPresenter : NSObject

/* Ids for the intention **/
@property (nonatomic, strong) NSString *intentionId, *intentionSlug, *intentionSlugPrototypeLink;
/* the intentino for the label, imagePath (nil if there is none) and the culture of the current intention. **/
@property (nonatomic, strong) NSString *intentionLabel, *imagePath, *culture;
/* The weighting coefficient for the intention **/
@property (nonatomic, strong) NSNumber *weightingCoefficient;


-(id)initWithIntentionId:(NSString*)theIntentionId withIntentionSlug:(NSString*)theIntentionSlug withSlugPrototypeLink:(NSString*)theSlugPrototypeLink withIntentionLabel:(NSString*)theIntentionLabel withWeightingCoefficient:(NSNumber*)theCoefficient;


+(instancetype)intentionIThinkOfYou;
+(instancetype)intentionILoveYou;
+(instancetype)intentionILikeYou;
+(instancetype)intentionIMissYou;
+(instancetype)intentionIWantYou;
+(instancetype)intentionHappyBirthday;
+(instancetype)intentionJokes;
+(instancetype)intentionIAmLate;
+(instancetype)intentionThankYou;
+(instancetype)intentionWantToGoForDrinks;
+(instancetype)intentionComeOverForDinner;
+(instancetype)intentionIAmHereForYou;
+(instancetype)intentionIAmSorry;
+(instancetype)intentionWhatIsNew;
+(instancetype)intentionHappyNewYear;
+(instancetype)intentionGoodNight;
+(instancetype)intentionSurpriseMe;
+(instancetype)intentionAFewWordsForYou;
+(instancetype)intentionHowAreYou;
+(instancetype)intentionPositiveThoughts;
+(instancetype)intentionFacebookStatus;
+(instancetype)intentionComeBackToMe;
+(instancetype)intentionGoodMorning;
+(instancetype)intentionBravo;
+(instancetype)intentionGetHomeSafe;
+(instancetype)intentionHumorousInsults;
+(instancetype)intentionThankYouForTheInvitation;
+(instancetype)intentionSampleLetterInsurance;
+(instancetype)intentionINeedAFavor;
+(instancetype)intentionStopTheWorld;
+(instancetype)intentionFarewellParty;
+(instancetype)intentionRetirementCongratulations;
+(instancetype)intentionWaitingForABaby;
+(instancetype)intentionIAmAskingForAMeeting;
+(instancetype)intentionCongratulationOnTheBirthOfYourBaby;
+(instancetype)intentionIWantToKnowAboutYou;
+(instancetype)intentionWeddingCongratulations;
+(instancetype)intentionNoThankYou;
+(instancetype)intentionWouldYouCareForADrink;
+(instancetype)intentionSampleLetterForBanksAndCredits;
+(instancetype)intentionSampleLetterConsumerRights;
+(instancetype)intentionThereIsSomethingMissing;
+(instancetype)intentionSampleLetter;
+(instancetype)intentionCondolences;
+(instancetype)intentionIWouldLikeToSeeYouAgain;
+(instancetype)intentionThankYouForTheMeeting;
+(instancetype)intentionRoutineIsLurking;
+(instancetype)intentionLetMeIntroduceMyself;
+(instancetype)intentionIAmJealous;
+(instancetype)intentionCelebrateTheOccasion;
+(instancetype)intentionLetUsStayInTouch;
+(instancetype)intentionThankYouFortheGift;
+(instancetype)intentionGiveMeSomeNews;
+(instancetype)intentionMerryChristmas;
+(instancetype)intentionSalutationClosingFormula;


@end

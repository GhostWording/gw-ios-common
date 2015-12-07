//
//  AppDelegate.m
//  GWFramework
//
//  Created by Mathieu Skulason on 20/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "AppDelegate.h"
#import "ServerCommunication.h"
#import "GWDataManager.h"
#import "GWText.h"
#import "GWCoreDataManager.h"
#import "GWIntentionPresenter.h"
#import "GWRealmDataManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [GWCoreDataManager sharedInstance];
    
    GWRealmDataManager *realmDataMan = [[GWRealmDataManager alloc] init];
    
    NSLog(@"default path: %@", [RLMRealm defaultRealm].path);
    
    [realmDataMan downloadAllTextsWithArea:@"LipTip" culture:@"fr-FR" withCompletion:^(NSArray *theIntentions, NSArray *theTexts, NSError *error) {
       
        NSLog(@"number of texts are: %d", [realmDataMan fetchTextsWithCulture:@"fr-FR" areaName:@"LipTip"].count);
        
    }];
    
    /*
    [realmDataMan downloadIntentionsWithArea:@"IThinkOfYou" culture:@"fr-FR" withCompletion:^(NSArray *theIntentions, NSError *theError) {
        
        NSLog(@"number of intentions are: %d", [realmDataMan fetchIntentionsWithCulture:@"fr-FR"].count);
        NSLog(@"number of intentions with id are: %d", [realmDataMan fetchIntentionsWithCulture:@"fr-FR" intentionId:@"016E91"].count);
        
        
    }];
    */
    /*
    [realmDataMan downloadTextsWithArea:@"IThinkOfYou" intentionId:@"016E91" culture:@"fr-FR" withCompletion:^(NSArray *theTexts, NSError *theError) {
       
        NSLog(@"number of texts are: %d", [realmDataMan fetchTextsWithCulture:@"fr-FR" areaName:@"IThinkOfYou" intentionId:@"016E91"].count);
        
    }];
    */
    /*
    ServerCommunication *serverComm = [[ServerCommunication alloc] init];
    [serverComm downloadIntentionsWithArea:@"IThinkOfYou" withCulture:@"fr-FR" withCompletion:^(NSArray *theIntentions, NSError *theError) {
        
    }];
    
    
    GWDataManager *dataMan = [[GWDataManager alloc] init];
    [dataMan downloadIntentionsWithArea:@"IThinkOfYou" withCulture:@"fr-FR" withCompletion:^(NSArray *intentionIds, NSError *error) {
        
    }];
    */
    /*
    GWDataManager *dataMan = [[GWDataManager alloc] init];
    [dataMan downloadTextsWithArea:@"IThinkOfYou" withIntentionId:@"016E91" withCulture:@"fr-FR" withCompletion:^(NSArray *textIds, NSError *error) {
        
        NSLog(@"performed block");
        
        GWText *text = [[dataMan fetchTexts] firstObject];
        //NSLog(@"the text is: %@", text);
        NSLog(@"all texts are: %d", (int)[dataMan fetchTexts].count);
        NSLog(@"all texts for intention: %d", (int)[dataMan fetchTextsForIntentionId:@"016E91"].count);
        NSLog(@"all texts for intention and culture: %d", (int)[dataMan fetchTextsForIntentionId:@"016E91" withCulture:@"fr-FR"].count);
        NSLog(@"all tets for multiple intentino ids: %d", (int)[dataMan fetchTextsForIntentionIds:@[@"016E91", [GWIntentionPresenter intentionRoutineIsLurking].intentionId]].count);
        NSLog(@"all texts for multiple intention ids and culture: %d", (int)[dataMan fetchTextsForIntentionIds:@[@"016E91", [GWIntentionPresenter intentionRoutineIsLurking].intentionId] withCulture:@"fr-FR"].count);
        
    }];*/
    
    /*
    
    [dataMan downloadIntentionsWithArea:@"IThinkOfYou" withCulture:@"fr-FR" withCompletion:^(NSArray *intentionIds, NSError *error) {
       
        NSLog(@"All intentions are: %d", (int)[dataMan fetchIntentions].count);
        NSLog(@"all intentions for culture are: %d", (int)[dataMan fetchIntentionsWithCulture:@"fr-FR"].count);
        
    }];
    
    [dataMan downloadImagePathsWithIntentionSlug:[GWIntentionPresenter intentionILikeYou].intentionSlugPrototypeLink withCompletion:^(NSArray *imagePaths, NSError *error){
        NSLog(@"image paths for intention slug are: %d", (int)imagePaths.count);
    }];
    
    [dataMan downloadImagePathsWithRecipientId:@"9E2D23" withCompletion:^(NSArray *imagePaths, NSError *error) {
        NSLog(@"image paths for recipient are: %d", (int)imagePaths.count);
    }];
    */
    /*
    [dataMan downloadImagePathsWithIntentionSlug:[GWIntentionPresenter intentionILikeYou].intentionSlugPrototypeLink withCompletion:^(NSArray *theImagePaths, NSError *error) {
        GWDataManager *newDataMan = [[GWDataManager alloc] init];
        [newDataMan downloadImagesWithUrls:theImagePaths withCompletion:^(NSArray *theImages, NSError *error) {
            GWDataManager *anotherDataMan = [[GWDataManager alloc] init];
            NSLog(@"downloaded images are: %d", (int)theImages.count);
            NSLog(@"fetched images are: %d", (int)[anotherDataMan fetchImagesOnBackgroundThread].count);
            NSLog(@"images are: %@", [anotherDataMan fetchImagesOnBackgroundThread]);
            
        }];
    }];*/
    /*
    [dataMan downloadImagesAndPersistWithIntentionSlug:[GWIntentionPresenter intentionILoveYou].intentionSlugPrototypeLink withNumImagesToDownload:10 withCompletion:^(NSArray *theImagePaths, NSError *error) {
        NSLog(@"the image paths downloaded: %@", theImagePaths);
        GWDataManager *theDataMan = [[GWDataManager alloc] init];
        NSLog(@"all images downloaded: %@", [theDataMan fetchImagesOnBackgroundThread] );
    }];
    
    GWIntentionPresenter *presenter = [GWIntentionPresenter intentionBravo];
    NSLog(@"Presenter label is: %@", presenter.intentionLabel);
     */
     
    /*
    GWDataManager *dataMan = [[GWDataManager alloc] init];
    [dataMan downloadTextsForIntention:@"016E91" withCompletion:^(NSArray *theTexts, NSError *error) {
        
        NSLog(@"performed block");
        
        GWText *text = [[dataMan fetchTexts] firstObject];
        NSLog(@"the text is: %@", text);
        NSLog(@"all texts are: %d", (int)[dataMan fetchTexts].count);
        NSLog(@"all texts for intention: %d", (int)[dataMan fetchTextsForIntentionId:@"016E91"].count);
    }];
    
    [dataMan downloadIntentionsWithArea:@"IThinkOfYou" withCompletion:^(NSArray *intentionIds, NSError *error) {
        NSLog(@"finished downloading intentions with area");
    }];
    
    [dataMan downloadAllAreasWithCompletion:^(NSArray *areaIds, NSError *error) {
       
        NSLog(@"Finished download all areas");
        
    }];
    
    [dataMan downloadArea:@"IThinkOfYou" withCompletion:^(NSString *areaId, NSError *error) {
        
        NSLog(@"finished downloading area");
        
    }];
    
    [dataMan downloadTextsForIntentions:@[@"016E91", @"5CDCF2"] withCompletion:^(NSArray *textIds, NSError *error) {
        NSLog(@"Downloadings texts for all intentions");
        NSLog(@"All texts for intentions: %@, number of texts: %d", @[@"016E91", @"5CDCF2"], (int)[dataMan fetchTextsForIntentionIds:@[@"016E91", @"5CDCF2"]].count);
    }];
    */
    
    
    /*
    ServerCommunication *serverComm = [[ServerCommunication alloc] initWithAreaName:@"IThinkOfYou"];
    [serverComm downloadTextsWithIntentionId:@"016E91" withCompletion:^(NSArray *theTexts, NSError *error) {
        
        NSLog(@"block repsonse for text download with id");
        
    }];
    
     */
     
    /*
    [serverComm downloadTextsWithIntentionSlug:@"I-think-of-you" withCompletion:^(NSArray *theTexts, NSError *error) {
       
        NSLog(@"block response for text download with slug: %@", theTexts);
        
    }];
    
    [serverComm downloadIntentionsWithArea:@"IThinkOfYou" withCompletion:^(NSArray *intentions, NSError *error) {
       
        NSLog(@"block response for intentions for area: %@ and intentions: %@", @"IThinkOfYou", intentions);
        
    }];
    
    [serverComm downloadAreasWithCompletion:^(NSArray *theAreas, NSError *error) {
       
        NSLog(@"block response for area: %@", theAreas);
        
    }];*/
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[GWCoreDataManager sharedInstance] mainObjectContext] save:nil];
    });
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    //[self saveContext];
}

@end

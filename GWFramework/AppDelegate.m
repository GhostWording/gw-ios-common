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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [GWCoreDataManager sharedInstance];
    
    GWDataManager *dataMan = [[GWDataManager alloc] init];
    [dataMan downloadTextsWithArea:@"IThinkOfYou" withIntentionId:@"016E91" withCulture:@"fr-FR" withCompletion:^(NSArray *textIds, NSError *error) {
        
        NSLog(@"performed block");
        
        GWText *text = [[dataMan fetchTexts] firstObject];
        NSLog(@"the text is: %@", text);
        NSLog(@"all texts are: %d", (int)[dataMan fetchTexts].count);
        NSLog(@"all texts for intention: %d", (int)[dataMan fetchTextsForIntentionId:@"016E91"].count);
        
    }];
    
    GWIntentionPresenter *presenter = [GWIntentionPresenter intentionBravo];
    NSLog(@"Presenter label is: %@", presenter.intentionLabel);
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
    
    [[[GWCoreDataManager sharedInstance] mainObjectContext] save:nil];
    
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

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.konta.GWFramework" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GWFramework" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"GWFramework.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end

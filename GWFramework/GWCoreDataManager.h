//
//  GWCoreDataManager.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GWText.h"

@interface GWCoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *mainObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectContext *childManagedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(instancetype)sharedInstance;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSDate*)dateFromJsonString:(NSString*)dateString;
- (NSManagedObjectContext*)childContext;

@end

//
//  GWFrameworkTests.m
//  GWFrameworkTests
//
//  Created by Mathieu Skulason on 20/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GWRealmDataManager.h"
#import "GWDataManager.h"

@interface GWFrameworkTests : XCTestCase

@end

@implementation GWFrameworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.inMemoryIdentifier = self.name;
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testRealmTextUpdatePerformance {
    // This is an example of a performance test case.
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"textTest" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *textJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"number of texts: %d", textJson.count);
    
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
        GWRealmDataManager *dataMan = [[GWRealmDataManager alloc] init];
        [dataMan updateOrPersistTextWithRealm:[RLMRealm defaultRealm] area:@"LipTip" culture:@"fr-FR" texts:textJson];
        
    }];
}

-(void)testRealmTextIntentionUpdatePErformance {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"textTest" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *textJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    [self measureBlock:^{
       
        GWRealmDataManager *dataMan = [[GWRealmDataManager alloc] init];
        [dataMan updateOrPersistTextWithRealm:[RLMRealm defaultRealm] area:@"LipTip" culture:@"fr-FR" intentionId:@"016E91" texts:textJson];
        
    }];
}

-(void)testCoreDataTextUpdatePerformance {
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"textTest" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *textJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    [self measureBlock:^{
        GWDataManager *dataMan = [[GWDataManager alloc] init];
        [dataMan updatedTextsWithArea:@"LipTip" intentionId:@"016E91" culture:@"fr-FR" texts:textJson];
    }];
    
}

@end

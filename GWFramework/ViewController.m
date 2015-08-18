//
//  ViewController.m
//  GWFramework
//
//  Created by Mathieu Skulason on 20/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "ViewController.h"
#import "GWDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self downloadTextsForArea:@"LipTip" withCompletion:^(NSArray *textIds, NSError *error) {
        NSLog(@"downloaded texts for area");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)downloadTextsForArea:(NSString *)theArea withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"downloading intentions");
    
    GWDataManager *theDataMan = [[GWDataManager alloc] init];
    
    [theDataMan downloadIntentionsWithArea:theArea withCulture:@"fr-FR" withCompletion:^(NSArray *intentionIds, NSError *error) {
        
        NSLog(@"downlaod intention response");
        
        GWDataManager *newDataMan = [[GWDataManager alloc] init];
        
        NSArray *allIntentions = [newDataMan fetchIntentionsOnBackgroundThread];
        NSLog(@"all intentions: %@", allIntentions);
        NSArray *slugsFromArray = [allIntentions valueForKey:@"slugPrototypeLink"];
        
        if (error) {
            block(nil, error);
            return ;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"dispatching main queue");
            GWDataManager *anotherDataMan = [[GWDataManager alloc] init];
            [anotherDataMan downloadTextsWithArea:theArea withIntentionSlugs:slugsFromArray withCulture:@"fr-FR" withCompletion:^(NSArray *textIds, NSError *error) {
                NSLog(@"downloading texts on main thread in text ids: %@", textIds);
            }];
        });
        
    }];
    
    /*
    GWDataManager *anotherDataMan = [[GWDataManager alloc] init];
    [anotherDataMan downloadTextsWithArea:theArea withIntentionIds:@[[GWIntentionPresenter intentionILikeYou].intentionId] withCulture:[UserDefaults currentCulture] withCompletion:^(NSArray *textIds, NSError *error) {
        NSLog(@"downloading texts on main thread in text ids: %@", textIds);
    }];
    */
    
}

@end

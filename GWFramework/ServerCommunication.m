//
//  ServerCommunication.m
//  GWFramework
//
//  Created by Mathieu Skulason on 20/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "ServerCommunication.h"

const NSString *apiPath = @"http://api.cvd.io/";

@interface ServerCommunication () {
    NSURLSession *session;
}

@end

@implementation ServerCommunication

#pragma mark - Initialization

/** accept language defaults to fr-FR, or france, areaName should include at the end. */

-(id)initWithAreaName:(NSString *)theAreaName {
    
    if (self = [super init]) {
        _areaName = theAreaName;
        _acceptLanguage = @"fr-FR";
        
        session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        
    }
    
    return self;
}

-(id)initWithAreaName:(NSString *)theAreaName andAcceptLanguage:(NSString *)theAcceptLanguage {
    
    if (self = [super init]) {
        _areaName = theAreaName;
        _acceptLanguage = theAcceptLanguage;
    }
    
    return self;
}

#pragma mark - Text Downloading


-(void)downloadTextsWithAreaName:(NSString *)theAreaName withIntentionId:(NSString *)theIntentionId withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/intention/%@/texts", apiPath, theAreaName, theIntentionId]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"texts with intention id: %@", array);
        
        block(array, error);
        
    }];
}

-(void)downloadTextsWithAreaName:(NSString *)theAreaName withIntentionSlug:(NSString *)theIntentionSlug withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@/texts", apiPath, _areaName, theIntentionSlug]];
    
    NSLog(@"url for texts with intention slug: %@", url.absoluteString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"texts with intention slug: %@", array);
        
        block(array, error);
        
    }];

}


-(void)downloadTextsWithIntentionsIds:(NSArray *)theIntentionIds withCompletion:(void (^)(BOOL finished, NSArray *, NSError *))block {
    [block copy];
    
    __block int numTextDownloads = 0;
    int numTextDownloadsToComplete = (int)theIntentionIds.count;
    
    for (NSString *intentionId in theIntentionIds) {
        
        [self downloadTextsWithIntentionId:intentionId withCompletion:^(NSArray *texts, NSError *error) {
           
            numTextDownloads = numTextDownloads + 1;
            
            
            
        }];
    }
    
}


-(void)downloadTextsWithIntentionId:(NSString *)theIntentionId withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSLog(@"download texts with id");
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/intention/%@/texts", apiPath, _areaName, theIntentionId]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"texts with intention id: %@", array);
        
        block(array, error);
        
    }] resume];
    
    /*
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"texts with intention id: %@", array);
        
        block(array, error);
        
    }];*/
    
}

-(void)downloadTextsWithIntentionSlug:(NSString *)theIntentionSlug withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@/texts", apiPath, _areaName, theIntentionSlug]];
    
    NSLog(@"url for texts with intention slug: %@", url.absoluteString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
       
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"texts with intention slug: %@", array);
        
        block(array, error);
        
    }];
    
}

#pragma mark - Intentions Downloading

-(void)downloadAllIntentions:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/intentions", apiPath]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
       
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"received all intentions: %@", array);
        
        block(array, error);
    }];
}

-(void)downloadIntentionsWithArea:(NSString *)theArea withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/intentions", apiPath, theArea]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
       
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"received intentions for area: %@, the intentions: %@", theArea, array);
        
        block(array, error);
        
    }];
    
}

#pragma mark - Area Downloading

-(void)downloadAllAreasWithCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/areas", apiPath]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"received areas: %@", array);
        
        block(array, error);
        
    }];
}

-(void)downloadArea:(NSString *)theAreaName withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", apiPath, theAreaName]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:_acceptLanguage forHTTPHeaderField:@"Accept-Language"];
    
    [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"Received are: %@", array);
        
        block(array, error);
        
    }];
    
}

@end

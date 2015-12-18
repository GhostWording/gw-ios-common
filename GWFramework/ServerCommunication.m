//
//  ServerCommunication.m
//  GWFramework
//
//  Created by Mathieu Skulason on 20/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "ServerCommunication.h"
#import "GWLocalizedBundle.h"

const NSString *apiPath = @"http://api.cvd.io/";
const NSString *apiImagePath = @"http://gw-static.azurewebsites.net";

@interface ServerCommunication () {
    NSURLSession *session;
}

@end

@implementation ServerCommunication

#pragma mark - Initialization

/** accept language defaults to fr-FR, or france, areaName should include at the end. */

-(id)init {
    if (self = [super init]) {
        session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

-(id)initWithAreaName:(NSString *)theAreaName {
    
    if (self = [super init]) {
        _areaName = theAreaName;
        _acceptLanguage = @"fr-FR";
        
        session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        //session = [NSURLSession sharedSession];
        //session.configuration.HTTPMaximumConnectionsPerHost = 2;
        
        
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


#pragma mark - Image Themes Download

-(void)downloadImageThemesWithCompletion:(void (^)(NSDictionary *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://gw-static-apis.azurewebsites.net/data/liptip/moodthemes.json"]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            NSDictionary *themes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            block(themes, nil);
        }
        else {
            block(nil, error);
        }
        
    }] resume];
    
    
    
}

#pragma mark - Image Downloading

-(void)downloadImageIdsForRelativePath:(NSString *)theRelativePath withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://gw-static.azurewebsites.net/container/files/%@?size=small", theRelativePath]];
    NSLog(@"url is: %@", url);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *allImagePaths = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                [allImagePaths removeLastObject];
                NSOrderedSet *imagePathsWithoutDoubles = [NSOrderedSet orderedSetWithArray:allImagePaths];
                NSArray *uniqueImagePaths = [imagePathsWithoutDoubles array];
                
                block(uniqueImagePaths, error);
            }
            else {
                
                // MARK: what to do when error and data is nil?
                
                block([NSArray array], nil);
            }
        }
        else {
            block(nil, error);
        }
        
    }] resume];
}

-(void)downloadImageIdsForIntentionSlug:(NSString *)theIntentionSlug withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://gw-static.azurewebsites.net/container/files/specialoccasions/%@/default?size=small", theIntentionSlug]];
    NSLog(@"the url: %@", url);
    
    //good-night
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *allImagePaths = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                [allImagePaths removeLastObject];
                NSOrderedSet *imagePathsWithoutDoubles = [NSOrderedSet orderedSetWithArray:allImagePaths];
                NSArray *uniqueImagePaths = [imagePathsWithoutDoubles array];
                
                block(uniqueImagePaths, error);
            }
            else {
                // MARK: What to do when error and data is nil?
                block([NSArray array], nil);
            }
        }
        else {
            block(nil, error);
        }
        
    }] resume];
}

-(void)downloadImageIdsForRecipientId:(NSString *)theRecipientId withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSString *recipientPath = nil;
    
    if ([theRecipientId isEqualToString:@"9E2D23"]) {
        recipientPath = @"sweetheart";
    }
    else if([theRecipientId isEqualToString:@"47B7E9"]) {
        recipientPath = @"loveinterest";
    }
    else if([theRecipientId isEqualToString:@"64C63D"] || [theRecipientId isEqualToString:@"BCA601"]) {
        recipientPath = @"parent";
    }
    else if([theRecipientId isEqualToString:@"87F524"] || [theRecipientId isEqualToString:@"3B9BF2"] || [theRecipientId isEqualToString:@"35AE93"] || [theRecipientId isEqualToString:@"2B4F14"]) {
        recipientPath = @"friend";
    }
    else if([theRecipientId isEqualToString:@"6E7DFB"]) {
        recipientPath = @"fbfriend";
    }
    else {
        recipientPath = @"sweetheart";
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://gw-static.azurewebsites.net/container/files/cvd/%@?size=small", recipientPath]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            
            if (data != nil) {
                NSMutableArray *allImagePaths = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                [allImagePaths removeLastObject];
                NSOrderedSet *imagePathsWithoutDoubles = [NSOrderedSet orderedSetWithArray:allImagePaths];
                NSArray *uniqueImagePaths = [imagePathsWithoutDoubles array];
                
                block(uniqueImagePaths, nil);
            }
            else {
                
                // MARK: what if the error gives us no data and no error?
                
                block([NSArray array], nil);
            }
            
        }
        else {
            block(nil, error);
        }

        
    }] resume];
}

-(NSData*)downloadImageWithRelativeImagePath:(NSString *)theImagePath {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", apiImagePath, theImagePath]];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    return imageData;
    
}

-(NSData*)downloadImageWithImageURL:(NSString *)theImagePath {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", theImagePath]];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    return imageData;
}

#pragma mark - Text Downloading


-(void)downloadTextsWithAreaName:(NSString *)theAreaName withIntentionId:(NSString *)theIntentionId withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/intention/%@/texts", apiPath, theAreaName, theIntentionId]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:theCulture forHTTPHeaderField:@"Accept-Language"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                //NSLog(@"texts with intention id: %@", array);
                
                block(array, error);
            }
            else {
                
                // MARK: What to do when error and data is nil?
                
                block([NSArray array], nil);
            }
        }
        else {
            block(nil, error);
        }
        
    }] resume];
    
}

-(void)downloadTextsWithAreaName:(NSString *)theAreaName withIntentionSlug:(NSString *)theIntentionSlug withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@/texts", apiPath, theAreaName, theIntentionSlug]];
    
    NSLog(@"url for texts with intention slug: %@", url.absoluteString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:theCulture forHTTPHeaderField:@"Accept-Language"];
    

    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                //NSLog(@"texts with intention slug: %@", array);
                
                block(array, error);
            }
            else {
                block([NSArray array], nil);
            }
        }
        else {
            block(nil, error);
        }
        
    }] resume];
     
}


#pragma mark - Intentions Downloading

-(void)downloadAllIntentionsWithCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/intentions", apiPath]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:theCulture forHTTPHeaderField:@"Accept-Language"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                //NSLog(@"received all intentions: %@", array);
                
                block(array, error);
            }
            else {
                
                // MARK: What do do when data and error is nil?
                block([NSArray array], nil);
            }
        }
        else {
            block(nil, error);
        }
        
    }] resume];
}

-(NSURLSessionDataTask *)downloadIntentionsWithArea:(NSString *)theArea withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/intentions", apiPath, theArea]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:theCulture forHTTPHeaderField:@"Accept-Language"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                block(array, error);
            }
            else {
                
                // MARK: What to do when data and error is nil
                
                block([NSArray array], nil);
            }
        }
        else {
            block(nil, error);
        }
        
    }];
    
    [dataTask resume];
    
    return dataTask;
    
}

#pragma mark - Area Downloading

-(void)downloadAllAreasWithCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/areas", apiPath]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:theCulture forHTTPHeaderField:@"Accept-Language"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSLog(@"received areas: %@", array);
                
                block(array, error);
            }
            else {
                
                // Mark: What to do when data and error is nil
                
                block([NSArray array], nil);
            }
        }
        else {
            
            block(nil,error);
        }
        
    }] resume];
}

-(void)downloadArea:(NSString *)theAreaName withCulture:(NSString *)theCulture withCompletion:(void (^)(NSArray *, NSError *))block {
    [block copy];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", apiPath, theAreaName]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:theCulture forHTTPHeaderField:@"Accept-Language"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        if (error == nil) {
            if (data != nil) {
                NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSLog(@"Received are: %@", array);
                
                block(array, error);
            }
            else {
                
                // MARK: What to do when error and data is nil
                
                block([NSArray array], nil);
            }
        }
        else {
            block(nil, error);
        }
        
    }] resume];
    
}

@end

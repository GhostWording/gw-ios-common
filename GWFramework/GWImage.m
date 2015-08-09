//
//  GWImage.m
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWImage.h"
#import "GWCoreDataManager.h"


@implementation GWImage

@dynamic imageData;
@dynamic imageId;

+(GWImage*)createGWImage {
    GWImage *theImage = [NSEntityDescription insertNewObjectForEntityForName:@"GWImage" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    return theImage;
}

+(GWImage*)createGWImageWithImagePath:(NSString *)theImagePath withImageData:(NSData *)theImageData withManagedContext:(NSManagedObjectContext *)theContext {
    GWImage *theImage = [NSEntityDescription insertNewObjectForEntityForName:@"GWImage" inManagedObjectContext:theContext];
    [theImage updateImageWithImagePath:theImagePath withImageData:theImageData];
    return theImage;
}

-(void)updateImageWithImagePath:(NSString *)theImagePath withImageData:(NSData *)theImageData {
    self.imageData = theImageData;
    self.imageId = theImagePath;
}

-(NSString*)description {
    return [NSString stringWithFormat:@"GWImage imageId: %@", self.imageId];
}

@end

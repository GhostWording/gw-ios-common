//
//  GWImage.h
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GWImage : NSManagedObject

@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) NSString * imageId;

+(GWImage*)createGWImage;
+(GWImage*)createGWImageWithImagePath:(NSString*)theImagePath withImageData:(NSData*)theImageData withManagedContext:(NSManagedObjectContext*)theContext;
-(void)updateImageWithImagePath:(NSString*)theImagePath withImageData:(NSData*)theImageData;
@end

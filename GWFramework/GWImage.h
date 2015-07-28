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
@property (nonatomic, retain) NSString * imagePath;
@property (nonatomic, retain) NSString * application;
@property (nonatomic, retain) NSString * imageId;
@property (nonatomic, retain) NSString * theme;

@end

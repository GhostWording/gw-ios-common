//
//  GWTag.m
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWTag.h"
#import "GWText.h"


@implementation GWTag

@dynamic tagId;
@dynamic text;

+(instancetype)createGWTag {
    GWTag *tag = [NSEntityDescription insertNewObjectForEntityForName:@"GWTag" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    return tag;
}

+ (instancetype)createGWTagWithContext:(NSManagedObjectContext *)theContext {
    
    GWTag *tag = [NSEntityDescription insertNewObjectForEntityForName:@"GWTag" inManagedObjectContext:theContext];
    
    return tag;
}

+(instancetype)createGWTagWithId:(NSString*)theTagId andText:(GWText*)theText withContext:(NSManagedObjectContext *)theContext {
    
    GWTag *tag = [NSEntityDescription insertNewObjectForEntityForName:@"GWTag" inManagedObjectContext:theContext];
    [tag updateTagWithId:theTagId andText:theText];
    
    return tag;
}

-(void)updateTagWithId:(NSString*)theTagId andText:(GWText*)theText {
    
    self.tagId = theTagId;
    self.text = theText;
    
}

-(NSString*)description {
    return [NSString stringWithFormat:@"GWTag %@", self.tagId];
}

@end

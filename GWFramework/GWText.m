//
//  GWText.m
//  GWFramework
//
//  Created by Mathieu Skulason on 21/07/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

#import "GWText.h"
#import "GWTag.h"

@implementation GWText

@dynamic abstract;
@dynamic author;
@dynamic content;
@dynamic culture;
@dynamic imageUrl;
@dynamic impersonal;
@dynamic intentionId;
@dynamic intentionLabel;
@dynamic isQuote;
@dynamic politeForm;
@dynamic prototypeId;
@dynamic proximity;
@dynamic referenceUrl;
@dynamic sender;
@dynamic sortBy;
@dynamic status;
@dynamic target;
@dynamic textId;
@dynamic updateDate;
@dynamic tagsString;
@dynamic tagIds;

+(instancetype)createGWText {
    GWText *text = [NSEntityDescription insertNewObjectForEntityForName:@"GWText" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    return text;
}

+(instancetype)createGWTextWithContext:(NSManagedObjectContext*)theContext {
    GWText *text = [NSEntityDescription insertNewObjectForEntityForName:@"GWText" inManagedObjectContext:theContext];
    return text;
}

+(instancetype)createGWTextWithDict:(NSDictionary *)jsonDict {
    GWText *text = [NSEntityDescription insertNewObjectForEntityForName:@"GWText" inManagedObjectContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    [text updateTextWithDict:jsonDict withContext:[[GWCoreDataManager sharedInstance] mainObjectContext]];
    
    return text;
}

+(instancetype)createGWTextWithDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext*)theContext {
    GWText *text = [GWText createGWTextWithContext:theContext];
    [text updateTextWithDict:jsonDict withContext:theContext];
    //NSLog(@"text content is: %@", text.content);
    
    return text;
}

// MARK: when updating stop creating new tag objects

-(void)updateTextWithDict:(NSDictionary *)jsonDict withContext:(NSManagedObjectContext *)theContext {
    
    if (jsonDict[@"Abstract"] != [NSNull null]) {
        self.abstract = jsonDict[@"Abstract"];
    }
    
    self.author = jsonDict[@"Author"];
    self.content = jsonDict[@"Content"];
    self.culture = jsonDict[@"Culture"];
    self.impersonal = jsonDict[@"Impersonal"];
    self.intentionId = jsonDict[@"IntentionId"];
    
    if (jsonDict[@"IntentionLabel"] != [NSNull null]) {
        self.intentionLabel = jsonDict[@"IntentionLabel"];
    }
    
    if (jsonDict[@"ImageUrl"] != [NSNull null]) {
        self.imageUrl = jsonDict[@"ImageUrl"];
    }
    
    if (jsonDict[@"ReferenceUrl"] != [NSNull null]) {
        self.referenceUrl = jsonDict[@"ReferenceUrl"];
    }
    
    self.isQuote = jsonDict[@"IsQuote"];
    self.politeForm = jsonDict[@"PoliteForm"];
    self.prototypeId = jsonDict[@"PrototypeId"];
    self.proximity = jsonDict[@"Proximity"];
    self.sender = jsonDict[@"Sender"];
    self.sortBy = jsonDict[@"SortBy"];
    self.status = jsonDict[@"Status"];
    self.tagsString = jsonDict[@"TagsString"];
    self.target = jsonDict[@"Target"];
    self.textId = jsonDict[@"TextId"];
    
    self.updateDate = [[GWCoreDataManager sharedInstance] dateFromJsonString:(NSString*) jsonDict[@"Updated"]];
    
    NSArray *tags = jsonDict[@"TagIds"];
    NSMutableOrderedSet *mutableSet = [[NSMutableOrderedSet alloc] init];
    
    /*
    if (self.tagIds != nil) {
        for (GWTag *tag in self.tagIds) {
            [theContext deleteObject:tag];
        }
    }*/
    if (self.tagIds != nil) {
        /* Causing mutated while being enumerated
        for (GWTag *tag in self.tagIds) {
            tag.text = nil;
        }
         */
    }
    
    for (NSString *tagId in tags) {
        GWTag *tag = [GWTag createGWTagWithId:tagId andText:self withContext:theContext];
        [mutableSet addObject:tag];
    }
    
    self.tagIds = mutableSet;
}

-(NSString*)description {
    return [NSString stringWithFormat:@"GWText author: %@, content: %@, culture: %@, impersonal: %@, intentionId: %@, isQuote: %@, politeForm: %@, prototypeId: %@, proximity: %@, sender: %@, sortBy: %@, status: %@, tagsString: %@, target: %@, textId: %@, updateDate: %@", self.author, self.content, self.culture, self.impersonal, self.intentionId, self.isQuote, self.politeForm, self.prototypeId, self.proximity, self.sender, self.sortBy, self.status, self.tagsString, self.target, self.textId, self.updateDate];
    //return [NSString stringWithFormat:@"GWText author: %@, content: %@, culture: %@, impersonal: %@, intentionId: %@, isQuote: %@, politeForm: %@, prototypeId: %@, proximity: %@, sender: %@, sortBy: %@, status: %@, tagsString: %@, target: %@, textId: %@, updateDate: %@, tags: %@", self.author, self.content, self.culture, self.impersonal, self.intentionId, self.isQuote, self.politeForm, self.prototypeId, self.proximity, self.sender, self.sortBy, self.status, self.tagsString, self.target, self.textId, self.updateDate, self.tagIds];
    // tagIds causes exc bad access
}

@end

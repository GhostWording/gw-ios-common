//
//  GWRLMText.h
//  GWFramework
//
//  Created by Mathieu Skulason on 24/10/15.
//  Copyright © 2015 Mathieu Skulason. All rights reserved.
//

#import <Realm.h>
#import "RLMObject.h"

@interface GWRLMText : RLMObject

@property NSString * abstract;
@property NSString * author;
@property NSString * content;
@property NSString * culture;
@property NSString * imageUrl;
@property NSString * impersonal;
@property NSString * intentionId;
@property NSString * intentionLabel;
@property BOOL isQuote;
@property NSString * politeForm;
@property NSString * prototypeId;
@property NSString * proximity;
@property NSString * referenceUrl;
@property NSString * sender;
@property int sortBy;
@property NSString * status;
@property NSString * target;
@property NSString * textId;
@property NSDate * updateDate;
@property NSString * tagsString;
@property NSString * areaName;

-(void)updateWithAreaName:(NSString *)theAreaName jsonDict:(NSDictionary *)theJsonDict;

@end

RLM_ARRAY_TYPE(GWRLMText);

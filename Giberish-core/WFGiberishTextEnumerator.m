//
//  WFGiberishTextEnumerator.m
//  Giberish
//
//  Created by Shiki on 3/2/13.
//  Copyright (c) 2013 webfactory. All rights reserved.
//

#import "WFGiberishTextEnumerator.h"

@interface WFGiberishTextEnumerator ()
{
    __weak WFGiberishText* giberishText;
    NSUInteger ngramLength;
    NSUInteger index;
}

@end

@implementation WFGiberishTextEnumerator


- (id)initWithWFGiberishText:(WFGiberishText*)text ngramLength:(NSUInteger)length
{
    if (length == 0) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        giberishText = text;
        ngramLength = length;
        index = 0;
    }
    
    return self;
}

- (NSArray *)allObjects
{
    return nil;
    
}

- (id)nextObject
{
    NSString* text = [giberishText text];
    
    if (index + ngramLength <= text.length) {
        
        NSRange range = {index, ngramLength};
        index++;
        return [text substringWithRange:range].lowercaseString;
        
    }
    
    return nil;
}


@end

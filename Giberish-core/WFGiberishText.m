//
//  WFGiberishText.m
//  Giberish
//
//  Created by Shiki on 3/2/13.
//  Copyright (c) 2013 webfactory. All rights reserved.
//

#import "WFGiberishText.h"
#import "WFGiberishTextEnumerator.h"

@implementation WFGiberishText

- (id)initWithString:(NSString*)content
{
    if (content) {
        
        self = [super init];
        
        if (self) {
            text = content;
        }
    }
    
    return self;
}

- (id)initWithTextFile:(NSURL*)textFile
{
    if (textFile) {
        
        self = [super init];
        
        if (self) {
            
            NSError* error;
            text = [[NSString alloc] initWithContentsOfURL:textFile
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
            if (error) {
                return nil;
            }
        }
    }
    
    return self;
}

- (NSEnumerator*)enumeratorWithLength:(NSUInteger)length
{
    WFGiberishTextEnumerator* enumrator = [[WFGiberishTextEnumerator alloc] initWithWFGiberishText:self
                                                                                       ngramLength:length];
    return enumrator;
}

- (NSString*)text
{
    return text;
}

@end

//
//  NSString+Language.m
//  Giberish
//
//  Created by Shiki on 3/2/13.
//  Copyright (c) 2013 webfactory. All rights reserved.
//

#import "NSString+Language.h"

@implementation NSString (Language)

- (BOOL)isAlphabetic
{
    unsigned int len = [self length];
    unichar buffer[len + 1];
    
    [self getCharacters:buffer range:NSMakeRange(0, len)];
    
    for(int i = 0; i < len; ++i) {
        char current = buffer[i];
        if (!isalpha(current)) {
            return NO;
        }
    }
    
    return YES;
}

@end

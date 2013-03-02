//
//  WFGiberishText.h
//  Giberish
//
//  Created by Shiki on 3/2/13.
//  Copyright (c) 2013 webfactory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFGiberishText : NSObject
{
 @private
    NSString* text;
}


- (id)initWithString:(NSString*)content;

- (id)initWithTextFile:(NSURL*)textFile;

- (NSEnumerator*)enumeratorWithLength:(NSUInteger)length;

- (NSString*)text;

@end

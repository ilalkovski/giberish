//
//  WFGiberishTextEnumerator.h
//  Giberish
//
//  Created by Shiki on 3/2/13.
//  Copyright (c) 2013 webfactory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFGiberishText.h"

@interface WFGiberishTextEnumerator : NSEnumerator

- (id)initWithWFGiberishText:(WFGiberishText*)text ngramLength:(NSUInteger)length;

@end

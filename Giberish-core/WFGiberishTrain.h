//
//  WFGiberishTrain.h
//  Giberish
//
//  Created by Shiki on 3/2/13.
//  Copyright (c) 2013 webfactory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFGiberishTrain : NSObject
{
    NSUInteger ngramLenght;
}

- (id)initGiberishTrainWithNgramLength:(NSUInteger)lenght;
- (void)trainSupportedLanguages;

@end

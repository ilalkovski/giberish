//
//  WFGiberishTrain.m
//  Giberish
//
//  Created by Shiki on 3/2/13.
//  Copyright (c) 2013 webfactory. All rights reserved.
//

#import "WFGiberishTrain.h"
#import "WFGiberishText.h"
#import "NSString+Language.h"

@implementation WFGiberishTrain

- (id)initGiberishTrainWithNgramLength:(NSUInteger)lenght
{
    if (lenght > 0) {
        self = [super init];
        
        if (self) {
            ngramLenght = lenght;
        }
    }
    
    return self;
}

- (void)trainSupportedLanguages
{
    
    NSString* supportedLanguagesFilePath = [[NSBundle mainBundle] pathForResource:@"SupportedLanguages" ofType:@"plist"];
    NSArray* supportedLanguages = [NSArray arrayWithContentsOfFile:supportedLanguagesFilePath];
    
    for (NSString* language in supportedLanguages)
    {
        [self trainLanguage:language];
    }

}

- (NSArray*)trainLanguage:(NSString*)language
{
    
    NSMutableDictionary* languageResult = [[NSMutableDictionary alloc] init];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:language ofType:@"txt"];
    if (filePath) {
        NSURL* fileUrl = [NSURL fileURLWithPath:filePath];
        WFGiberishText* giberishText = [[WFGiberishText alloc] initWithTextFile:fileUrl];
        
        NSEnumerator* enumerator = [giberishText enumeratorWithLength:ngramLenght];
        
        NSString* currentNgram;
        
        while ((currentNgram = [enumerator nextObject])) {
            
            if ([currentNgram isAlphabetic]) {
                if (languageResult[currentNgram]) {
                    int value = [languageResult[currentNgram] intValue];
                    languageResult[currentNgram] = @(value + 1);
                }else
                {
                    languageResult[currentNgram] = @(1);
                }
            }
        }
        
        for (NSString* key in languageResult) {
            NSLog(@"key: %@ value %d", key, [languageResult[key] intValue]);
        }
    }
   

    return nil;
}

@end

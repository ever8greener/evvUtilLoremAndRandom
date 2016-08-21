//
//  Helper.h
//  evvUtilLorem
//
//  Created by artist on 8/15/16.
//  Copyright © 2016 EddieKwon. All rights reserved.
//

@import Foundation;
@import UIKit;

#import <Foundation/Foundation.h>

@interface Helper : NSObject

@end

 // Lorem words
NSString *Lorem(NSUInteger numberOfParagraphs);
NSString *Ipsum(NSUInteger numberOfParagraphs);
NSString *AnyIpsum(NSUInteger numberOfParagraphs, NSString *topic); //web site is dead.

UIImage *LoremPixel(CGSize size, NSString *category, BOOL gray);
//
//  ViewController.m
//  evvUtilLorem
//
//  Created by artist on 8/15/16.
//  Copyright © 2016 EddieKwon. All rights reserved.
//


#import "ViewController.h"
#import "Helper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    NSString * testIpsum =    Lorem(6);
    
    NSLog(@"ipsum: %@",testIpsum);
    
    
    UIImageView *imageView = [UIImageView new];
    
    imageView.image = LoremPixel(CGSizeMake(300, 300), nil, NO);
    
    NSLog(@"DONE");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (NSString * ) TrimWords: (NSString *)string numberOfWords:( NSUInteger) numberOfWords
//{
//    NSArray *array = [string componentsSeparatedByString:@" "];
//    NSArray *subArray = [array subarrayWithRange:NSMakeRange(0, MIN(array.count, numberOfWords))];
//    return [subArray componentsJoinedByString:@" "];
//}
//
//- (NSString *)  TrimParas:(NSString *)string  numberOfWords:(NSUInteger) numberOfWords
//{
//    NSMutableArray *trimmed = [NSMutableArray array];
//    NSArray *paras = [string componentsSeparatedByString:@"\n\n"];
//    for (NSString *p in paras)
//        [trimmed addObject: TrimWords(p, numberOfWords)];
//    return [trimmed componentsJoinedByString:@"\n\n"];
//}
//
//- (NSString * )  Lorem: (NSUInteger) numberOfParagraphs
//{
//    NSString *urlString = [NSString stringWithFormat:@"http://loripsum.net/api/%0ld/short/prude/plaintext", (long) numberOfParagraphs];
//    
//    NSError *error;
//    NSString *string = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:&error];
//    if (!string)
//    {
//        NSLog(@"Error: %@", error.localizedDescription);
//        return nil;
//    }
//    return  TrimParas(string, 20);
//}



@end



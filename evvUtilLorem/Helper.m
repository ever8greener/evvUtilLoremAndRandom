//
//  Helper.m
//  evvUtilLorem
//
//  Created by artist on 8/15/16.
//  Copyright © 2016 EddieKwon. All rights reserved.
//  예제출처: Courmet iOS, Developer's cookbook. by 에리카세든,

#import "Helper.h"
@import ObjectiveC;
#if TARGET_OS_IPHONE
#define View UIView
#define Color UIColor
#define Image UIImage
#define Font UIFont
#elif TARGET_OS_MAC
#define View NSView
#define Color NSColor
#define Image NSImage
#define Font NSFont
#endif

@import Foundation;


@implementation Helper

@end


/*
 
 Erica Sadun, http://ericasadun.com
 HANDY PACK
 
 Useful items for testing and development
 
 추가사이트: http://www.cupcakeipsum.com
 
 */


#pragma mark - Ipsum


NSString *TrimWords(NSString *string, NSUInteger numberOfWords)
{
    NSArray *array = [string componentsSeparatedByString:@" "]; // 공백.
    NSArray *subArray = [array subarrayWithRange:NSMakeRange(0, MIN(array.count, numberOfWords))]; //최대 20단어까지만 collect 함.
    return [subArray componentsJoinedByString:@" "];
}

NSString *TrimParas(NSString *string, NSUInteger numberOfWords)
{
    NSMutableArray *trimmed = [NSMutableArray array];
    NSArray *paras = [string componentsSeparatedByString:@"\n\n"];
    for (NSString *p in paras)
        [trimmed addObject:TrimWords(p, numberOfWords)];
    return [trimmed componentsJoinedByString:@"\n\n"];
}

NSString *Lorem(NSUInteger numberOfParagraphs)
{
    NSString *urlString = [NSString stringWithFormat:@"http://loripsum.net/api/%0ld/short/prude/plaintext", (long) numberOfParagraphs];
    
    NSError *error;
    NSString *string = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:&error];
    if (!string)
    {
        NSLog(@"Error: %@", error.localizedDescription);
        return nil;
    }
    return TrimParas(string, 20);
}

NSString *Ipsum(NSUInteger numberOfParagraphs)
{
    return Lorem(numberOfParagraphs);
}


NSString *AnyIpsum(NSUInteger numberOfParagraphs, NSString *topic) //해당사이트가 작동 안함. 못쓸 함수.
{
    NSString *urlString = [NSString stringWithFormat:@"http://www.anyipsum.com/api/term/%@/paragraphs/%d", [topic stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], (int) numberOfParagraphs];
    
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    if (!data)
    {
        NSLog(@"Error: %@", error.localizedDescription);
        return nil;
    }
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (!dict)
    {
        NSLog(@"Error creating JSON dictionary: %@", error);
        return nil;
    }
    
    NSString *string = dict[@"anyIpsum"];
    return TrimParas(string, 15);
}


UIImage *LoremPixel(CGSize size, NSString *category, BOOL gray)
{
    /*
     e.g. http://lorempixel.com/400/200/sports/1/Dummy-Text
     abstract animals business cats city food nightlife fashion people nature sports technics transport
      유사사이트: http://placekitten.com 고양이그림.
     */
    NSMutableString *string = [NSMutableString stringWithFormat:@"http://lorempixel.com%@/%0.0f/%0.0f", gray ? @"/g/" : @"", floorf(size.width), floorf(size.height)];
    if (category)
        [string appendFormat:@"/%@", category];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:string]];
 
    return [UIImage imageWithData:data];
    
}

//random user 사용자이름등 랜덤  https://randomuser.me/api
// 상세설명: https://randomuser.me/documentation
// 가상의 100명의 신원요청법 :  http://api.randomuser.me/?results=100


//fakenamegenerator.com
//http://www.fakenamegenerator.com/gen-random-us-us.php  는 5만개까지 정보주문가능.


// 랜덤피드: http://jsonplaceholder.typicode.com/todos/1  ( 오픈소스이므로 자체서버에 설치가능/직접다운도 가능 )
//  https://github.com/typicode/json-server



//메탈 http://metallizer.dk/api/json/0        헤비메탈갰
//http://api.icndb.com/jokes/random          척 노리스 조크.
//http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=SMH   텍스트마이닝, 국립센터 약어검색


//XML 예제는
// http://feeds.bbci.co.uk/news/science_and_environment/rss.xml



#pragma mark - Random

NSUInteger RandomInteger(NSUInteger max)// 0~ max-1 사이의 난수
{
    return arc4random_uniform((unsigned int) max);
}

CGFloat Random01() //0~1 사이 부동소수점
{
    return ((CGFloat) arc4random() / (CGFloat) UINT_MAX);
}

BOOL RandomBool() // 동전을 던질때 임의의 참(?) 값을 반환.
{
    return (BOOL)arc4random_uniform(2);
}

CGPoint RandomPointInRect(CGRect rect) // 사각영역내 임의 지점
{
    CGFloat x = rect.origin.x + Random01() * rect.size.width;
    CGFloat y = rect.origin.y + Random01() * rect.size.height;
    return CGPointMake(x, y);
}

id RandomItemInArray(NSArray *array) // 배열내 임의 아이템
{
    NSUInteger index = RandomInteger(array.count);
    return array[index];
}

#pragma mark - Color

#if TARGET_OS_IPHONE
#define COLOR_PREFIX colorWithRed
#elif TARGET_OS_MAC
#define COLOR_PREFIX colorWithDeviceRed
#endif

// Underscore prevents issues when combined with color pack
Color *Random_Color()
{
    return [Color COLOR_PREFIX:Random01()
                         green:Random01()
                          blue:Random01()
                         alpha:1.0f];
}

#undef COLOR_PREFIX






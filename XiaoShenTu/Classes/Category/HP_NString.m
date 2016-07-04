//
//  NNString.m
//  AllBelieve
//
//  Created by fengxiaoguang on 14-3-25.
//  Copyright (c) 2014年 aaa. All rights reserved.
//

#import "HP_NString.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
//#import "FTCoreTextView.h"

#define queding @"确定"

#define PassWordRegex @"^(?![0-9]+$)(?![a-zA-Z]+$)(?![^0-9a-zA-Z]+$).{6,16}$"//正则密码正则数字字母特殊字符任意两种组合
#define PhoneNoRegex @"^(1(([3578][0-9])|(47)))\\d{8}$"

@implementation HP_NString

+ (NSString *)getRightString_BysortArray_dic:(NSDictionary *)dic
{
    NSMutableString *rightString =[NSMutableString stringWithString:@""];
    NSArray *_sortedArray= [[dic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in _sortedArray)
    {
        [rightString appendFormat:@"%@",[dic objectForKey:key]];
    }
    return rightString;
}

+(NSString*)delStringNull:(id)object
{
    
    if ([object isEqual:[NSNull null]])
    {
        return @"";
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else if (object==nil)
    {
        return @"";
    }
    return object;
    
}

+(id)delObjectNull:(id)object
{
    
    if ([object isEqual:[NSNull null]])
    {
        return nil;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    else if (object==nil)
    {
        return nil;
    }
    return object;
    
}


+(NSMutableDictionary* )delStringNullOfDictionary:(NSDictionary *)object
{
    NSMutableDictionary* Dict=[[NSMutableDictionary alloc]initWithCapacity:0];
    
    for (NSString *key in object)
    {
        [Dict setObject:[self delStringNull:[object objectForKey:key]] forKey:key];
    }
    
    return Dict;
}

+(NSData *) getDataFromString:(NSString *) string encoding:(NSStringEncoding)encoding{
    //NSUTF32BigEndianStringEncoding
    return [string dataUsingEncoding:encoding];
}



+(CGSize) sizeOfText:(NSString *) text withFont:(UIFont *) font andSize:(CGSize) size andLineSpace:(CGFloat) lineSpace andColor:(UIColor *) color
{
    CGSize resSize = CGSizeZero;
    NSMutableAttributedString *attStr = [HP_NString createAttributeStringWithText:text LineSpace:lineSpace andFont:font andColor:color];
    resSize = [attStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return  resSize;
}


+ (NSMutableAttributedString *) createAttributeStringWithText:(NSString *) text LineSpace:(CGFloat) lineSpace andFont:(UIFont *) font andColor:(UIColor *) color
{
    if(nil == text)
        return nil;
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    //设置字体颜色
    [attStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length)];
    //设置行距
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;//行距
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    return attStr;
}

+(CGSize) sizeOfText:(NSString *) text withFont:(UIFont *) font andSize:(CGSize) size andColor:(UIColor *) color
{
    CGSize resSize = CGSizeZero;
    NSMutableAttributedString *attStr = [HP_NString createAttributeStringWithText:text andFont:font andColor:color];
    resSize = [attStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return  resSize;
}
//+(CGSize) sizeOfText:(NSString *) text withFont:(UIFont *) font andSize:(CGSize) size andDic:(NSDictionary *)dic
//{
//    CGSize resSize = CGSizeZero;
//    NSMutableAttributedString *attStr = [HP_NString createAttributeStringWithText:text andFont:font andColor:color];
//    resSize = [attStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
//    return  resSize;
//}

+ (NSMutableAttributedString *) createAttributeStringWithText:(NSString *) text andFont:(UIFont *) font andColor:(UIColor *) color
{
    if(nil == text)
        return nil;
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    //设置字体颜色
    [attStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length)];
    //设置行距
    NSParagraphStyle *style = [NSParagraphStyle defaultParagraphStyle];
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    return attStr;
}


+(BOOL)isNumber:(NSString *) string
{
    NSArray *numbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    if([numbers indexOfObject:string] != NSNotFound)
    {
        return YES;
    }
    return NO;
}


+ (NSString *) getCurrentTimeWithSpecialFormat:(NSString* )string
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:string];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    return  currentDateStr;
}

+ (NSString *)getTimeWithTimestamp:(NSTimeInterval)timestamp andFormat:(NSString *) format
{
    NSDate *publishDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:publishDate];
}

+ (BOOL)checkshenfenzhengString:(NSString *)str
{
    
    NSString* msgstring=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (msgstring.length==0)
    {
        return NO;
    }
    if (msgstring.length!=18)
    {
        return NO;
    }
    
    for (int i=0; i<str.length-1; i++)
    {
        if (!isdigit([str characterAtIndex:i]))
        {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)checkMobileString:(NSString *)string
{
    //使用stringByTrimmingCharactersInSet函数过滤字符串中的特殊符号
    NSString* msgstring=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (msgstring.length==0)
    {
        return NO;
    }
    //1[0-9]{10}
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    //    NSString *regex = @"[0-9]{11}";
    NSString *regex = PhoneNoRegex;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    
    if (!isMatch)
    {
        return NO;
    }
    return YES;
    
}
+ (BOOL)checkEmailString:(NSString *)EmailString
{
    NSString* msgstring=[EmailString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (msgstring.length==0)
    {
        return NO;
    }

    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    if (![emailTest evaluateWithObject:EmailString])
    {
        return NO;
    }
    return YES;
}

+ (BOOL)checkPostcodeString:(NSString *)string
{
    
    NSString* msgstring=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (msgstring.length==0)
    {
        return NO;
    }
    if (msgstring.length!=6)
    {
        return NO;
    }
    if ([msgstring intValue]<0)
    {
        return NO;
    }
    return YES;
}

+ (NSString *)trim:(NSString *)val trimCharacterSet:(NSCharacterSet *)characterSet {
    NSString *returnVal = @"";
    if (val)
    {
        returnVal = [val stringByTrimmingCharactersInSet:characterSet];
    }
    return returnVal;
}

+ (NSString *)trimWhitespace:(NSString *)val
{
    
    return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceCharacterSet]]; //去掉前后空格
}

+ (NSString *)trimNewline:(NSString *)val
{
    
    return [self trim:val trimCharacterSet:[NSCharacterSet newlineCharacterSet]]; //去掉前后回车符
}

+ (NSString *)trimWhitespaceAndNewline:(NSString *)val
{
    return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去掉前后空格和回车符
}
+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
+ (NSString *)deviceIPAdress {
    NSString *address = @"110.110.110.110";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
        freeifaddrs(interfaces);
        
        return address;
    }else{
        return @"110.110.110.110";
    }
    

}

+ (NSString *)stringRemoveID:(NSString *)name
{
//    if ([YSXUserInfo sharedYSXUserInfo].user!=nil&&[YSXUserInfo sharedYSXUserInfo].user.length>0) {
        NSRange range = [name rangeOfString:@"_"];
        if (range.location != NSNotFound) {
            return [name substringWithRange:NSMakeRange(0, range.location)];
        }
//    }
    return name;

}

+ (NSString *)stringRemoveTZ:(NSString *)name
{
    if (name!=nil&&[name description].length>0) {
        if ([[name substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"@"]) {
            NSRange range = [name rangeOfString:@"_"];
            if (range.location == NSNotFound) {
                return name;
            }
            NSRange range1 = [name rangeOfString:@" "];
            NSString *nameNew =[name substringWithRange:NSMakeRange(0, range.location)];
            NSInteger  loc= range1.location;
            NSInteger len = name.length-range1.location;
            NSString *nameNew1 =[name substringWithRange:NSMakeRange(loc, len)];
            return [NSString stringWithFormat:@"%@%@",nameNew,nameNew1];
        }
        return name;
    }
    return name;
}
@end

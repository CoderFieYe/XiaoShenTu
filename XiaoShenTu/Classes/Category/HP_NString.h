//
//  NNString.h
//  AllBelieve
//
//  Created by fengxiaoguang on 14-3-25.
//  Copyright (c) 2014年 aaa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HP_NString : NSString

//字典正序排序
+ (NSString *) getRightString_BysortArray_dic:(NSDictionary *)dic;
//清除对象里的<NULL>
+(NSString*)delStringNull:(id)object;

+(id)delObjectNull:(id)object;

//清除对象里的<NULL>
+(NSMutableDictionary *)delStringNullOfDictionary:(NSDictionary*)object;

//NSString类型转NSDate类型
+(NSData *) getDataFromString:(NSString *) string encoding:(NSStringEncoding)encoding;

// 根据字符串、字体、行间距、颜色获得字体所占空间大小CGSize，限制在size大小范围内
+(CGSize) sizeOfText:(NSString *) text withFont:(UIFont *) font andSize:(CGSize) size andLineSpace:(CGFloat) lineSpace andColor:(UIColor *) color;

+(NSMutableAttributedString *) createAttributeStringWithText:(NSString *) text LineSpace:(CGFloat) lineSpace andFont:(UIFont *) font andColor:(UIColor *) color;
/** 默认行间距 */
+(CGSize) sizeOfText:(NSString *) text withFont:(UIFont *) font andSize:(CGSize) size andColor:(UIColor *) color;
/** 转行成 富文本 */
+ (NSMutableAttributedString *) createAttributeStringWithText:(NSString *) text andFont:(UIFont *) font andColor:(UIColor *) color;

+(BOOL)isNumber:(NSString *) string;

+ (NSString *) getCurrentTimeWithSpecialFormat:(NSString* )string;

// 按照format格式 获取时间戳对应的时间
+ (NSString *) getTimeWithTimestamp:(NSTimeInterval)timestamp andFormat:(NSString *) format;

//验证身份证
+ (BOOL)checkshenfenzhengString:(NSString *)str;

//验证手机号
+ (BOOL)checkMobileString:(NSString *)string;

//验证邮箱
+ (BOOL)checkEmailString:(NSString *)EmailString;

//验证邮编
+ (BOOL)checkPostcodeString:(NSString *)string;

// 去掉前后空格
+ (NSString *)trimWhitespace:(NSString *)val;

// 去掉前后回车符
+ (NSString *)trimNewline:(NSString *)val;

// 去掉前后空格、回车符
+ (NSString *)trimWhitespaceAndNewline:(NSString *)val;

//验证字符串是否为空
+ (BOOL)isBlankString:(NSString *)string;

//获取ip
+ (NSString *)deviceIPAdress;  

//微社区截取
+ (NSString *)stringRemoveID:(NSString *)name;

//微社区截取@功能
+ (NSString *)stringRemoveTZ:(NSString *)name;
@end

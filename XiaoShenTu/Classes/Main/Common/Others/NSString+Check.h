//
//  NSString+Check.h
//  Biyouwoshi
//
//  Created by 任是无情也动人 on 14/11/26.
//  Copyright (c) 2014年 Biyouwoshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Check)
- (BOOL)isNormal;		// thanks to @uxyheaven
//- (BOOL)isTelephone;    // match telephone
- (BOOL)isMobilephone;  // match mobilephone, 11 numberic
- (BOOL)isUserName;     // match alphabet 3-20
- (BOOL)isChineseUserName;  // match alphabet and chinese characters, 3-20
- (BOOL)isChineseName;      // match just chinese characters 2-16
- (BOOL)isPassword;
- (BOOL)isEmail;
- (BOOL)isUrl;
- (BOOL)isIPAddress;
- (BOOL)isIDpicpath;
-(id)clearStringValue;
-(BOOL)isPositiveFloat;

@end

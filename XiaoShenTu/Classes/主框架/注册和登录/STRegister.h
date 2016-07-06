//
//  STRegister.h
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKCountDownButton;

@interface STRegister : UIView


@property (nonatomic, weak) UITextField *PhoenNum;
@property (nonatomic, weak) UITextField *yanzhengNum;
@property (nonatomic, weak) UITextField *mimaField;


@property (nonatomic, weak) JKCountDownButton *yanzBtn;
@property (nonatomic, weak) UIButton *registerBtn;


//@property (nonatomic, assign) BOOL PhoneRight;
@end

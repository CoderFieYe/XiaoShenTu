//
//  STHInfomationXView.h
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STHInfomation.h"

@interface STHInfomationXView : UIView
@property (nonatomic, strong) STHInfomation *infomation;


@property (weak, nonatomic) IBOutlet UIButton *ImgBtn;
@property (weak, nonatomic) IBOutlet UILabel *daBabyLab;

@property (weak, nonatomic) IBOutlet UILabel *versionLab;
@property (weak, nonatomic) IBOutlet UILabel *upGradeLab;

@property (weak, nonatomic) IBOutlet UIButton *weiChatBtn;

@property (weak, nonatomic) IBOutlet UIButton *callBtn;

@property (weak, nonatomic) IBOutlet UIButton *superListen;
@property (weak, nonatomic) IBOutlet UIButton *emergency;
@property (weak, nonatomic) IBOutlet UIButton *jiliBrn;




+(instancetype)InfomationView;
+(instancetype)InfomationViewWithModel:(STHInfomation *)infomation;
@end

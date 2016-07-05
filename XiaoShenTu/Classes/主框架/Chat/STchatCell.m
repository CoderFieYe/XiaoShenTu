//
//  STchatCell.m
//  XiaoShenTu
//
//  Created by a on 16/7/3.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STchatCell.h"
#import "Masonry.h"

@interface STchatCell()

@property (nonatomic,strong) UIImageView *iconView; //头像
@property (nonatomic,strong) UILabel *nickLabel;  //昵称
@property (nonatomic,strong) UILabel *contentLabel; //内容
@property (nonatomic,strong) UILabel *timeLabel;  //时间

@end

@implementation STchatCell

-(void)setChat:(STchat *)chat
{
    _chat = chat;
    self.iconView.image = [UIImage imageNamed:chat.icon];
    self.nickLabel.text = chat.name;
    self.contentLabel.text = chat.content;
    self.timeLabel.text = chat.time;
}
+(instancetype)stcellWithTableView:(UITableView *)tableView
{
        static NSString *identifier= @"st";
         STchatCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
         if (cell==nil) {
                 //如何让创建的cell加个戳
             cell = [[STchatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                 NSLog(@"创建了一个cell");
            }
         return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if(self){
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView.layer.cornerRadius = 8;
        self.iconView.layer.masksToBounds = YES;
        self.iconView = iconView;
        
        
        UILabel *nickLabel = [[UILabel alloc] init];
        nickLabel.font = [UIFont systemFontOfSize:10];
         [self.contentView addSubview:nickLabel];
        self.nickLabel = nickLabel;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
  }
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.mas_left).offset(7);
        make.top.mas_equalTo(self.mas_top).offset(9);
        make.width.mas_equalTo(36);
        make.height.mas_equalTo(36);
    }];

    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(11);
        make.top.mas_equalTo(self.iconView.mas_top).offset(4);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(11);
        make.top.mas_equalTo(self.nickLabel.mas_top).offset(14);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(14);
        make.top.mas_equalTo(self.iconView.mas_top).offset(4);
    }];
}

@end

//
//  STphotoCell.m
//  XiaoShenTu
//
//  Created by a on 16/7/4.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STphotoCell.h"
#import "Masonry.h"

@interface STphotoCell()

@property (nonatomic,strong) UIImageView *iconView; //头像
@property (nonatomic,strong) UILabel *nickLabel;  //昵称
@property (nonatomic,strong) UILabel *forwardLabel;  //转发
@property (nonatomic,strong) UIView *conView; //内容
@property (nonatomic,strong) UIImageView *photoView;
@property (nonatomic,strong) UILabel *timeLabel;  //时间
@property (nonatomic,strong) UIImageView *shareView; //分享

@property (nonatomic,strong) UIButton *moreButton;
/**
 *  是否展开
 */
@property (nonatomic, assign, getter = isExpand) BOOL expand;
@end

@implementation STphotoCell

-(void)setPhoto:(STPhoto *)photo{
    
    _photo = photo;
    //头像
    self.iconView.image = [UIImage imageNamed:photo.icon];
    NSLog(@"%f",XScaleHeight(44));
    self.iconView.frame = CGRectMake(15, 15, XScaleWidth(84), XScaleHeight(84));
    //昵称
    self.nickLabel.text = photo.nick;
    CGSize nickSize = [self.nickLabel.text sizeWithFont:self.nickLabel.font];
    self.nickLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.iconView.y, nickSize.width, nickSize.height);
    //内容
    self.forwardLabel.text = photo.forward;
    CGSize forwardSize  =  [HP_NString sizeOfText:self.forwardLabel.text withFont:self.forwardLabel.font andSize:CGSizeMake(SCREEN_WIDTH-self.iconView.right-XScaleWidth(60), 1000) andColor:self.forwardLabel.textColor];
    self.forwardLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.nickLabel.bottom+XScaleHeight(28), forwardSize.width, forwardSize.height);
    
    UILabel *thirdL = [[UILabel alloc]init];
    thirdL.font = self.forwardLabel.font;
    thirdL.text = @"yihang";
    
    CGSize oneSize = [HP_NString sizeOfText:thirdL.text withFont:thirdL.font andSize:CGSizeMake(SCREEN_WIDTH-self.iconView.right-XScaleWidth(60), 1000) andColor:thirdL.textColor];
    NSLog(@"%lf----%lf",oneSize.height,self.forwardLabel.font.lineHeight);
    CGFloat imgY = self.forwardLabel.bottom + XScaleHeight(30);
    if (forwardSize.height > 3 * self.forwardLabel.font.lineHeight) {
         _moreButton.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.forwardLabel.bottom+XScaleHeight(15), 30, 15);
        imgY =_moreButton.bottom+XScaleHeight(30);
    }

    //图片
    self.photoView.image = [UIImage imageNamed:photo.photo];
    self.photoView.frame = CGRectMake(self.iconView.right + XScaleWidth(20),imgY, XScaleWidth(500), XScaleHeight(250));
    
    self.timeLabel.text = photo.time;
    self.timeLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.photoView.bottom+XScaleHeight(30), XScaleWidth(100), XScaleHeight(20));
    
    
    self.shareView.image = [UIImage imageNamed:photo.share];
    self.shareView.frame = CGRectMake(SCREEN_WIDTH-self.forwardLabel.right, self.photoView.bottom+XScaleHeight(30),XScaleWidth(38), XScaleHeight(28));
    
}
+(instancetype)stcellWithTableView:(UITableView *)tableView
{
    static NSString *identifier= @"photo";
    STphotoCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        //如何让创建的cell加个戳
        cell = [[STphotoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"创建了一个cell");
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
        // 开始默认不展开
        self.expand = NO;
        
        
        UIImageView *iconView = [[UIImageView alloc] init];
        //        self.iconView.layer.cornerRadius = 8;
        //        self.iconView.layer.masksToBounds = YES;
        
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        
        UILabel *nickLabel = [[UILabel alloc] init];
        nickLabel.font = [UIFont systemFontOfSize:15];
        nickLabel.textColor = [UIColor colorWithHexString:@"#576c96"];
        [self.contentView addSubview:nickLabel];
        self.nickLabel = nickLabel;
        
        UILabel *forwardLabel = [[UILabel alloc] init];
        forwardLabel.font = [UIFont systemFontOfSize:15];
        forwardLabel.textColor = [UIColor colorWithHexString:@"#000000"];
        
        forwardLabel.numberOfLines = 0;
        
        [self.contentView addSubview:forwardLabel];
        self.forwardLabel = forwardLabel;
        
        _moreButton = [UIButton new];
        
        
        [_moreButton setTitle:@"全文" forState:UIControlStateNormal];
        [_moreButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(moreButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_moreButton];
        
        
        
        UIImageView *photoView = [[UIImageView alloc] init];
        [self.contentView addSubview:photoView];
        self.photoView = photoView;
        
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = [UIFont systemFontOfSize:13];
        timeLabel.textColor = [UIColor colorWithHexString:@"#737373"];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        UIImageView *shareView = [[UIImageView alloc] init];
        self.shareView = shareView;
        [self.contentView addSubview:shareView];
    }
    return self;
}
- (void)moreButtonClicked
{
    
    if (self.expand == NO) {
        CGSize forwardSize  =  [HP_NString sizeOfText:self.forwardLabel.text withFont:self.forwardLabel.font andSize:CGSizeMake(SCREEN_WIDTH-self.iconView.right-XScaleWidth(60), 1000) andColor:self.forwardLabel.textColor];
        self.forwardLabel.size = forwardSize;
        self.forwardLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.nickLabel.bottom+XScaleHeight(28), forwardSize.width, forwardSize.height);
        _moreButton.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.forwardLabel.bottom+XScaleHeight(15), 30, 15);
        //图片
        
        self.photoView.frame = CGRectMake(self.iconView.right + XScaleWidth(20),_moreButton.bottom+XScaleHeight(30), XScaleWidth(500), XScaleHeight(250));
        
        
        self.timeLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.photoView.bottom+XScaleHeight(30), XScaleWidth(100), XScaleHeight(20));
        
        
        
        self.shareView.frame = CGRectMake(self.forwardLabel.right-XScaleWidth(38), self.photoView.bottom+XScaleHeight(30),XScaleWidth(38), XScaleHeight(28));
        
        [_moreButton setTitle:@"收起" forState:UIControlStateNormal];
        self.expand = YES;
    }else{
        //头像
        
        NSLog(@"%f",XScaleHeight(44));
        self.iconView.frame = CGRectMake(15, 15, XScaleWidth(84), XScaleHeight(84));
        //昵称
        CGSize nickSize = [self.nickLabel.text sizeWithFont:self.nickLabel.font];
        self.nickLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.iconView.y, nickSize.width, nickSize.height);
        //内容
        CGSize forwardSize  =  [HP_NString sizeOfText:self.forwardLabel.text withFont:self.forwardLabel.font andSize:CGSizeMake(SCREEN_WIDTH-self.iconView.right-XScaleWidth(60), 45) andColor:self.forwardLabel.textColor];
        self.forwardLabel.size = forwardSize;
        self.forwardLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.nickLabel.bottom+XScaleHeight(28), forwardSize.width, forwardSize.height);
        
        _moreButton.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.forwardLabel.bottom+XScaleHeight(15), 30, 15);
        
        //图片
        self.photoView.frame = CGRectMake(self.iconView.right + XScaleWidth(20),_moreButton.bottom+XScaleHeight(30), XScaleWidth(500), XScaleHeight(250));
        
        self.timeLabel.frame = CGRectMake(self.iconView.right + XScaleWidth(20), self.photoView.bottom+XScaleHeight(30), XScaleWidth(100), XScaleHeight(20));
        
        self.shareView.frame = CGRectMake(self.forwardLabel.right-XScaleWidth(38), self.photoView.bottom+XScaleHeight(30),XScaleWidth(38), XScaleHeight(28));
        [_moreButton setTitle:@"全部" forState:UIControlStateNormal];
        self.expand = NO;
    }
    
}
@end

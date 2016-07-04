//
//  STchatCell.h
//  XiaoShenTu
//
//  Created by a on 16/7/3.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STchat.h"

@interface STchatCell : UITableViewCell
@property(nonatomic,strong)STchat *chat;
+(instancetype)stcellWithTableView:(UITableView *)tableView;
@end

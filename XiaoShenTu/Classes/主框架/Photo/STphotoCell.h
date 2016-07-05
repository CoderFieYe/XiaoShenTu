//
//  STphotoCell.h
//  XiaoShenTu
//
//  Created by a on 16/7/4.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPhoto.h"
@interface STphotoCell : UITableViewCell
@property(nonatomic,strong)STPhoto *photo;
+(instancetype)stcellWithTableView:(UITableView *)tableView;
@end

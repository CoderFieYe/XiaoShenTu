//
//  STHCollectionViewCell.h
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STHCollection.h"


@interface STHCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) STHCollection *collection;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) BOOL OpenPersonDetail;

@end

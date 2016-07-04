//
//  STHCollectionView.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STHCollectionView.h"

#import "STHCollectionViewCell.h"
#import "STHCollection.h"

@interface STHCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *ImgNameArrs;

@end
@implementation STHCollectionView

#define kSTHCollectionViewID @"kSTHCollectionViewID"
#define kSTHCollectionViewID2 @"kSTHCollectionViewID2"

-(NSArray *)ImgNameArrs{

    if (!_ImgNameArrs) {
//        _ImgNameArrs = [NSMutableArray array];
    
        _ImgNameArrs = [NSMutableArray arrayWithObjects:@"touxiang",@"touxiang",@"touxiang",@"touxiang",@"touxiang",@"touxiang",@"touxiang",@"touxiang",@"touxiang",@"jiaren",@"jiaren", nil];
    }
    
    return _ImgNameArrs;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
//    self.frame = CGRectMake(0, 440, XScreenW, 68);
    self.backgroundColor = [UIColor orangeColor];
    
    self.dataSource = self;
    self.delegate = self;
    
    [self registerClass:[STHCollectionViewCell class] forCellWithReuseIdentifier:kSTHCollectionViewID];
    
    
    return self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return  1;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.ImgNameArrs.count ;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    STHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSTHCollectionViewID forIndexPath:indexPath];
    
    
    if (!cell) {

            cell = [[STHCollectionViewCell alloc] init];

    }

    cell.image = self.ImgNameArrs[indexPath.item];
   
    
    return cell;

}


#pragma mark -- UIScrollViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"👤cell被点击");
    
    if (indexPath.item == self.ImgNameArrs.count - 2) {
        
        NSLog(@"点击了 添加亲人 cell");
    }else{
        
          [[NSNotificationCenter defaultCenter]postNotificationName:KOpenPersonDetailNoti object:self];
    }
  

}




#pragma mark - 懒加载
//- (NSArray *)ImgsArr{
//
//    if (!_ImgsArrs) {
//        _ImgsArrs = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",nil];
//
//    }
//    
//    return _ImgsArrs;
//}
@end

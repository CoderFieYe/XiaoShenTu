//
//  STGuideController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/27.
//  Copyright © 2016年 万启鹏. All rights reserved.
//
#define KGuideCell @"KGuideCell"


#import "STGuideController.h"
#import "STGuideCell.h"

@interface STGuideController ()<UICollectionViewDataSource,UICollectionViewDelegate>

// 数组 用来存放所有的背景图片 123
@property (nonatomic, strong) NSArray *bgImgsArr;

//篮球足球

@property (nonatomic, weak) UIImageView *bigImgView;

//大文字
@property (nonatomic, weak) UIImageView *largeTextView;

//小文字
@property (nonatomic, weak) UIImageView *smallTextView;


@end

@implementation STGuideController



//标记
static NSString * const reuseIdentifier = @"Cell";


- (instancetype)init{

//   1.创建流水布局
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    
//    1.2 设置 item 的大小
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    
//    1.3 设置滚动方向
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    1.4 调整间距
    flow.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flow];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    1.关闭弹簧效果
    self.collectionView.bounces = NO;
//    2.关闭横条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
//    3.设置分页效果
    self.collectionView.pagingEnabled = YES;
    

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
//    5.添加4个图片框
    [self setupImageViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupImageViews{

//    1.波浪线
    UIImageView *blxView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    
    blxView.x = -200;
    
    [self.collectionView addSubview:blxView];
    
//    2.大图片
    UIImageView *bigView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:bigView];
    
//    3.大文字
    UIImageView *bigTextView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    bigTextView.y = self.collectionView.height *0.7;
    [self.collectionView addSubview:bigTextView];
    
//    4.小文字
    UIImageView *smallTextView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallTextView.y =self.collectionView.height * 0.8;
    [self.collectionView addSubview:smallTextView];
    
//    5.赋值
    
    _bigImgView = bigView;
    _largeTextView = bigTextView;
    _smallTextView = smallTextView;

}
#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
 
    return 1;
}

// 个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.bgImgsArr.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

//    1.创建 cell
    STGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    1.2 如果是最后一个 item,就显示按钮
    if (indexPath.item == self.bgImgsArr.count - 1) {
        cell.experienceBtn.hidden = NO;
        
    }else{
    
        cell.experienceBtn.hidden =YES;
    }
//    1.3 设置数据
    cell.backgroundImage = self.bgImgsArr[indexPath.item];
    
    return cell;
}

#pragma mark - 当减速完成后切换图片

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"减速完成");
    NSLog(@"%@",scrollView);
    
//    1.获取 scrollView 的在x 方向偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
//    1.1 计算索引
    CGFloat index = offsetX / scrollView.width;
    
//     1.2 判断方向
    CGFloat startX = 0;
    
    if (self.bigImgView.x > offsetX) {
        NSLog(@"向右移动");
        startX = offsetX - scrollView.width;
        
    }else{
    
        NSLog(@"向左移动");
        startX = offsetX + scrollView.width;
        
    }
    
    NSLog(@"%@",@(index));
    
//    拼接图片名称
    NSString *bigImgName = [NSString stringWithFormat:@"guide%@",@(index + 1)];
    NSString *largeImgName = [NSString stringWithFormat:@"guideLargeText%@",@(index + 1)];
    NSString *smallImgName = [NSString stringWithFormat:@"guideSmallText%@",@(index + 1)];
    
//    2.需要切换图片
    self.bigImgView.image = [UIImage imageNamed:bigImgName];
    self.largeTextView.image = [UIImage imageNamed:largeImgName];
    self.smallTextView.image = [UIImage imageNamed:smallImgName];
    
//    2.2 多走一个屏幕的宽
    self.bigImgView.x = startX;
    self.largeTextView.x = startX;
    self.smallTextView.x = startX;
    
//    3. 讲图片框挪到屏幕上
    [UIView animateWithDuration:0.5 animations:^{
        self.bigImgView.x = offsetX;
        self.largeTextView.x = offsetX;
        self.smallTextView.x = offsetX;
    }];
    
    


}


#pragma mark -- 懒加载
- (NSArray *)bgImgsArr{

    if (!_bgImgsArr) {
        _bgImgsArr = @[
                       [UIImage imageNamed:@"guide1Background"],
                       [UIImage imageNamed:@"guide2Background"],
                       [UIImage imageNamed:@"guide3Background"],
                       [UIImage imageNamed:@"guide4Background"]
                       ];
    }

    return _bgImgsArr;
    
}

@end

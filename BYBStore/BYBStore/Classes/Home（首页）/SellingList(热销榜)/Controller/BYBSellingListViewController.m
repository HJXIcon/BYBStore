//
//  BYBSellingListViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSellingListViewController.h"
#import "JXPageView.h"
#import "BYBSellingListTagsView.h"
#import "BYBSellingListCategoryController.h"

@interface BYBSellingListViewController ()<JXPageViewDelegate>

@property (nonatomic, weak) UIImageView *arrowImageView;
@property (nonatomic, assign) BOOL isUp;
@property (nonatomic, strong) UIView *tagsView;
@property (nonatomic, weak) JXPageView *pageView;

@property (nonatomic, strong) BYBSellingListTagsView *tagsListView;
@property (nonatomic, assign) NSInteger selectIndex;
@end

@implementation BYBSellingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"热销榜";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
    self.selectIndex = 0;
    
}

- (void)setupUI{
    NSArray *titles = @[@"钟表",@"女包",@"服饰鞋包",@"个护美妆",@"母婴用品",@"食品保健",@"日用百货",@"户外运动",@"钟表首饰",@"家用电器"];
    JXPageStyle *style = [[JXPageStyle alloc]init];
    style.isNeedScale = NO;
    style.isScrollEnable = YES;
    style.isShowBottomLine = YES;
    style.bottomLineColor = BYBThemeColor;
    style.normalColor = [UIColor blackColor];
    style.selectColor = BYBThemeColor;
    style.titleFont = [UIFont boldSystemFontOfSize:17];
    style.titleHeight = 50;
    style.isShowRightView = YES;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 44)];
    UIImageView *arrowImageView = [JXFactoryTool creatImageView:CGRectMake(0, 0, 25, 25) image:[UIImage imageNamed:@"arrow_25x25_"]];
    arrowImageView.center = view.center;
    view.backgroundColor = [UIColor whiteColor];
    _arrowImageView = arrowImageView;
    [view addSubview:arrowImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(arrowTapAction:)];
    [view addGestureRecognizer:tap];
    style.rightView = view;
    
    NSMutableArray *childVcs = [NSMutableArray array];
    
    NSArray *types = @[@(BYBSellingListZhongBiao),
                       @(BYBSellingListNvBao),
                       @(BYBSellingListFuShiXieBao),
                       @(BYBSellingListGeHuMeiZhuang),
                       @(BYBSellingListMuYingYongPin),
                       @(BYBSellingListShiPinBaoJian),
                       @(BYBSellingListRiYongBaiHuo),
                       @(BYBSellingListYunDongHuWai),
                       @(BYBSellingListZhongBiaoShouShi),
                       @(BYBSellingListJiaYongDianQi)];
    for (int i = 0; i < titles.count; i++){
        BYBSellingListCategoryController *vc = [[BYBSellingListCategoryController alloc]init];
        vc.type = [types[i] intValue];
        [childVcs addObject:vc];
    }
    
    CGRect pageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    
    JXPageView *pageView = [[JXPageView alloc]initWithFrame:pageViewFrame titles:titles style:style childVcs:childVcs parentVc:self];
    pageView.delegate = self;
    _pageView = pageView;
    [self.view addSubview:pageView];

    
    // tagLabel
    self.tagsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW - CGRectGetWidth(view.frame), style.titleHeight)];
    self.tagsView.backgroundColor = [UIColor whiteColor];
    [pageView addSubview:self.tagsView];
    UILabel *tagLabel = [JXFactoryTool creatLabel:CGRectMake(20, 0, CGRectGetWidth(self.tagsView.frame) - 20, CGRectGetHeight(self.tagsView.frame)) font:[UIFont systemFontOfSize:18 weight:.3] textColor:BYBTEXTColor2 text:@"全部10个标签" textAlignment:0];
    [self.tagsView addSubview:tagLabel];
    self.tagsView.hidden = YES;
    
    // tagsListView
    _tagsListView = [[BYBSellingListTagsView alloc]initWithFrame:CGRectMake(0, -kScreenH, kScreenW, kScreenH)];
    JXWeakSelf;
    _tagsListView.tagsArray = titles;
    _tagsListView.removeBlock = ^{
        [UIView animateWithDuration:.2f animations:^{
            [weakSelf hiddenTagsView];
        }];
    };
    
    _tagsListView.selectBlock = ^(NSInteger index) {
        [weakSelf hiddenTagsView];
        [weakSelf.pageView titleLabelClick:index];
    };
    
    [self.view addSubview:_tagsListView];
    
    
    
}



- (void)dealloc{
    [[NSNotificationCenter defaultCenter]postNotificationName:CXBPopNotiName object:nil];
}

#pragma mark - arrowTapAction
- (void)arrowTapAction:(UIGestureRecognizer *)ges{
    
    if (self.isUp) {
        [UIView animateWithDuration:.2f animations:^{
            _arrowImageView.transform = CGAffineTransformIdentity;
            self.tagsView.hidden = YES;
            _tagsListView.frame = CGRectMake(0, -kScreenH, kScreenW, kScreenH);
        }];
    }else{
        [UIView animateWithDuration:.2f animations:^{
            _tagsListView.selectIndex = self.selectIndex;
            _arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
            self.tagsView.hidden = NO;
            _tagsListView.frame = CGRectMake(0, CGRectGetMaxY(self.tagsView.frame), kScreenW, kScreenH);
        }];
    }
    
    self.isUp = !self.isUp;
    
    
}


/// 隐藏
- (void)hiddenTagsView{
    [UIView animateWithDuration:.25 animations:^{
        self.arrowImageView.transform = CGAffineTransformIdentity;
        self.tagsView.hidden = YES;
        self.tagsListView.frame = CGRectMake(0, -kScreenH, kScreenW, kScreenH);
        self.isUp = NO;
    }];
}


#pragma mark - JXPageViewDelegate
- (void)pageViewDidEndScroll:(JXPageView *)pageView indx:(NSInteger)indx{
    self.selectIndex = indx;
}

@end

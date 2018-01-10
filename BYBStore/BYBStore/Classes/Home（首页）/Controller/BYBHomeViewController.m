//
//  BYBHomeViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeViewController.h"
#import "BYBSearchBarView.h"
#import "JXPageView.h"
#import "BYBHomeSpecialTopicViewController.h"
#import "BYBHomeOtherSpecialController.h"
#import "BYBHomeSellingListController.h"
#import "BYBSellingListViewController.h"
#import <JXQRScanViewController.h>


@interface BYBHomeViewController ()<JXPageViewDelegate>
@property (nonatomic, weak)BYBSearchBarView *barView;
@end

@implementation BYBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupAllChilderVc];
    
}

// 其实底部角圆角的距离是34,我们可以在任意界面打印安全试图就可以找到,在viewSafeAreaInsetsDidChange方法里面打印
/***！
 注意：
 1.介绍viewSafeAreaInsetsDidChange方法系统调用或者你设置控制器的additionalSafeAreaInsets安全区域边界
 2.顺序viewSafeAreaInsetsDidChange调用顺序实在viewWillAppear之后，在viewWillLayoutSubvies之前调用
 重点 ：设置你底部的按钮按钮底部距离底部34即可，但是不要让上面的试图的高度盖住底部按钮
 
 */
- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
    
}



- (void)setupAllChilderVc{
    
    
    self.automaticallyAdjustsScrollViewInsets = false;
    
    NSArray *titles = @[@"专题",@"服饰",@"美妆",@"母婴",@"轻奢",@"百货",@"美食",@"运动",@"日淘",@"美淘",@"畅销榜"];
    JXPageStyle *style = [[JXPageStyle alloc]init];
    style.isNeedScale = NO;
    style.isScrollEnable = YES;
    style.isShowBottomLine = YES;
    style.bottomLineColor = BYBThemeColor;
    style.normalColor = [UIColor blackColor];
    style.selectColor = BYBThemeColor;
    style.titleFont = [UIFont boldSystemFontOfSize:17];
    style.titleHeight = 50;
    
    NSMutableArray *childVcs = [NSMutableArray array];
    
    for (int i = 0; i < titles.count; i++){
        UIViewController *vc;
        if (i == 0 ) {
            vc = [[BYBHomeSpecialTopicViewController alloc]init];
        }else if (i == titles.count - 1) {
            vc = [[BYBHomeSellingListController alloc]init];
            
        }else{
             BYBHomeOtherSpecialController *specialVc = [[BYBHomeOtherSpecialController alloc]init];
            switch (i) {
                    
                case 1:
                    specialVc.special = BYBHomeSpecialFuShi;
                    break;
                    
                case 2:
                    specialVc.special = BYBHomeSpecialMeiZhuang;
                    break;
                    
                case 3:
                    specialVc.special = BYBHomeSpecialMuYing;
                    break;
                    
                case 4:
                    specialVc.special = BYBHomeSpecialQingShe;
                    break;
                    
                case 5:
                    specialVc.special = BYBHomeSpecialBaiHuo;
                    break;
                    
                case 6:
                    specialVc.special = BYBHomeSpecialMeiShi;
                    break;
                    
                case 7:
                    specialVc.special = BYBHomeSpecialYunDong;
                    break;
                    
                    
                case 8:
                    specialVc.special = BYBHomeSpecialRiTao;
                    break;
                    
                case 9:
                    specialVc.special = BYBHomeSpecialMeiTao;
                    break;
                    
                    
                default:
                    break;
            }
            
            vc = specialVc;
        }


        
        [childVcs addObject:vc];
    }
    
    CGRect pageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    
    JXPageView *pageView = [[JXPageView alloc]initWithFrame:pageViewFrame titles:titles style:style childVcs:childVcs parentVc:self];
    pageView.delegate = self;
    [self.view addSubview:pageView];
    
    __weak typeof (pageView) weakPage = pageView;
    [[NSNotificationCenter defaultCenter]addObserverForName:CXBPopNotiName object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [weakPage titleLabelClick:titles.count - 2];
        
    }];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:CXBPopNotiName object:nil];
    
    [_barView cancel];
}

- (void)setupNav{
    BYBSearchBarView *barView = [[BYBSearchBarView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 35)];
    _barView = barView;
    
    MJWeakSelf;
    barView.msgBlock = ^{
    
        [weakSelf.navigationController pushViewController:[[JXQRScanViewController alloc]init] animated:YES];
    };
    
    barView.searchBlock = ^{
        [BYBControllerManger showSearchController];
    };
    
    barView.cacelSearchBlock = ^{
        [BYBControllerManger dismissSearchController];
    };
    
    self.navigationItem.titleView = barView;
}



#pragma mark - JXPageViewDelegate
- (void)pageViewDidEndScroll:(JXPageView *)pageView indx:(NSInteger)indx{
    
    if (indx == 10) {
        
        [self.navigationController pushViewController:[[BYBSellingListViewController alloc]init] animated:YES];
    }
}

@end

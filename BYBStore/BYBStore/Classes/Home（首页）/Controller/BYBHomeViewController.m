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

@interface BYBHomeViewController ()


@end

@implementation BYBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    
    [self setupAllChilderVc];
}

- (void)setupAllChilderVc{
    
    
    self.automaticallyAdjustsScrollViewInsets = false;
    
    NSArray *titles = @[@"专题",@"服饰",@"美妆",@"母婴",@"轻奢",@"百货",@"美食",@"运动",@"日淘",@"畅销榜"];
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
        }else{
             vc= [[UITableViewController alloc]init];
        }

        vc.view.backgroundColor = [UIColor randomColor];
        
        [childVcs addObject:vc];
    }
    
    CGRect pageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    
    JXPageView *pageView = [[JXPageView alloc]initWithFrame:pageViewFrame titles:titles style:style childVcs:childVcs parentVc:self];
    
    [self.view addSubview:pageView];
    
}

- (void)setupNav{
    BYBSearchBarView *barView = [[BYBSearchBarView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 35)];
    MJWeakSelf;
    barView.msgBlock = ^{
        weakSelf;
        JXLog(@"msgAction --- ");
    };
    self.navigationItem.titleView = barView;
}



@end

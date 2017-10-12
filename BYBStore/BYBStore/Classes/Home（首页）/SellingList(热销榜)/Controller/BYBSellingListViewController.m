//
//  BYBSellingListViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSellingListViewController.h"
#import "JXPageView.h"

@interface BYBSellingListViewController ()

@end

@implementation BYBSellingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"热销榜";
    
    NSArray *titles = @[@"专题",@"服饰",@"美妆",@"母婴",@"轻奢",@"百货",@"美食",@"运动",@"日淘",@"美淘",@"             "];
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
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        [childVcs addObject:vc];
    }
    
    CGRect pageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    
    JXPageView *pageView = [[JXPageView alloc]initWithFrame:pageViewFrame titles:titles style:style childVcs:childVcs parentVc:self];

    [self.view addSubview:pageView];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]postNotificationName:CXBPopNotiName object:nil];
}

@end

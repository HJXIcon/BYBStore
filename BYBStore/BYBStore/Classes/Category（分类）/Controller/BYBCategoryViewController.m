//
//  BYBCategoryViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategoryViewController.h"
#import "BYBSearchBarView.h"

@interface BYBCategoryViewController ()

@end

@implementation BYBCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
}

- (void)setupNav{
    BYBSearchBarView *barView = [[BYBSearchBarView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 35)];
    barView.style = BYBSearchBarViewStyleCategory;
    self.navigationItem.titleView = barView;
}
@end

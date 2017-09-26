//
//  BYBBaseTableViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseTableViewController.h"

@interface BYBBaseTableViewController ()

@end

@implementation BYBBaseTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.frame = self.view.bounds;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    BYBNoDataView *noDataView = [BYBNoDataView viewForXib];
    noDataView.frame = self.view.bounds;
    [noDataView setImageName:@"bg_no_shaidan_100x100_" desText:@"从前有座山，山上没信号···" refreshBtnTitle:@"点击刷新" refreshBlock:^{
        
    }];
    self.tableView.placeHolderView = noDataView;
    
    
    [self setupRefresh];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.isRefresh) {
        [self.tableView.mj_header beginRefreshing];
    }
    
}


- (void)setupRefresh{
    [self setupHeader];
    [self setupFooter];
}

#pragma mark - 上下刷新
- (void)setupFooter{
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    BYBRefreshFooter *footer = [BYBRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadFooterData)];
    
    // 当上拉刷新控件出现50%时（出现一半），就会自动刷新。这个值默认是1.0（也就是上拉刷新100%出现时，才会自动刷新）
    footer.triggerAutomaticallyRefreshPercent = 0.5;
    
    // 隐藏刷新状态的文字
    footer.refreshingTitleHidden = YES;
    
    // 设置footer
    self.tableView.mj_footer = footer;
    
}
- (void)setupHeader{
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    BYBRefreshHeader *header = [BYBRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadHeaderData)];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 马上进入刷新状态
    //    [header beginRefreshing];
    
    // 设置header
    self.tableView.mj_header = header;
}


- (void)endRefreshing{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

- (void)loadFooterData{
    
}
- (void)loadHeaderData{
    
}

@end

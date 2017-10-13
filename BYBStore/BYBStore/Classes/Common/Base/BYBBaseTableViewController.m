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

- (UITableView *)tableView{
    if (_tableView == nil) {
        
        
        CGFloat H = self.navigationController.navigationBar ?  kScreenH - 64 : kScreenH;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
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

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *const cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"section == %ld,row == %ld",indexPath.section,indexPath.row];
    
    return cell;
    
    
}


@end

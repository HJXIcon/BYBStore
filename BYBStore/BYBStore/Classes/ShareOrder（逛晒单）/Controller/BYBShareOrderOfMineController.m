//
//  BYBShareOrderOfMineController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBShareOrderOfMineController.h"
#import "BYBShareOrderOfMineHeaderView.h"

@interface BYBShareOrderOfMineController ()

@end

@implementation BYBShareOrderOfMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableHeaderView];
    
    self.isRefresh = YES;
    
    BYBNoDataView *noDataView = [BYBNoDataView viewForXib];
    noDataView.frame = CGRectMake(0, 160, kScreenW, kScreenH - 50);
    noDataView.backgroundColor = [UIColor colorWithHexString:@"0xf0eff5"];
    noDataView.refreshBtn.hidden = YES;
    [noDataView setImageName:@"tips_no_shaidan_100x100_" desText:@"还木有晒单哦，\n是谁阻止了您的秀晒炫!" refreshBtnTitle:@"" refreshBlock:^{
        [BYBControllerManger presentLoginController];
    }];
    
    self.tableView.placeHolderView = noDataView;
    
//    [self showNotLoginView];
//    [BYBLoadingView showInView:self.view];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

#pragma mark - Private Method
- (void)setupTableHeaderView{
    BYBShareOrderOfMineHeaderView *headerView = [BYBShareOrderOfMineHeaderView viewForXib];
    headerView.frame = CGRectMake(0, 0, kScreenW, 150);
    self.tableView.tableHeaderView = headerView;
}

- (void)showNotLoginView{
    BYBNoDataView *noDataView = [BYBNoDataView viewForXib];
    noDataView.frame = self.view.bounds;
    [noDataView setImageName:@"gouwucheweikong_75x75_" desText:@"购物车还是空的\n快去挑几件喜欢的宝贝吧" refreshBtnTitle:@"去逛逛" refreshBlock:^{
        [BYBControllerManger presentLoginController];
    }];
    
    [self.view addSubview:noDataView];
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

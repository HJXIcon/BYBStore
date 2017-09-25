//
//  BYBShopCarViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBShopCarViewController.h"
#import "BYBTabBarController.h"

@interface BYBShopCarViewController ()

@end

@implementation BYBShopCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYBNoDataView *noDataView = [BYBNoDataView viewForXib];
    noDataView.frame = self.view.bounds;
    [noDataView setImageName:@"gouwucheweikong_75x75_" desText:@"购物车还是空的\n快去挑几件喜欢的宝贝吧" refreshBtnTitle:@"去逛逛" refreshBlock:^{
        BYBTabBarController *tabBarVc = (BYBTabBarController *) [UIApplication sharedApplication].keyWindow.rootViewController;
        tabBarVc.selectedIndex = 0;
    }];
    self.tableView.placeHolderView = noDataView;
    
    
}

#pragma mark - Private Method
- (void)showNotLoginView{
    BYBNoDataView *noDataView = [BYBNoDataView viewForXib];
    noDataView.frame = self.view.bounds;
    [noDataView setImageName:@"gouwucheweikong_75x75_" desText:@"亲，你还没登陆哦\n登陆了才可以查看购物车" refreshBtnTitle:@"去登陆" refreshBlock:^{
        
        [BYBControllerManger presentLoginController];
    }];
    [self.view addSubview:noDataView];
}

- (void)loadHeaderData{
    JXWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [weakSelf endRefreshing];
        [weakSelf.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
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

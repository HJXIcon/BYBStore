//
//  BYBSellingListCategoryController.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSellingListCategoryController.h"
#import "BYBSellingListModel.h"
#import "BYBSellingListCell.h"
#import "BYBGoodDetailViewController.h"

@interface BYBSellingListCategoryController ()
@property (nonatomic, strong) NSMutableArray <BYBSellingListModel *> *dataArray;
@end

@implementation BYBSellingListCategoryController

#pragma mark - lazy load
- (NSMutableArray<BYBSellingListModel *> *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    self.tableView.rowHeight = 150;
    
}

- (void)loadHeaderData{
    [self.dataArray removeAllObjects];
    [self loadData];
}

- (void)loadFooterData{
    [self.tableView.mj_footer endRefreshing];
    self.tableView.mj_footer.state = MJRefreshStateNoMoreData;
}

- (void)loadData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"热销榜_%@",[self getChinesStrCatUrl]] ofType:nil];
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        [self.dataArray addObjectsFromArray:[BYBSellingListModel mj_objectArrayWithKeyValuesArray:dict[@"result"][@"infolist"]]];
        [self.tableView reloadData];
        [self endRefreshing];
    });
    
    
}

- (NSString *)getChinesStrCatUrl{
    NSString *strCatUrl;
    switch (self.type) {
        case BYBSellingListZhongBiao:
            strCatUrl = @"钟表";
            break;
            
        case BYBSellingListNvBao:
            strCatUrl = @"女包";
            break;
            
        case BYBSellingListFuShiXieBao:
            strCatUrl = @"服饰鞋包";
            break;
            
        case BYBSellingListGeHuMeiZhuang:
            strCatUrl = @"个护美妆";
            break;
            
        case BYBSellingListMuYingYongPin:
            strCatUrl = @"母婴用品";
            break;
            
        case BYBSellingListShiPinBaoJian:
            strCatUrl = @"食品保健";
            break;
            
        case BYBSellingListRiYongBaiHuo:
            strCatUrl = @"日用百货";
            break;
            
            
        case BYBSellingListYunDongHuWai:
            strCatUrl = @"运动户外";
            break;
            
        case BYBSellingListZhongBiaoShouShi:
            strCatUrl = @"钟表首饰";
            break;
            
        case BYBSellingListJiaYongDianQi:
            strCatUrl = @"家用电器";
            break;
            
        default:
            break;
    }
    return strCatUrl;
}


- (NSString *)getStrCatUrl{
    NSString *strCatUrl;
    switch (self.type) {
        case BYBSellingListZhongBiao:
            strCatUrl = @"zhongbiao";
            break;
            
        case BYBSellingListNvBao:
            strCatUrl = @"nvbao";
            break;
            
        case BYBSellingListFuShiXieBao:
            strCatUrl = @"fushixiebao";
            break;
            
        case BYBSellingListGeHuMeiZhuang:
            strCatUrl = @"gehumeizhuang";
            break;
            
        case BYBSellingListMuYingYongPin:
            strCatUrl = @"muyingyongpin";
            break;
            
        case BYBSellingListShiPinBaoJian:
            strCatUrl = @"shipinbaojian";
            break;
            
        case BYBSellingListRiYongBaiHuo:
            strCatUrl = @"riyongbaihuo";
            break;
            
            
        case BYBSellingListYunDongHuWai:
            strCatUrl = @"yundonghuwai";
            break;
            
        case BYBSellingListZhongBiaoShouShi:
            strCatUrl = @"zhongbiaoshoushi";
            break;
            
        case BYBSellingListJiaYongDianQi:
            strCatUrl = @"jiayongdianqi";
            break;
            
        default:
            break;
    }
    return strCatUrl;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BYBSellingListCell *cell = [BYBSellingListCell cellForTableView:tableView];
    
    cell.model = self.dataArray[indexPath.row];
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BYBSellingListModel *model = self.dataArray[indexPath.row];
    BYBGoodDetailViewController *vc = [[BYBGoodDetailViewController alloc]init];
    vc.iInfoID = model.infoid;
    [self.navigationController pushViewController:vc animated:YES];
}

@end

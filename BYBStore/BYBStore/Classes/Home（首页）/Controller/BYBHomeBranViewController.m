//
//  BYBHomeBranViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBranViewController.h"
#import "BYBHomeSpecialTopicModel.h"
#import "BYBHomeBrandCell.h"

@interface BYBHomeBranViewController ()
/** data*/
@property (nonatomic, strong) NSMutableArray *dataArray;
/** 当前页数 */
@property (nonatomic, assign) int page;
/** 记录最后一次offset */
@property (nonatomic, assign) CGFloat lastOffsetY;
/** 判断是否在加载数据，加载数据的时候不更新约束 */
@property (nonatomic, assign) BOOL isLoadData;
@end

@implementation BYBHomeBranViewController
#pragma mark - lazy load
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 150 * BYBSCREEN_SCALE;
    
    self.tableView.rowHeight = 400;
}



#pragma mark - Load Data
- (void)loadHeaderData{
    self.page = 1;
    [self loadData];
}

- (void)loadFooterData{
    self.page ++;
    [self loadData];
}



- (void)loadData{
    
    _isLoadData = YES;
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/BrandExclusiveListQueryWithInfo?p_iPageIndex=%d&p_iPageSize=10",self.page];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        _isLoadData = NO;
        self.isRefresh = YES;
//        [self.dataArray addObjectsFromArray:[BYBHomeSpecialTopicModel mj_objectArrayWithKeyValuesArray:responseObject]];
        
        
        [self.tableView reloadData];
        [self endRefreshing];
        
    } failure:^(NSError *error) {
        [self showHint:@"请求失败"];
    }];
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BYBHomeBrandCell *cell = [BYBHomeBrandCell cellForTableView:tableView];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView == self.tableView  && !_isLoadData && self.isRefresh) {
        self.lastOffsetY = scrollView.contentOffset.y;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView  && !_isLoadData && self.isRefresh ) {
        CGFloat offsetY = scrollView.contentOffset.y;
        
        if (offsetY - self.lastOffsetY > 0 && fabs(offsetY - self.lastOffsetY) > 40) {
            
            if (self.scrollBlock) {
                self.scrollBlock(YES);
            }
            
        }else if(offsetY - self.lastOffsetY < 0 && fabs(offsetY - self.lastOffsetY) > 40){
            
            if (self.scrollBlock) {
                self.scrollBlock(NO);
            }
        }
    }
}



@end

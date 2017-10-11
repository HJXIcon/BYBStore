//
//  BYBHomeSpecialTopicViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/26.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeSpecialTopicViewController.h"
#import "BYBHomeSpecialTopicCell.h"
#import "BYBHomeSpecialTopicHeaderView.h"
#import "BYBHomeSpecialTopicModel.h"
#import "BYBHomeBranViewController.h"
#import "BYBHomeHotDetailViewController.h"

@interface BYBHomeSpecialTopicViewController ()
@property(nonatomic, strong) BYBHomeSpecialTopicHeaderView *header;
/** data*/
@property (nonatomic, strong) NSMutableArray *dataArray;
/** 当前页数 */
@property (nonatomic, assign) int page;
/** 记录最后一次offset */
@property (nonatomic, assign) CGFloat lastOffsetY;
/** 判断是否在加载数据，加载数据的时候不更新约束 */
@property (nonatomic, assign) BOOL isLoadData;
@property (nonatomic, strong) BYBHomeBranViewController *branViewController;
@end

@implementation BYBHomeSpecialTopicViewController
#pragma mark - lazy load
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.tableView.rowHeight = 150 * BYBSCREEN_SCALE;
    
}


#pragma mark - Private Method
- (void)setupUI{
    
    MJWeakSelf;
    self.header = [BYBHomeSpecialTopicHeaderView headderView:^(NSInteger index) {
        
        weakSelf.branViewController.view.hidden = index == 0;
        weakSelf.tableView.hidden = index == 1;
        JXLog(@"%ld-----",index);
    }];
    self.header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.header];
    // 就是把子视图移动到顶部的意思，
    [self.view bringSubviewToFront:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(80);
    }];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.header.mas_bottom);
    }];
    
    self.branViewController = [[BYBHomeBranViewController alloc]init];
    self.branViewController.scrollBlock = ^(BOOL isHidden) {
        [weakSelf updateSubViewConstraints:isHidden completion:nil];
    };
    [self addChildViewController:self.branViewController];
    [self.view addSubview:self.branViewController.view];
    self.branViewController.view.hidden = YES;
    [self.branViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.header.mas_bottom);
    }];
    
}

/// 更新子控件约束
- (void)updateSubViewConstraints:(BOOL)hiddenHeaderView completion:(void(^)())completion{
    
    CGFloat margin = hiddenHeaderView == YES ? -80 : 0;
    
    [self.header mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(margin);
    }];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
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
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/SpecialListQuery?p_btSpecialType=2&p_iPageIndex=%d&p_iPageSize=10&p_iParentSpecialID=0",self.page];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        _isLoadData = NO;
        self.isRefresh = YES;
        [self.dataArray addObjectsFromArray:[BYBHomeSpecialTopicModel mj_objectArrayWithKeyValuesArray:responseObject]];
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
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BYBHomeSpecialTopicCell *cell = [BYBHomeSpecialTopicCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
    
}

#pragma mark - 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BYBHomeSpecialTopicModel *model = self.dataArray[indexPath.row];
    BYBHomeHotDetailViewController *vc = [[BYBHomeHotDetailViewController alloc]init];
    vc.p_iSpecialID = model.iSpecialID;
    vc.title = model.strSpecialName;
    [self.navigationController pushViewController:vc animated:YES];
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
            [self updateSubViewConstraints:YES completion:^{
                self.lastOffsetY = offsetY;
            }];
            
        }else if(offsetY - self.lastOffsetY < 0 && fabs(offsetY - self.lastOffsetY) > 40){
            [self updateSubViewConstraints:NO completion:^{
                self.lastOffsetY = offsetY;
            }];
        }
    }
}



@end

//
//  BYBGoodDetailViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailViewController.h"
#import "BYBGoodDetailModel.h"
#import "BYBGoodDetailsCell1.h"
#import "BYBGoodDetailsCell2.h"
#import "BYBGoodDetailsCell3.h"
#import "BYBGoodDetailsCell4.h"
#import "BYBGoodDetailsCell5.h"
#import "BYBGoodDetailsReviewHeaderFooterCell.h"
#import "BYBGoodDetailsMayLikeCell.h"
#import "BYBGoodDetailMayLikeModel.h"
#import "BYBGoodDetailMayLikeViewModel.h"
#import "BYBGoodDetailBottomView.h"
#import "JXPopoverView.h"
#import "BYBTabBarController.h"

@interface BYBGoodDetailViewController ()
/** goodDetailModel*/
@property (nonatomic, strong) BYBGoodDetailModel *goodDetailModel;
/** cell4高度 */
@property (nonatomic, assign) CGFloat cell4Height;
@property (nonatomic, strong) NSMutableArray <BYBGoodDetailMayLikeModel*>*mayLikeData;
/** mayLike */
@property (nonatomic, assign) int mayLikePage;
@property (nonatomic, assign) int mayLikeMaxPage;
/** vm*/
@property (nonatomic, strong) BYBGoodDetailMayLikeViewModel *viewModel;
/** bottomView*/
@property (nonatomic, strong) BYBGoodDetailBottomView *bottomView;
@end

@implementation BYBGoodDetailViewController
#pragma mark - lazy load
- (BYBGoodDetailBottomView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[BYBGoodDetailBottomView alloc]initWithFrame:CGRectMake(0, kScreenH - 60, kScreenW, 60)];
    }
    return _bottomView;
}
- (BYBGoodDetailMayLikeViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[BYBGoodDetailMayLikeViewModel alloc]init];
    }
    return _viewModel;
}
- (NSMutableArray<BYBGoodDetailMayLikeModel *> *)mayLikeData{
    if (_mayLikeData == nil) {
        _mayLikeData = [NSMutableArray array];
    }
    return _mayLikeData;
}

#pragma mark - life cylce
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商品详情";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem item:[UIImage imageNamed:@"更多_19x19_"] highImage:[UIImage imageNamed:@"更多_19x19_"] target:self action:@selector(moreAction)];
    
    [self loadData];
    self.tableView.backgroundColor = BYBBGColor;
    
    [self.tableView registerClass:[BYBGoodDetailsCell4 class] forCellReuseIdentifier:NSStringFromClass([BYBGoodDetailsCell4 class])];
    
    [self.tableView registerClass:[BYBGoodDetailsCell5 class] forCellReuseIdentifier:NSStringFromClass([BYBGoodDetailsCell5 class])];
    
    // 注册加载完成高度的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:UpdateGoodDetailCell4Height object:nil];
    
    [self setupFooter];
    
    self.mayLikePage = 1;
    [self loadMayLikeData];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.bottomView];
}

- (void)viewWillDisappear:(BOOL)animated{
    self.bottomView.hidden = YES;
    [self.bottomView removeFromSuperview];
    [super viewWillDisappear:animated];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UpdateGoodDetailCell4Height object:nil];
}

- (void)noti:(NSNotification *)sender
{
    
    NSNumber *num = [sender object];
    self.cell4Height = [num floatValue];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:3]] withRowAnimation:UITableViewRowAnimationNone];
    
}

#pragma mark - private Method
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

#pragma mark - Actions
- (void)moreAction{
    
    JXWeakSelf;
    JXPopoverView *popView = [JXPopoverView popoverView];
    JXPopoverAction *action1 = [JXPopoverAction actionWithImage:[UIImage imageNamed:@"fenxiang_detail_20x20_"] title:@"分享" handler:^(JXPopoverAction *action) {
        
    }];
    
    JXPopoverAction *action2 = [JXPopoverAction actionWithImage:[UIImage imageNamed:@"shouye_detail_20x20_"] title:@"首页" handler:^(JXPopoverAction *action) {
        BYBTabBarController *tabBarVc = (BYBTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
            [tabBarVc setSelectedIndex:0];
        });
    }];
    
    JXPopoverAction *action3 = [JXPopoverAction actionWithImage:[UIImage imageNamed:@"zixun_detail_20x20_"] title:@"咨询" handler:^(JXPopoverAction *action) {
        
    }];
    
    JXPopoverAction *action4 = [JXPopoverAction actionWithImage:[UIImage imageNamed:@"bangzhu_detail_20x20_"] title:@"帮助" handler:^(JXPopoverAction *action) {
        
    }];
    [popView showToPoint:CGPointMake(kScreenW - 60,  64) withActions:@[action1,action2,action3,action4]];
}

- (void)loadFooterData{
    self.mayLikePage ++;
    if (self.mayLikePage > self.mayLikeMaxPage) {
        [self showHint:@"没有更多数据了呦~"];
        return;
    }
    [self loadMayLikeData];
}


#pragma mark - load Data
- (void)loadMayLikeData{
   
    
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/MayLikeCatInfoListByProductId?infoID=%@&pageIndex=%d",self.iInfoID,self.mayLikePage];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
       
        if ([responseObject[@"code"] intValue] != 200) {
            self.mayLikePage --;
            return;
        }
        
        [self.mayLikeData addObjectsFromArray:[BYBGoodDetailMayLikeModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]]];
        self.mayLikeMaxPage = [responseObject[@"maxPage"] intValue];
        self.viewModel.mayLikeData = self.mayLikeData;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:7] withRowAnimation:UITableViewRowAnimationNone];
        
        
    } failure:^(NSError *error) {
        self.mayLikePage --;
    }];
}

- (void)loadData{
    
    [BYBLoadingView showInView:self.view];
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/GetNewInfoDetial?iInfoID=%@&userId=19024376",self.iInfoID];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        [BYBLoadingView dismissInView:self.view];
        self.goodDetailModel = [BYBGoodDetailModel mj_objectWithKeyValues:responseObject];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        [BYBLoadingView dismissInView:self.view];
        [self showHint:@"请求失败"];
    }];
    
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 5) {
        return self.goodDetailModel.GetInfoReview.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        {
            BYBGoodDetailsCell1 *cell = [BYBGoodDetailsCell1 cellForTableView:tableView];
            cell.model = self.goodDetailModel.GetInfoData;
            return cell;
        }
            break;
            
        case 1:
        {
            BYBGoodDetailsCell2 *cell = [BYBGoodDetailsCell2 cellForTableView:tableView];
            [cell.countryImageView sd_setImageWithURL:[NSURL URLWithString:self.goodDetailModel.GetInfoData.countrySmallIcon] placeholderImage:BYB_PlaceholderImage];
            cell.branLabel.text = self.goodDetailModel.GetInfoData.result.mall[@"strMallName"];
            return cell;
        }
            break;
            
        case 2:
        {
            BYBGoodDetailsCell3 *cell = [BYBGoodDetailsCell3 cellForTableView:tableView];
            cell.model = self.goodDetailModel.GetInfoBrandData;
            return cell;
        }
            break;
            
        case 3:
        {
            BYBGoodDetailsCell4 *cell = [BYBGoodDetailsCell4 cellForTableView:tableView];
            cell.strInfoContent = self.goodDetailModel.GetInfoData.result.strInfoContent;
           
            return cell;
        }
            break;
            
            
        case 4: // 评论头部
        {
            BYBGoodDetailsReviewHeaderCell *headCell = [BYBGoodDetailsReviewHeaderCell cellForTableView:tableView];
            return headCell;
            
        }
            break;
            
        case 5:{
            
            BYBGoodDetailsCell5 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BYBGoodDetailsCell5 class])];
            
            cell.model = self.goodDetailModel.GetInfoReview[indexPath.row];
            return cell;
        }
            break;
            
        case 6:{ // 评论尾部
            BYBGoodDetailsReviewFooterCell *footerCell = [BYBGoodDetailsReviewFooterCell cellForTableView:tableView];
            footerCell.reviewNum = [self.goodDetailModel.GetOrdersCommodityReviewCountByInfoID integerValue];
            footerCell.reviewCount = [self.goodDetailModel.rowscount integerValue];
            
            return footerCell;
        }
            break;
            
            
        case 7:{
            BYBGoodDetailsMayLikeCell *cell = [BYBGoodDetailsMayLikeCell cellForTableView:tableView];
            
            cell.vm = self.viewModel;
            return cell;
        }
            break;
            
        default:
            break;
    }
    
    static NSString *const cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"section == %ld,row == %ld",indexPath.section,indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return  520;
            break;
            
        case 1:
            return  120;
            break;
            
        case 2:
            return  self.goodDetailModel.GetInfoBrandData.cellHeight;
            break;
            
        case 3:
        {
            if (self.cell4Height == 0) {
                
                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([BYBGoodDetailsCell4 class]) configuration:^(id cell) {
                    
                }];
            }else{
                return self.cell4Height;
            }
    
            
            
        }
            
            break;
            
        case 4:
        {
            return 44;
        }
            break;
            
        case 5:{
            JXWeakSelf;
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([BYBGoodDetailsCell5 class]) cacheByIndexPath:indexPath configuration:^(BYBGoodDetailsCell5 *cell) {
                
                cell.model = weakSelf.goodDetailModel.GetInfoReview[indexPath.row];
                
            }];
        }
            break;
            
        case 6:{
            return 70;
        }
            break;
            
        case 7:{
            return [self.viewModel cellHeight];
        }
            break;
            
        default:
            return  44;
            break;
    }
    
}

#pragma mark - footer/header
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 7 || section == 4 || section == 5) {
        return 0.00001;
    }
    return  10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}

@end

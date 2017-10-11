//
//  BYBHomeHotDetailViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeHotDetailViewController.h"
#import "BYBHomeBranDetailTopCell.h"
#import "BYBHomeBranDetailRecommendCell.h"
#import "BYBHomeHotDetailModel.h"
#import "BYBGoodDetailViewController.h"
#import "BYBHomeBrandModel.h"
@interface BYBHomeHotDetailViewController ()
/** data*/
@property (nonatomic, strong) BYBHomeHotDetailModel *detailModel;
/** 当前页数 */
@property (nonatomic, assign) int page;

/** listRecommendInfo*/
@property (nonatomic, strong) NSMutableArray *listRecommendInfoArray;
@end

@implementation BYBHomeHotDetailViewController

#pragma mark - lazy load
- (NSMutableArray *)listRecommendInfoArray{
    if (_listRecommendInfoArray == nil) {
        _listRecommendInfoArray = [NSMutableArray array];
    }
    return _listRecommendInfoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem item:[UIImage imageNamed:@"newfenxiang_20x20_"] selImage:[UIImage imageNamed:@"newfenxiang_20x20_"] target:self action:@selector(shareAction)];
    
    self.collectionView.backgroundColor = BYBBGColor;
    [self.collectionView registerClass:[BYBHomeBranDetailTopCell class] forCellWithReuseIdentifier:@"topCell"];
    
    [self.collectionView registerClass:[BYBHomeBranDetailRecommendCell class] forCellWithReuseIdentifier:@"recommendCell"];
}

- (void)loadHeaderData{
    [self.listRecommendInfoArray removeAllObjects];
    self.page = 1;
    [self loadData];
}

- (void)loadFooterData{
    self.page ++;
    if (self.page > [self.detailModel.maxPage intValue]) {
        self.page --;
        [self showHint:@"没有更多呦~"];
        [self endRefreshing];
        return;
    }
    [self loadData];
}

#pragma mark - load Data
- (void)loadData{
    
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/SpecialInfoBySpecialID?p_iSpecialID=%@&pageIndex=%d",self.p_iSpecialID,self.page];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        
        self.isRefresh = YES;
        self.detailModel = [BYBHomeHotDetailModel mj_objectWithKeyValues:responseObject];
        [self.listRecommendInfoArray addObjectsFromArray:self.detailModel.listRecommendInfo];
        [self.collectionView reloadData];
        [self endRefreshing];
        
    } failure:^(NSError *error) {
        [self showHint:@"请求失败"];
    }];
    
}

#pragma mark - Actions
- (void)shareAction{
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return self.listRecommendInfoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        BYBHomeBranDetailTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
        cell.hotModel = self.detailModel;
        return cell;
    }
    
    BYBHomeBranDetailRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendCell" forIndexPath:indexPath];
    
    cell.model = self.listRecommendInfoArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BYBHomeBrandListRecommendModel *model = self.listRecommendInfoArray[indexPath.row];
    BYBGoodDetailViewController *vc = [[BYBGoodDetailViewController alloc]init];
    vc.iInfoID = model.iInfoID;
    [self.navigationController pushViewController:vc animated:YES];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenW, [self.detailModel cellHeight]);
    }
    return CGSizeMake((kScreenW - 30)/2, 305);
    
}

//设置垂直间距,默认的垂直和水平间距都是10
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return  10;
}


//设置水平间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

// 四周的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return section == 0 ? UIEdgeInsetsZero : UIEdgeInsetsMake(10, 10, 30, 10);
}






@end

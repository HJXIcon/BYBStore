//
//  BYBHomeOtherSpecialController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeOtherSpecialController.h"
#import "BYBHomeBranDetailRecommendCell.h"
#import "BYBHomeOtherSpecialModel.h"
#import "BYBGoodDetailViewController.h"

@interface BYBHomeOtherSpecialController ()

@property (nonatomic, strong) NSMutableArray <BYBHomeOtherSpecialModel *>*dataArray;
/** 当前页 */
@property (nonatomic, assign) int page;
@end

@implementation BYBHomeOtherSpecialController

#pragma mark - lazy load
- (NSMutableArray<BYBHomeOtherSpecialModel *> *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = BYBBGColor;
    [self.collectionView registerClass:[BYBHomeBranDetailRecommendCell class] forCellWithReuseIdentifier:@"recommendCell"];
}

#pragma mark - load Data
- (void)loadHeaderData{
    [self.dataArray removeAllObjects];
    self.page = 1;
    [self loadData];
}

- (void)loadFooterData{
    self.page ++;
    [self loadData];
}

#pragma mark - load Data
- (void)loadData{
    
    NSString *specail = [self getSpecailString];
    
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/GetInfoListWithHomeshowAndIstop_exceptMallUrlJson?bigPrice=0&brandUrl=&brightUrl=&btCountry=0&catUrl=%@&exceptMallUrl=&homeShow=1&infoNation=0&infoType=0&isPurchasing=0&isTop=1&keyWord=&mallUrl=&orderBy=0&pageIndex=%d&pageSize=20&smallPrice=0&tagUrl=",specail,self.page];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        
        NSArray *jsonArray = (NSArray *)responseObject;
        if (jsonArray.count == 0) {
            [self showHint:@"没有更多了呦~"];
            self.page --;
            return ;
        }
        
        self.isRefresh = YES;
        [self.dataArray addObjectsFromArray: [BYBHomeOtherSpecialModel mj_objectArrayWithKeyValuesArray:responseObject]];
        [self.collectionView reloadData];
        [self endRefreshing];
        
    } failure:^(NSError *error) {
        [self showHint:@"请求失败"];
    }];
    
}


/// 获取除了日淘，美淘之后的类别
- (NSString *)getSpecailString{
    
    NSString *string;
    switch (self.special) {
        case BYBHomeSpecialFuShi:
            string = @"fushixiebao";
            break;
            
        case BYBHomeSpecialMeiZhuang:
            string = @"gehumeizhuang";
            break;
            
        case BYBHomeSpecialMuYing:
            string = @"muyingyongpin";
            break;
            
        case BYBHomeSpecialQingShe:
            string = @"zhongbiaoshoushi";
            break;
            
        case BYBHomeSpecialBaiHuo:
            string = @"riyongbaihuo";
            break;
            
        case BYBHomeSpecialMeiShi:
            string = @"shipinbaojian";
            break;
            
        case BYBHomeSpecialYunDong:
            string = @"yundonghuwai";
            break;
            
        default:
            break;
    }
    
    return string;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    

    BYBHomeBranDetailRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendCell" forIndexPath:indexPath];
    
    cell.otherSpecialModel = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BYBHomeOtherSpecialModel *model = self.dataArray[indexPath.row];
    BYBGoodDetailViewController *vc = [[BYBGoodDetailViewController alloc]init];
    vc.iInfoID = model.InfoID;
    [self.navigationController pushViewController:vc animated:YES];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
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
    return  UIEdgeInsetsMake(10, 10, 30 + 50 + 49, 10);
}




@end

//
//  BYBCategorySubCategoryController.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategorySubCategoryController.h"
#import "BYBCategorySubCategoryModel.h"
#import "BYBCategorySubCategoryCell.h"

@interface BYBCategorySubCategoryController ()

@property (nonatomic, strong) NSMutableArray <BYBCategorySubCategoryModel *>*dataArray;
@end

@implementation BYBCategorySubCategoryController
- (NSMutableArray<BYBCategorySubCategoryModel *> *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[BYBCategorySubCategoryCell class] forCellWithReuseIdentifier:@"cell"];
    [self loadData];
    self.collectionView.mj_footer.hidden = YES;
    self.collectionView.mj_header.hidden = YES;
}

- (void)loadHeaderData{
    self.isRefresh = YES;
    [self endRefreshing];
}

#pragma mark - load Data
- (void)loadData{
    //
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/GetThreeLevelCatagoryListJson?parentUrl=%@",self.parentUrl];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        self.dataArray = [BYBCategorySubCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        
        if (self.dataArray.count) {
            BYBCategorySubCategoryModel *model = [[BYBCategorySubCategoryModel alloc]init];
            model.CatName = @"全部分类";
            model.CatImage = @"全部分类_35x35_";
            [self.dataArray insertObject:model atIndex:0];
        }
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        [self loadData];
    }];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    BYBCategorySubCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   BYBCategorySubCategoryModel *model = self.dataArray[indexPath.row];
}






- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreenW / 4, kScreenW / 4);
    
}

//设置垂直间距,默认的垂直和水平间距都是10
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return  0;
}


//设置水平间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

// 四周的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(-64, 0, 0, 0);
}




@end

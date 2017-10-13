//
//  BYBCategoryCategoryController.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategoryCategoryController.h"
#import "BYBCategoryHotTagModel.h"
#import "BYBCategoryCategoryCell.h"
#import "BYBCategoryCategoryMoreCell.h"
@interface BYBCategoryCategoryController ()
@property (nonatomic, strong) NSArray <BYBCategoryHotTagGroupModel *>*dataArray;
@end

@implementation BYBCategoryCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[BYBCategoryCategoryCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[BYBCategoryCategoryMoreCell class] forCellWithReuseIdentifier:@"moreCell"];
    
    self.collectionView.backgroundColor = BYBBGColor;
//    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 64 + 49, 0);
    
    self.collectionView.mj_header.hidden = YES;
    self.collectionView.mj_footer.hidden = YES;
    
    [self loadData];
}

#pragma mark - load Data
- (void)loadData{
    // http://openapi.biyabi.com/webservice.asmx/GetHotTagGroupJson
    NSString *URLStr = @"http://openapi.biyabi.com/webservice.asmx/GetHotTagGroupJson";
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        self.dataArray = [BYBCategoryHotTagGroupModel mj_objectArrayWithKeyValuesArray:responseObject];
        
    } failure:^(NSError *error) {
        [self loadData];
    }];
    
}

- (void)loadHeaderData{
    [self endRefreshing];
}

#pragma mark - setter
- (void)setDataArray:(NSArray<BYBCategoryHotTagGroupModel *> *)dataArray{
    _dataArray = dataArray;
    [self.collectionView reloadData];
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    if (section == 0) {
        BYBCategoryHotTagGroupModel *model = self.dataArray[1];
        return model.ListHotTag.count + 1;
    }
    
    BYBCategoryHotTagGroupModel *model = self.dataArray[2];
    return model.ListHotTag.count + 1;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     BYBCategoryHotTagGroupModel *model = self.dataArray[indexPath.section + 1];
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == model.ListHotTag.count) {
                BYBCategoryCategoryMoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"moreCell" forIndexPath:indexPath];
                cell.label.text = @"全部类别";
                return cell;
            }
            
        }
            break;
            
        case 1:
        {
            if (indexPath.row == model.ListHotTag.count) {
                BYBCategoryCategoryMoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"moreCell" forIndexPath:indexPath];
                cell.label.text = @"全部商城";
                return cell;
            }
        }
            break;

            
        default:
            break;
    }
    
    BYBCategoryCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = model.ListHotTag[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return CGSizeMake((kScreenW - 2)/3, 190);
    
}

//设置垂直间距,默认的垂直和水平间距都是10
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return  1;
}


//设置水平间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

// 四周的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}




@end

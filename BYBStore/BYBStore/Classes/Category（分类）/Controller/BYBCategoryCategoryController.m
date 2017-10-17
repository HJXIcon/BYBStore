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
#import "BYBCategoryBusinessCell.h"
#import "BYBCategorySubCategoryController.h"

#define KHeaderTitles @[@"       热门类别",@"       热门电商"]

@interface BYBCategoryCategoryController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray <BYBCategoryHotTagGroupModel *>*dataArray;
@end

@implementation BYBCategoryCategoryController
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[BYBCategoryCategoryCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[BYBCategoryBusinessCell class] forCellWithReuseIdentifier:@"BusCell"];
    [self.collectionView registerClass:[BYBCategoryCategoryMoreCell class] forCellWithReuseIdentifier:@"moreCell"];
    
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    self.collectionView.backgroundColor = BYBBGColor;
//    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 64 + 49, 0);
    
    
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
    
    
    if (indexPath.section == 1) {
        BYBCategoryBusinessCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BusCell" forIndexPath:indexPath];
        
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.ListHotTag[indexPath.row].strTagImage] placeholderImage:BYB_PlaceholderImage];
        
        return cell;
    }
    
    BYBCategoryCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = model.ListHotTag[indexPath.row];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        BYBCategorySubCategoryController *vc = [[BYBCategorySubCategoryController alloc]init];
        BYBCategoryHotTagGroupModel *model = self.dataArray[indexPath.section + 1];
        vc.title = model.ListHotTag[indexPath.row].strTagName;
        vc.parentUrl = model.ListHotTag[indexPath.row].strTagUrl;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - header/footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        [header.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        
        UILabel *label = [JXFactoryTool creatLabel:CGRectMake(0, 0, kScreenW, 34.5) font:[UIFont systemFontOfSize:15 weight:.1] textColor:BYBTEXTColor2 text:KHeaderTitles[indexPath.section] textAlignment:0];
        label.backgroundColor = [UIColor whiteColor];
        [header addSubview:label];
        
        return header;
        
    } else if (kind == UICollectionElementKindSectionFooter){
        
        if (indexPath.section == 0) {
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            return footer;
        }
    }
    
    return nil;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(kScreenW, 35);
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    
    if (section == 0) {
        
        return CGSizeMake(kScreenW, 20);
    }
    return CGSizeZero;
}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 1) {
        return CGSizeMake((kScreenW - 3)/4, (kScreenW - 3)/4);
    }
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
    return section == 1 ? UIEdgeInsetsMake(0, 0, 180, 0) : UIEdgeInsetsZero;
}




@end

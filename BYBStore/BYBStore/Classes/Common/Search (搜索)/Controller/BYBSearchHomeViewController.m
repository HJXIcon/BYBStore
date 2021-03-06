//
//  BYBSearchHomeViewController.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchHomeViewController.h"
#import "UIImageView+LBBlurredImage.h"
#import <FXBlurView.h>
#import "BYBSearchHomeHistoryCell.h"
#import "BYBSearchHomeHotCell.h"
#import "BYBCategoryHotTagModel.h"
#import "BYBSearchTool.h"
#import "BYBSearchViewController.h"

#define KHeaderTitles @[@"     历史搜索",@"     热门搜索"]

@interface BYBSearchHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) CGFloat historyHeight;
@property (nonatomic, strong) NSArray <BYBCategoryHotTagGroupModel *>*dataArray;
@property (nonatomic, strong) NSArray <NSString *>*historyArray;
@end

@implementation BYBSearchHomeViewController
- (NSArray<NSString *> *)historyArray{
    if (_historyArray == nil) {
        _historyArray = [[NSUserDefaults standardUserDefaults]objectForKey:HistorySearchArray];
    }
    return _historyArray;
}

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
        _collectionView.alwaysBounceVertical = YES;
        [_collectionView registerClass:[BYBSearchHomeHistoryCell class] forCellWithReuseIdentifier:@"historyCell"];
        [_collectionView registerClass:[BYBSearchHomeHotCell class] forCellWithReuseIdentifier:@"hotCell"];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBlur];
    [self.view addSubview:self.collectionView];
    _historyHeight = 80;
    [self loadData];
}

#pragma mark - load Data
- (void)loadData{
    // http://openapi.biyabi.com/webservice.asmx/GetHotTagGroupJson
    NSString *URLStr = @"http://openapi.biyabi.com/webservice.asmx/GetHotTagGroupJson";
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
         self.dataArray = [BYBCategoryHotTagGroupModel mj_objectArrayWithKeyValuesArray:responseCache];
        if (self.historyArray.count) {
            
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
        }else{
            
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
        }
        
    } success:^(id responseObject) {
        self.dataArray = [BYBCategoryHotTagGroupModel mj_objectArrayWithKeyValuesArray:responseObject];
        
        if (self.historyArray.count) {
            
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
        }else{
            
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
        }
        
        
    } failure:^(NSError *error) {
        [self loadData];
    }];
    
}

- (void)setupBlur{
    
    
    /// http://www.jianshu.com/p/70d3af876909
    FXBlurView *blurView = [[FXBlurView alloc] init];
    [blurView setFrame:self.view.bounds];
    blurView.tintColor = [UIColor colorWithWhite:0.f alpha:0.68f];  //前景颜色
    //是否允许模糊，默认YES
    blurView.blurEnabled = YES;
    //模糊半径
    blurView.blurRadius = 60.0;
    //动态改变模糊效果
    blurView.dynamic = YES;
    //迭代次数：
    blurView.iterations = 2;
    //更新时间（不确定具体功能）
    blurView.updateInterval = 2.0;
    
    self.view = blurView;

}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    if (self.historyArray.count) {
        return 2;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0 && self.historyArray.count) {
        return  1;
    }
    return self.dataArray[1].ListHotTag.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && self.historyArray.count) {
        
        BYBSearchHomeHistoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"historyCell" forIndexPath:indexPath];
        
        
        cell.tagsArray = self.historyArray;
        JXWeakSelf;
        cell.updateCellHeightBlock = ^(CGFloat height) {
            weakSelf.historyHeight = height;
            [weakSelf.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]];
        };
        
        cell.selectBlock = ^(NSInteger index) {
            JXLog(@"history -- %ld",index);
            [[UIApplication sharedApplication].keyWindow endEditing:YES];
            
            [BYBSearchTool writeSearchTextAndSearch:weakSelf.historyArray[index]];
            
        };
        
        cell.clearHistoryBlock = ^{
          
            [[NSUserDefaults standardUserDefaults]setObject:nil forKey:HistorySearchArray];
            self.historyArray = nil;
             [weakSelf.collectionView reloadData];
        };
        return cell;
    }
    
    BYBSearchHomeHotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotCell" forIndexPath:indexPath];
    
    BYBCategoryHotTagModel *model = self.dataArray[1].ListHotTag[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && self.historyArray.count) {// 历史搜索
        return;
    }
    
    // 热门搜索
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [BYBControllerManger dismissSearchController];
    
    BYBCategoryHotTagModel *model = self.dataArray[1].ListHotTag[indexPath.row];
    BYBSearchViewController *vc = [[BYBSearchViewController alloc]init];
    vc.searchText = model.strTagName;
    [[BYBControllerManger currentViewController].navigationController pushViewController:vc animated:YES];
}


#pragma mark - ****
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && self.historyArray.count) {
        
        return CGSizeMake(kScreenW, self.historyHeight);
    }
    return CGSizeMake((kScreenW - 50)/ 4, (kScreenW - 50)/ 4);
    
}

//设置垂直间距,默认的垂直和水平间距都是10
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0 && self.historyArray.count) {
        return 0;
    }
    return  10;
}


//设置水平间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0 && self.historyArray.count) {
        
        return  0;
    }
    return 10;
}

// 四周的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0 && self.historyArray.count) {
        return UIEdgeInsetsZero;
    }
    return UIEdgeInsetsMake(10, 10, 400, 10);
}

#pragma mark - header/footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        [header.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        
        UILabel *label = [JXFactoryTool creatLabel:CGRectMake(0, 0, kScreenW, 34.5) font:[UIFont systemFontOfSize:15 weight:.3] textColor:BYBTEXTColor2 text:KHeaderTitles[indexPath.section] textAlignment:0];
        [header addSubview:label];
        
        return header;
        
    }
    
    return nil;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(kScreenW, 35);
}





@end

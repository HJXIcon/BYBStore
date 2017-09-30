//
//  BYBBYBGoodDetailsMayLikeCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsMayLikeCell.h"
#import "BYBGoodDetailsMayLikeCollectionViewCell.h"
#import "BYBGoodDetailMayLikeViewModel.h"

@interface BYBGoodDetailsMayLikeCell()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation BYBGoodDetailsMayLikeCell

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((kScreenW - 45) * 0.5, [BYBGoodDetailMayLikeViewModel mayLikeCellHeight]);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollsToTop = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.contentInset = UIEdgeInsetsMake(15, 15, 15, 15);
        [_collectionView registerClass:[BYBGoodDetailsMayLikeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}


- (void)setVm:(BYBGoodDetailMayLikeViewModel *)vm{
    _vm = vm;
    [self.collectionView reloadData];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    UILabel *likeLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:16 weight:.2] textColor:BYBTEXTColor2 text:@"为你推荐" textAlignment:0];
    [self.contentView addSubview:likeLabel];
    [likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).offset(15);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = BYBTEXTColor0;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(likeLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(0.25);
    }];
    
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.contentView);
    }];
    
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.vm.mayLikeData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BYBGoodDetailsMayLikeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = self.vm.mayLikeData[indexPath.row];
    
    return cell;
}
@end

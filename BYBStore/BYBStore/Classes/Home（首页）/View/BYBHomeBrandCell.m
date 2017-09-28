//
//  BYBHomeBrandCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBrandCell.h"
#import "BYBHomeBrandModel.h"
#import "BYBHomeBrandlistRecommendCell.h"
#import "BYBHomeBranDetailController.h"
#import "BYBGoodDetailViewController.h"

@interface BYBHomeBrandCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UICollectionView *collectionView;

@end
@implementation BYBHomeBrandCell
- (void)setFrame:(CGRect)frame{
    frame.size.height -= 15;
    [super setFrame:frame];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
        
    }
    return self;
}


- (void)setModel:(BYBHomeBrandModel *)model{
    _model = model;
    BYBHomeBrandListRecommendModel *listInfoModel = model.listRecommendInfo.firstObject;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:listInfoModel.BrandLogo] placeholderImage:BYB_PlaceholderImage];
    
    self.titleLabel.text = model.strBrandName;
    self.subTitleLabel.text = model.strBrandExclusiveTitle;
    [self.desLabel setMarginText:model.strBrandContent LineSpacing:5];
    
    [self.collectionView reloadData];
}

- (void)setupUI{
    
    self.iconImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.width.height.mas_equalTo(45);
    }];
    
    self.titleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont boldSystemFontOfSize:15] textColor:nil text:@"江原道" textAlignment:0];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(8);
    }];
    
    
    self.subTitleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:1] textColor:BYBTEXTColor0 text:@"还好四次黑hi安倍hi哦啊我和讴歌奥和哦我啊回复得会" textAlignment:0];
    [self.contentView addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:.5] textColor:BYBTEXTColor2 text:@"十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵" textAlignment:0];
    self.desLabel.numberOfLines = 2;
    
    [self.contentView addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_left);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).offset(10);
        make.width.mas_equalTo(kScreenW - 20);
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(180, 250);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[BYBHomeBrandlistRecommendCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell2"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.desLabel.mas_bottom).offset(0);
        make.right.left.bottom.mas_equalTo(self.contentView);
    }];
    
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.model.listRecommendInfo.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row < self.model.listRecommendInfo.count) {
        
        BYBHomeBrandlistRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        
        cell.model = self.model.listRecommendInfo[indexPath.row];
        return cell;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
    
    UIImageView *imageView = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:@"chakangengduo_83x83_"]];
    [cell.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(cell.contentView);
        make.width.height.mas_equalTo(42);
    }];
    
    UILabel *label = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12] textColor:[UIColor grayColor] text:@"查看更多" textAlignment:NSTextAlignmentCenter];
    [cell.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(imageView);
        make.top.mas_equalTo(imageView.mas_bottom).offset(10);
    }];
    
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [BYBControllerManger getControllerFormView:self];
    
    if (indexPath.row < self.model.listRecommendInfo.count) {
        BYBGoodDetailViewController *goodVc = [[BYBGoodDetailViewController alloc]init];
        goodVc.iInfoID = self.model.listRecommendInfo[indexPath.row].iInfoID;
        [vc.navigationController pushViewController:goodVc animated:YES];
    }else{
        
        BYBHomeBranDetailController *branDetailVc = [[BYBHomeBranDetailController alloc]init];
        branDetailVc.iBrandExclusiveID = self.model.iBrandExclusiveID;
        branDetailVc.title = self.model.strBrandName;
        [vc.navigationController pushViewController:branDetailVc animated:YES];
    }
}


@end

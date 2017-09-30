//
//  BYBGoodDetailsMayLikeCollectionViewCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsMayLikeCollectionViewCell.h"
#import "BYBGoodDetailMayLikeModel.h"

@interface BYBGoodDetailsMayLikeCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@end
@implementation BYBGoodDetailsMayLikeCollectionViewCell

- (void)setModel:(BYBGoodDetailMayLikeModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.MainImage] placeholderImage:BYB_PlaceholderImage];
    self.titleLabel.text = model.InfoTitle;
    self.priceLabel.text = model.MinPriceRMB;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.layer.borderColor = BYBBorderColor.CGColor;
        self.layer.borderWidth = 1;
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(180);
    }];
    
    self.priceLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:15 weight:.3] textColor:BYBThemeColor text:@"3376.77" textAlignment:0];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
    }];
    
    self.titleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:15 weight:.2] textColor:BYBTEXTColor2 text:@"的奇偶黑暗嘿哈还hi饿哦hi哈" textAlignment:0];
    self.titleLabel.numberOfLines = 3;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.priceLabel);
        make.bottom.mas_equalTo(self.priceLabel.mas_top).offset(-15);
    }];
    
    
    
}
@end


//
//  BYBHomeBrandlistRecommendCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBrandlistRecommendCell.h"
#import "BYBHomeBrandModel.h"

@interface BYBHomeBrandlistRecommendCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIImageView *bottomImageView;
@property (nonatomic, strong) UILabel *bottomLabel;

@end
@implementation BYBHomeBrandlistRecommendCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}


- (void)setModel:(BYBHomeBrandListRecommendModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.strMainImage] placeholderImage:BYB_PlaceholderImage];
    self.titleLabel.text = model.strInfoTitle;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",model.decMinPriceRMB];
    [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:model.countrySmallIcon] placeholderImage:BYB_PlaceholderImage];
    self.bottomLabel.text = model.mall[@"strMallName"];
    
}

- (void)setupUI{
    
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(180);
    }];
    
    self.titleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:0.5] textColor:[UIColor grayColor] text:@"是的黑hi恩还哦好哦额" textAlignment:0];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.left.right.mas_equalTo(self.imageView);
    }];
    
    self.priceLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:14 weight:2] textColor:BYBThemeColor text:@"¥238.38" textAlignment:0];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithHexString:@"0xf0eff5"]];
    UIImageView *bottomImageView = [JXFactoryTool creatImageView:CGRectZero image:image];
    bottomImageView.layer.cornerRadius = 15;
    bottomImageView.layer.masksToBounds = YES;
    [self.contentView addSubview: bottomImageView];
    [bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.priceLabel);
        make.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(25);
    }];
    
    self.bottomImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [bottomImageView addSubview:self.bottomImageView];
    [self.bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomImageView);
        make.width.height.mas_equalTo(10);
        make.left.mas_equalTo(bottomImageView).offset(10);
    }];
    
    self.bottomLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:9] textColor:[UIColor lightGrayColor] text:@"日本亚马逊" textAlignment:0];
    [bottomImageView addSubview:self.bottomLabel];
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomImageView);
        make.left.mas_equalTo(self.bottomImageView.mas_right).offset(10);
        make.right.mas_equalTo(bottomImageView.mas_right).offset(-10);
    }];
    
    
    
    
}
@end

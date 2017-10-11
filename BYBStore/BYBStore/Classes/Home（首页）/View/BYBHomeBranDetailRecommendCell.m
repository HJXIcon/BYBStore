//
//  BYBHomeBranDetailRecommendCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBranDetailRecommendCell.h"
#import "BYBHomeBrandModel.h"
#import "BYBHomeOtherSpecialModel.h"

@interface BYBHomeBranDetailRecommendCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIImageView *countryImageView;
@property (nonatomic, strong) UILabel *countryLabel;

@end
@implementation BYBHomeBranDetailRecommendCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

#pragma mark - setter

- (void)setOtherSpecialModel:(BYBHomeOtherSpecialModel *)otherSpecialModel{
    _otherSpecialModel = otherSpecialModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:otherSpecialModel.MainImage] placeholderImage:BYB_PlaceholderImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        JXLog(@"imageSize == %@",NSStringFromCGSize(image.size));
      
        self.imageView.image = [UIImage IMGCompressed:image targetWidth:CGRectGetHeight(self.imageView.frame)];
            
    }];
    [self.titleLabel setMarginText:otherSpecialModel.InfoTitle LineSpacing:3];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",otherSpecialModel.MinPriceRMB];
    [self.countryImageView sd_setImageWithURL:[NSURL URLWithString:otherSpecialModel.countrySmallIcon] placeholderImage:BYB_PlaceholderImage];
    self.countryLabel.text = [NSString stringWithFormat:@"%@供货",otherSpecialModel.MallName];
}
- (void)setModel:(BYBHomeBrandListRecommendModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.strMainImage] placeholderImage:BYB_PlaceholderImage];
    [self.titleLabel setMarginText:model.strInfoTitle LineSpacing:3];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",model.decMinPriceRMB];
    [self.countryImageView sd_setImageWithURL:[NSURL URLWithString:model.countrySmallIcon] placeholderImage:BYB_PlaceholderImage];
    self.countryLabel.text = [NSString stringWithFormat:@"%@供货",model.mall[@"strMallName"]];
}

- (void)setupUI{
    
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(200);
    }];
    
    self.titleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:.2] textColor:BYBTEXTColor2 text:@"的hi额hi奥hi好吧" textAlignment:0];
    self.titleLabel.numberOfLines = 2;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(5);
    }];
    
    self.priceLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:.5] textColor:BYBThemeColor text:@"¥8979.2" textAlignment:0];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
    }];
    
    self.countryImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.countryImageView];
    [self.countryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(15);
        make.width.height.mas_equalTo(10);
        make.left.mas_equalTo(self.priceLabel);
    }];
    
    
    self.countryLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:9 weight:.2] textColor:BYBTEXTColor1 text:@"杀跌会" textAlignment:0];
    [self.contentView addSubview:self.countryLabel];
    [self.countryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.countryImageView.mas_right).offset(10);
        make.centerY.mas_equalTo(self.countryImageView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    
}


@end

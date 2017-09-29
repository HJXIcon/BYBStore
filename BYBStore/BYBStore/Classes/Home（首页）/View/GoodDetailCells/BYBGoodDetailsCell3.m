//
//  BYBGoodDetailsCell3.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/29.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsCell3.h"
#import "BYBGoodDetailModel.h"

@interface BYBGoodDetailsCell3 ()
@property (nonatomic, strong) UIImageView *brandImageView;
@property (nonatomic, strong) UILabel *branLabel;
@property (nonatomic, strong) UIButton *allGoodsBtn;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel *desLabel;
@end
@implementation BYBGoodDetailsCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setModel:(BYBGoodDetailGetInfoBrandDataModel *)model{
    _model = model;
    
    [self.brandImageView sd_setImageWithURL:[NSURL URLWithString:model.strBrandLogo] placeholderImage:BYB_PlaceholderImage];
    self.branLabel.text = model.strBrandName;
    
    if (model.strBrandDes.length) {
        [self.desLabel setMarginText:model.strBrandDes LineSpacing:8];
    }
}

- (void)setupUI{
    
    self.brandImageView = [JXFactoryTool creatImageView:CGRectZero image:nil];
    [self.contentView addSubview:self.brandImageView];
    [self.brandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(15);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(50);
    }];
    
    
    self.branLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:13 weight:.3] textColor:nil text:@"mybag" textAlignment:0];
    [self.contentView addSubview:self.branLabel];
    [self.branLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.brandImageView.mas_right).offset(5);
        make.centerY.mas_equalTo(self.brandImageView);
    }];
    
    self.arrowImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_ArrowImage];
    [self.contentView addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(self.brandImageView);
    }];
    
    self.allGoodsBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont systemFontOfSize:13 weight:.3] normalColor:BYBTEXTColor1 selectColor:nil title:@"全部商品" nornamlImageName:nil selectImageName:nil textAlignment:0 target:self action:@selector(allGoodsAction)];
    [self.contentView addSubview:self.allGoodsBtn];
    [self.allGoodsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.arrowImageView);
        make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-10);
    }];
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:13 weight:.2] textColor:BYBTEXTColor1 text:@"的哦我hiode奇偶怕被" textAlignment:0];
    [self.contentView addSubview:self.desLabel];
    self.desLabel.numberOfLines = 0;
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.brandImageView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.brandImageView.mas_bottom).offset(30);
    }];
    
}


- (void)allGoodsAction{
    
}

@end

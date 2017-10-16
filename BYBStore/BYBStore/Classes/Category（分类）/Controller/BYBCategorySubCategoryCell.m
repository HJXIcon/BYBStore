//
//  BYBCategorySubCategoryCell.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategorySubCategoryCell.h"
#import "BYBCategorySubCategoryModel.h"

@interface BYBCategorySubCategoryCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *desLabel;
@end
@implementation BYBCategorySubCategoryCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.center.mas_equalTo(self.contentView);
    }];
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:16 weight:.3] textColor:BYBTEXTColor2 text:@"" textAlignment:NSTextAlignmentCenter];
    [self.contentView addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
    }];
}


- (void)setModel:(BYBCategorySubCategoryModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.CatImage] placeholderImage:BYB_PlaceholderImage];
    if (![model.CatImage containsString:@"http"]) {
        [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
//            make.center.mas_equalTo(self.contentView);
        }];
        [self.contentView layoutIfNeeded];
        
        self.imageView.image = [UIImage imageNamed:model.CatImage];
    }
    self.desLabel.text = model.CatName;
    
}
@end

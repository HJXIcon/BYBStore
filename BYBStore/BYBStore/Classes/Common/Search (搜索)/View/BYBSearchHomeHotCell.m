//
//  BYBSearchHomeHotCell.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchHomeHotCell.h"
#import "BYBCategoryHotTagModel.h"

@interface BYBSearchHomeHotCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation BYBSearchHomeHotCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.contentView.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.cornerRadius = self.contentView.width * 0.5;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    self.titleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:13 weight:.2] textColor:BYBTEXTColor2 text:@"拿耳机哦" textAlignment:NSTextAlignmentCenter];
    [bgView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(bgView);
        make.top.mas_equalTo(bgView).offset(10);
    }];
    
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [bgView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerX.mas_equalTo(bgView);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    
    
}

- (void)setModel:(BYBCategoryHotTagModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.strTagImage] placeholderImage:BYB_PlaceholderImage];
    self.titleLabel.text = model.strTagName;
}


@end

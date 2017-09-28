//
//  BYBHomeBranDetailTopCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBranDetailTopCell.h"
#import "BYBHomeBranDetailModel.h"

@interface BYBHomeBranDetailTopCell ()
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *desLabel;
@property(nonatomic, strong) UIImageView *yhImageView1;
@property(nonatomic, strong) UIImageView *yhImageView2;
@end
@implementation BYBHomeBranDetailTopCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

- (void)setModel:(BYBHomeBranDetailModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.strBrandImage] placeholderImage:BYB_PlaceholderImage];
    [self.desLabel setMarginText:model.strBrandContent LineSpacing:10];
}

- (void)setupUI{
    
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(220);
    }];
    
    self.yhImageView1 = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:@"zuoyinhao_22x15_"]];
    [self.contentView addSubview:self.yhImageView1];
    [self.yhImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(5);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(15);
    }];
    
    self.yhImageView2 = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:@"xiayinhao_22x15_"]];
    [self.contentView addSubview:self.yhImageView2];
    [self.yhImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(15);
    }];
    
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:15 weight:.2] textColor:BYBTEXTColor1 text:@"使得红使得红我啊好大和宏id后我按位hi殴打黑哦使得红我啊好大和宏id后我按位hi殴打黑哦使得红我啊好大和宏id后我按位hi殴打黑哦我啊好大和宏id后我按位hi殴使得红我啊好大和宏id后我按位hi殴打黑哦使得红我啊好大和宏id后我按位hi殴打黑哦使得红我啊好大和宏id后我按位hi殴打黑哦打黑哦" textAlignment:0];
    self.desLabel.numberOfLines = 0;
    [self.contentView addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.yhImageView1.mas_right).offset(5);
        make.top.mas_equalTo(self.yhImageView1);
        make.right.mas_equalTo(self.yhImageView2.mas_left).offset(-5);
    }];
    
    
}


@end

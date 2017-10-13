//
//  BYBSellingListCell.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSellingListCell.h"
#import "BYBSellingListModel.h"

@interface BYBSellingListCell ()
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UILabel *hotLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end
@implementation BYBSellingListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.imgView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        make.width.mas_equalTo(100);
    }];
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:16 weight:.2] textColor:BYBTEXTColor2 text:@"的hihadhi奥洪波拿的话" textAlignment:0];
    [self.contentView addSubview:self.desLabel];
    self.desLabel.numberOfLines = 0;
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.left.mas_equalTo(self.imgView.mas_right).offset(20);
    }];
    
    self.hotLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:10 weight:.1] textColor:[UIColor whiteColor] text:@"🔥热度:100%" textAlignment:NSTextAlignmentCenter];
    self.hotLabel.backgroundColor = BYBThemeColor;
    self.hotLabel.cornerRadius = 14 * 0.5;

    [self.contentView addSubview:self.hotLabel];
    [self.hotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.desLabel);
        make.top.mas_equalTo(self.desLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(80);
    }];
    
    self.priceLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:16 weight:.3] textColor:BYBThemeColor text:@"¥318.32" textAlignment:0];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.desLabel);
        make.top.mas_equalTo(self.hotLabel.mas_bottom).offset(20);
    }];
}

- (void)setModel:(BYBSellingListModel *)model{
    _model = model;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.MainImage] placeholderImage:BYB_PlaceholderImage];
    self.desLabel.text = model.InfoTitle;
    self.hotLabel.text = [NSString stringWithFormat:@"🔥 热度:%@",model.HotDegree];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",model.MinPriceRMB];
}
@end

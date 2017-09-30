//
//  BYBGoodDetailsCell5.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/29.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsCell5.h"
#import "BYBGoodDetailModel.h"

@interface BYBGoodDetailsCell5 ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *desLabel;
@end
@implementation BYBGoodDetailsCell5

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
         self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self setupUI];
    }
    return self;
}

- (void)setModel:(BYBGoodDetailGetInfoReviewModel *)model{
    _model = model;
    
    if (model.user.strHeadImage.length) {
        
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.user.strHeadImage] placeholderImage:BYB_PlaceholderImage];
    }
    self.nickNameLabel.text = model.user.strNickname;
    self.timeLabel.text = model.dtReviewTime;
    self.desLabel.text = model.strReviewContent;
}

- (void)setupUI{
    
    self.iconImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    self.iconImageView.layer.cornerRadius = 15;
    self.iconImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).offset(15);
        make.width.height.mas_equalTo(30);
    }];
    
    
    self.nickNameLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:.2] textColor:nil text:@"蹭个女" textAlignment:0];
    [self.contentView addSubview:self.nickNameLabel];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(15);
        make.top.mas_equalTo(self.iconImageView);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.mas_equalTo(20);
    }];
    
    self.timeLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:11 weight:.2] textColor:BYBTEXTColor0 text:@"08:37" textAlignment:0];
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLabel);
        make.top.mas_equalTo(self.nickNameLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.height.mas_equalTo(20);
    }];
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:13 weight:.2] textColor:BYBTEXTColor2 text:@"十分de的还十分de的还十分de的还十分de的还十分de的还十分de的还十分de的还会" textAlignment:0];
    self.desLabel.numberOfLines = 0;
    [self.contentView addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeLabel);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-15);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
        
    }];
}


@end

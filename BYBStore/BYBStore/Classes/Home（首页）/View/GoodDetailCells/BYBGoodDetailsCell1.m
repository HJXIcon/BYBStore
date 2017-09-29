//
//  BYBGoodDetailsCell1.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsCell1.h"
#import "BYBGoodDetailModel.h"

@interface  BYBGoodDetailsCell1()
@property(nonatomic, strong) UIImageView *mainImageView;
@property(nonatomic, strong) UILabel *desLabel;
@property(nonatomic, strong) UILabel *nickNameLabel;
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *priceLabel;

@end
@implementation BYBGoodDetailsCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.mainImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.mainImageView];
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(350);
    }];
    
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:15 weight:.2] textColor:BYBTEXTColor2 text:@"的文化的华为比" textAlignment:0];
    [self.contentView addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(20);
        make.top.mas_equalTo(self.mainImageView.mas_bottom);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = BYBTEXTColor0;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.top.mas_equalTo(self.desLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(0.25);
    }];
    

    UIImageView *iconImageV = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:@"我的09gray_25x25_"]];
    [self.contentView addSubview:iconImageV];
    [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).offset(10);
        make.width.height.mas_equalTo(16);
        make.left.mas_equalTo(self.contentView).offset(kScreenW/4);
    }];
    
    self.nickNameLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:14 weight:.3] textColor:BYBTEXTColor1 text:@"小米" textAlignment:0];
    [self.contentView addSubview:self.nickNameLabel];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(iconImageV);
        make.left.mas_equalTo(iconImageV.mas_right).offset(5);
    }];
    
    UIImageView *timeImageV = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:@"shijian_gray_15x15_"]];
    [self.contentView addSubview:timeImageV];
    [timeImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(iconImageV);
        make.width.height.mas_equalTo(16);
        make.left.mas_equalTo(self.nickNameLabel.mas_right).offset(25);
    }];
    
    self.timeLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:14 weight:.3] textColor:BYBTEXTColor1 text:@"8-10 21:23" textAlignment:0];
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(timeImageV);
        make.left.mas_equalTo(timeImageV.mas_right);
    }];
    
    self.priceLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:17 weight:.5] textColor:BYBThemeColor text:@"¥ 2782.33" textAlignment:0];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(timeImageV);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(10);
    }];
    
    
    UIView *bottomView = [[UIView alloc]init];
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(0);
        make.left.right.bottom.mas_equalTo(self.contentView);
    }];
    
    NSMutableArray *imageViews = [NSMutableArray array];
    NSArray *images = @[@"icon_haiwaizhigou_infodetail_45x45_",@"icon_zhengpinbaozheng_infodetail_45x45_",@"icon_xianluzixuan_infodetail_45x45_",@"icon_wuliutouming_infodetail_60x60_"];
    NSArray *titles = @[@"海外直购",@"正品保障",@"线路自选",@"物流透明"];
    CGFloat btnW = (kScreenW - 40) / 4;
    CGFloat btnH = 60;
    for (int i = 0; i < 4; ++i) {
        
        UIView *view = [[UIView alloc]init];
        [bottomView addSubview:view];
        [imageViews addObject:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(btnW, btnH));
            make.centerY.mas_equalTo(bottomView);
        }];
        
        UIImageView *imageV = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:images[i]]];
        [view addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view);
            make.width.height.mas_equalTo(30);
            make.top.mas_equalTo(view).offset(0);
        }];
        
        UILabel *label = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:13 weight:.1] textColor:BYBTEXTColor1 text:titles[i] textAlignment:NSTextAlignmentCenter];
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view);
            make.top.mas_equalTo(imageV.mas_bottom).offset(10);
        }];
        
        if (i < 3) {
            UIView *lineView = [[UIView alloc]init];
            lineView.backgroundColor = BYBTEXTColor0;
            [view addSubview:lineView];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(view);
                make.width.mas_equalTo(0.5);
                make.right.mas_equalTo(view.mas_right).offset(0);
                make.height.mas_equalTo(view.mas_height);
            }];
        }
        
        
    }
    
    [bottomView masonry_distributeSpacingHorizontallyWith:imageViews];
    
    
}


- (void)setModel:(BYBGoodDetailGetInfoDataModel *)model{
    _model = model;
    
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:model.result.strMainImage] placeholderImage:BYB_PlaceholderImage];
    self.desLabel.text = model.result.strInfoTitle;
    self.nickNameLabel.text = model.result.user.strNickname;
    self.timeLabel.text = model.result.dtUpdateTime;
    self.priceLabel.text = model.result.decMinPriceRMB;
    
}






@end

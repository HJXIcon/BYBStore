//
//  BYBGoodDetailsCell2.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/29.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsCell2.h"

@interface BYBGoodDetailsCell2BtnView : UIView
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, copy) void(^tapBlock)();
@end

@implementation BYBGoodDetailsCell2BtnView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = .25;
        self.layer.borderColor = BYBTEXTColor0.CGColor;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)setupUI{
    self.label = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:.1] textColor:BYBTEXTColor1 text:@"退换货规则" textAlignment:0];
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
    
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:nil];
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(10);
        make.right.mas_equalTo(self.label.mas_left).offset(-5);
    }];
    
    
}

- (void)tapAction{
    if (self.tapBlock) {
        self.tapBlock();
    }
}
@end

@interface BYBGoodDetailsCell2 ()

@property (nonatomic, strong) UIButton *allGoodsBtn;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) BYBGoodDetailsCell2BtnView *btbView1;
@property (nonatomic, strong) BYBGoodDetailsCell2BtnView *btbView2;
@end
@implementation BYBGoodDetailsCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupUI{
    
    self.countryImageView = [JXFactoryTool creatImageView:CGRectZero image:nil];
    [self.contentView addSubview:self.countryImageView];
    [self.countryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(15);
        make.width.height.mas_equalTo(15);
    }];
    
    
    self.branLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:13 weight:.3] textColor:nil text:@"mybag" textAlignment:0];
    [self.contentView addSubview:self.branLabel];
    [self.branLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.countryImageView.mas_right).offset(5);
        make.centerY.mas_equalTo(self.countryImageView);
    }];
    
    self.arrowImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_ArrowImage];
    [self.contentView addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(self.countryImageView);
    }];
    
    self.allGoodsBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont systemFontOfSize:13 weight:.3] normalColor:BYBTEXTColor1 selectColor:nil title:@"全部商品" nornamlImageName:nil selectImageName:nil textAlignment:0 target:self action:@selector(allGoodsAction)];
    [self.contentView addSubview:self.allGoodsBtn];
    [self.allGoodsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.arrowImageView);
        make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-10);
    }];
    
    
    CGFloat W = 130;
    CGFloat H = 30;
    CGFloat margin = (kScreenW - 2 * W - 30) * 0.5;
    self.btbView1 = [[BYBGoodDetailsCell2BtnView alloc]init];
    self.btbView1.label.text = @"退换货规则";
    self.btbView1.imageView.image = [UIImage imageNamed:@"icon_tui_infodetail_30x30_"];
    [self.btbView1 setTapBlock:^{
        
    }];
    [self.contentView addSubview:self.btbView1];
    [self.btbView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(margin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-20);
        make.height.mas_equalTo(H);
        make.width.mas_equalTo(W);
    }];
    
    
    
    self.btbView2 = [[BYBGoodDetailsCell2BtnView alloc]init];
    self.btbView2.label.text = @"本商品官网链接";
    self.btbView2.imageView.image = [UIImage imageNamed:@"icon_lianjie_infodetail_30x30_"];
    [self.btbView2 setTapBlock:^{
        
    }];
    [self.contentView addSubview:self.btbView2];
    [self.btbView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.btbView1.mas_right).offset(30);
        make.centerY.mas_equalTo(self.btbView1);
        make.height.mas_equalTo(H);
        make.width.mas_equalTo(W);
    }];
    
}


- (void)allGoodsAction{
    
}

@end

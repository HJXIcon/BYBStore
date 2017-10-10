//
//  BYBGoodDetailBottomView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailBottomView.h"
#import "JXRelayoutButton.h"
#import "JXEmitterButton.h"
@interface BYBGoodDetailBottomView ()

@property (nonatomic, strong) JXRelayoutButton *likeBtn;
@property (nonatomic, strong) JXEmitterButton *colletBtn;
@property (nonatomic, strong) JXRelayoutButton *shopCarBtn;
@property (nonatomic, strong) UIButton *enterShopCarBtn;
@property (nonatomic, strong) UIButton *buyNowBtn;

@end
@implementation BYBGoodDetailBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    UIView *btnView = [[UIView alloc]init];
    [self addSubview:btnView];
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(self.width * 0.5);
        
    }];
    
    self.likeBtn = [[JXRelayoutButton alloc]init];
    [self.likeBtn addTarget:self action:@selector(likeAction:) forControlEvents:UIControlEventTouchUpInside];
    self.likeBtn.imageSize = CGSizeMake(25, 25);
    self.likeBtn.jx_type = JXRelayoutButtonTypeBottom;
    self.likeBtn.titleLabel.font = [UIFont systemFontOfSize:10 weight:.2];
    [self.likeBtn setTitle:@"点赞20" forState:UIControlStateNormal];
    [self.likeBtn setImage:[UIImage imageNamed:@"yellow_good_25x25_"] forState:UIControlStateSelected];
    [self.likeBtn setImage:[UIImage imageNamed:@"grey_good_24x24_"] forState:UIControlStateNormal];
    [self.likeBtn setTitleColor:BYBTEXTColor2 forState:UIControlStateNormal];
    [btnView addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(50);
    }];
    
    
    self.colletBtn = [[JXEmitterButton alloc]initWithType:WButtonTypeImageUp spacing:10];
    [self.colletBtn addTarget:self action:@selector(colletAction:) forControlEvents:UIControlEventTouchUpInside];
    self.colletBtn.titleLabel.font = [UIFont systemFontOfSize:10 weight:.2];
    [self.colletBtn setTitleColor:BYBTEXTColor2 forState:UIControlStateNormal];
    [self.colletBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [self.colletBtn setImage:[UIImage imageNamed:@"shoucang_yellow_20x20_"] forState:UIControlStateSelected];
    [self.colletBtn setImage:[UIImage imageNamed:@"shoucang_gray_20x20_"] forState:UIControlStateNormal];
    [btnView addSubview:self.colletBtn];
    [self.colletBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(50);
    }];
    
    
    self.shopCarBtn = [[JXRelayoutButton alloc]init];
    [self.shopCarBtn addTarget:self action:@selector(shopAction) forControlEvents:UIControlEventTouchUpInside];
    self.shopCarBtn.imageSize = CGSizeMake(25, 25);
    self.shopCarBtn.jx_type = JXRelayoutButtonTypeBottom;
    self.shopCarBtn.titleLabel.font = [UIFont systemFontOfSize:10 weight:.2];
    [self.shopCarBtn setTitleColor:BYBTEXTColor2 forState:UIControlStateNormal];
    [self.shopCarBtn setTitle:@"购物车" forState:UIControlStateNormal];
    [self.shopCarBtn setImage:[UIImage imageNamed:@"newgouwuche_25x25_"] forState:UIControlStateSelected];
    [self.shopCarBtn setImage:[UIImage imageNamed:@"newgouwuche_25x25_"] forState:UIControlStateNormal];
    [btnView addSubview:self.shopCarBtn];
    [self.shopCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(50);
    }];
    
    [btnView masonry_distributeSpacingHorizontallyWith:@[self.likeBtn,self.colletBtn,self.shopCarBtn]];
    
    
    /// 加入购物车
    self.enterShopCarBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont systemFontOfSize:16 weight:.2] normalColor:[UIColor whiteColor] selectColor:nil title:@"加入购物车" nornamlImageName:nil selectImageName:nil textAlignment:NSTextAlignmentCenter target:self action:@selector(enterShopCarAction)];
    self.enterShopCarBtn.backgroundColor = [UIColor colorWithHexString:@"0xf5ab50"];
    [self addSubview:self.enterShopCarBtn];
    [self.enterShopCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(btnView);
        make.left.mas_equalTo(btnView.mas_right);
        make.width.mas_equalTo(self.width * 0.25);
    }];
    
    /// 立即购买
    self.buyNowBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont systemFontOfSize:16 weight:.2] normalColor:[UIColor whiteColor] selectColor:nil title:@"立即购买" nornamlImageName:nil selectImageName:nil textAlignment:NSTextAlignmentCenter target:self action:@selector(buyNowAction)];
    self.buyNowBtn.backgroundColor = [UIColor colorWithHexString:@"0xbf2332"];
    [self addSubview:self.buyNowBtn];
    [self.buyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(btnView);
        make.left.mas_equalTo(self.enterShopCarBtn.mas_right);
        make.width.mas_equalTo(self.width * 0.25);
    }];
    
}

#pragma mark - Actions
- (void)buyNowAction{
    
}
- (void)enterShopCarAction{
    
}

- (void)likeAction:(UIButton *)button{
    button.selected = YES;
}

- (void)colletAction:(UIButton *)button{
    button.selected = !button.selected;
}

- (void)shopAction{
    
}

@end

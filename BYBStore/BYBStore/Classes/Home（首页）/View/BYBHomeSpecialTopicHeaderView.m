//
//  BYBHomeSpecialTopicHeaderView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeSpecialTopicHeaderView.h"

@interface BYBHomeSpecialTopicHeaderView ()
/** 热门*/
@property (nonatomic, strong) UIButton *hotBtn;
/** 品牌*/
@property (nonatomic, strong) UIButton *branBtn;
@property (nonatomic, copy) void(^selectBlock)(NSInteger);
@end
@implementation BYBHomeSpecialTopicHeaderView

+ (instancetype)headderView:(void(^)(NSInteger))selectBlock{
    BYBHomeSpecialTopicHeaderView *header = [[BYBHomeSpecialTopicHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 80)];
    header.selectBlock = selectBlock;
    
    return header;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    
    self.hotBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont boldSystemFontOfSize:16] normalColor:[UIColor blackColor] selectColor:[UIColor whiteColor] title:@"热门专场" nornamlImageName:nil selectImageName:nil textAlignment:0 target:self action:@selector(hotAction:)];
    [self addSubview:self.hotBtn];
    
    CGFloat btnW = (self.width - 15 * 3) / 2;
    CGFloat btnH = 44;
    [self.hotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(btnW, btnH));
        make.centerY.mas_equalTo(self);
    }];
    
    
    self.branBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont boldSystemFontOfSize:16] normalColor:[UIColor blackColor] selectColor:[UIColor whiteColor] title:@"品牌专场" nornamlImageName:nil selectImageName:nil textAlignment:0 target:self action:@selector(branAction:)];
    [self addSubview:self.branBtn];
    [self.branBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(btnW, btnH));
        make.centerY.mas_equalTo(self);
    }];
    
    [self.hotBtn setBackgroundImage:[UIImage imageWithColor:BYBThemeColor] forState:UIControlStateSelected];
    [self.hotBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self.branBtn setBackgroundImage:[UIImage imageWithColor:BYBThemeColor] forState:UIControlStateSelected];
    [self.branBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    
    self.hotBtn.layer.cornerRadius = btnH * 0.5;
    self.hotBtn.layer.masksToBounds = YES;
    self.branBtn.layer.cornerRadius = btnH * 0.5;
    self.branBtn.layer.masksToBounds = YES;
    
    self.hotBtn.layer.borderWidth = 1;
    self.hotBtn.layer.borderColor = BYBBGColor.CGColor;
    self.branBtn.layer.borderWidth = 1;
    self.branBtn.layer.borderColor = BYBBGColor.CGColor;
    
    self.hotBtn.selected = YES;
    
    [self masonry_distributeSpacingHorizontallyWith:@[self.hotBtn,self.branBtn]];
    
}


- (void)hotAction:(UIButton *)button{
    self.branBtn.selected = NO;
    button.selected = !button.selected;
    
    if (self.selectBlock) {
        self.selectBlock(0);
    }
}

- (void)branAction:(UIButton *)button{
    self.hotBtn.selected = NO;
    button.selected = !button.selected;
    
    if (self.selectBlock) {
        self.selectBlock(1);
    }
}
@end

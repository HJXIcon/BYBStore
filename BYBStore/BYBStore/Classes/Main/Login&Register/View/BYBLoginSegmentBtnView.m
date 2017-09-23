//
//  BYBLoginSegmentBtnView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBLoginSegmentBtnView.h"
#import "JXRelayoutButton.h"


@interface BYBLoginSegmentBtnView ()

@property(nonatomic, strong) NSMutableArray *btnArray;
@property(nonatomic, strong) UIButton *selectBtn;
@end
@implementation BYBLoginSegmentBtnView
- (NSMutableArray *)btnArray{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    NSArray *titles = @[@"手机登录",@"账号登录"];
    
    for (int i = 0; i < 2; ++i) {
        JXRelayoutButton *btn = [JXRelayoutButton buttonWithType:UIButtonTypeCustom];
        btn.imageSize = CGSizeMake(self.width * 0.5, 1);
        btn.jx_type = JXRelayoutButtonTypeTop;
        [btn setImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageWithColor:BYBThemeColor] forState:UIControlStateSelected];
         [btn setImage:[UIImage imageWithColor:BYBThemeColor] forState:UIControlStateHighlighted];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:BYBThemeColor forState:UIControlStateSelected];
        [btn setTitleColor:BYBThemeColor forState:UIControlStateHighlighted];
        btn.adjustsImageWhenHighlighted = NO;
        btn.tag = 100 + i;
        if (i == 0) {
            btn.selected = YES;
            self.selectBtn = btn;
        }
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArray addObject:btn];
        [self addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)button{
    if (self.selectBtn == button) {
        return;
    }
    self.selectBtn.selected = NO;
    button.selected = YES;
    self.selectBtn = button;
    
    if (self.selectBlock) {
        self.selectBlock(button.tag - 100);
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnW = self.width * 0.5;
    
    [self.btnArray enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(btnW * idx, 0, btnW, self.height);
    }];
}

@end

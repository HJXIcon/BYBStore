//
//  BYBCategoryTitleView.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategoryTitleView.h"


@interface BYBCategoryTitleView (){
    NSInteger currentIndex;
    
}
@property (nonatomic, strong) NSArray <NSString *>*titles;
@property (nonatomic, strong) NSMutableArray <UILabel *>*titleLabels;
@property (nonatomic, strong) UIView *bottomLine;
@end
@implementation BYBCategoryTitleView
#pragma mark - lazy load
- (UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = BYBThemeColor;
    }
    return _bottomLine;
}


- (NSMutableArray<UILabel *> *)titleLabels{
    if (_titleLabels == nil) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titles = @[@"分类",@"品牌",@"榜单"];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self setupTitlesLabel];
    [self setupBottomLine];
}

- (void)setupBottomLine{
    [self addSubview:self.bottomLine];
}

- (void)setupTitlesLabel{
    
    for (int i = 0; i < self.titles.count; i ++) {
        UILabel *label = [[UILabel alloc]init];
        label.tag = i;
        label.userInteractionEnabled = YES;
        label.text = self.titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = i == 0 ? BYBThemeColor : [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16 weight:.3];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleLabelClick:)];
        [label addGestureRecognizer:tap];
        
        [self.titleLabels addObject:label];
        [self addSubview:label];
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    // 2.设置Label的frame
    CGFloat labelH = self.height;
    CGFloat labelW = 50;
    CGFloat labelX = (self.bounds.size.width - labelW * 3) / 2;
    CGFloat labelY = 0;
    
    for (int i = 0; i < self.titleLabels.count; i ++) {
        self.titleLabels[i].frame = CGRectMake(labelX, labelY, labelW, labelH);
        labelX = labelX + labelW;
        
    }
    
    CGRect frame = self.titleLabels.firstObject.frame;
    frame.size.height = 1;
    frame.origin.y = self.height - 1;
    self.bottomLine.frame = frame;
    
}

#pragma mark - Public Method
- (void)titleClick:(NSInteger)index{
    UILabel *label = self.titleLabels[index];
    [self titleLabelClick:label.gestureRecognizers.firstObject];
}

#pragma mark - tapAction
- (void)titleLabelClick:(UITapGestureRecognizer *)tap{
    
    UIView *view = tap.view;
    if (![view isKindOfClass:[UILabel class]]) {
        return;
    }
    
    UILabel *targetLabel = (UILabel *)tap.view;
    
    //0.判断是不是之前点击的label
    if (targetLabel.tag == currentIndex) {
        return;
    }
    
    
    // 1.让之前的label不选中，现在的选中
    
    UILabel *sourceLabel = self.titleLabels[currentIndex];
    targetLabel.textColor = BYBThemeColor;
    sourceLabel.textColor = [UIColor blackColor];
    currentIndex = targetLabel.tag;
    
    // 3.通知代理
    if (self.delegate && [self.delegate respondsToSelector:@selector(titleView:targetIndex:)]) {
        
        [self.delegate titleView:self targetIndex:currentIndex];
    }
    
    // 4.调整bottomLine的位置
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.bottomLine.frame;
        
        frame.origin.x = targetLabel.frame.origin.x;
        frame.size.width = targetLabel.frame.size.width;
        
        self.bottomLine.frame = frame;
    }];
    
}




@end

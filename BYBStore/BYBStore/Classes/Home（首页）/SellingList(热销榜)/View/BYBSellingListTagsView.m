//
//  BYBSellingListTagsView.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSellingListTagsView.h"
#import "JXTagsView.h"

@interface BYBSellingListTagsView ()

@property (nonatomic, strong) UIView *shadeView;
@property (nonatomic, strong) JXTagsView *tagsView;
@property (nonatomic, strong) JXTagsCollectionViewFlowLayout *layout;
@property (nonatomic, strong) JXTagsAttribute *attribute;
@end
@implementation BYBSellingListTagsView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    self.shadeView = [[UIView alloc]initWithFrame:self.bounds];
    self.shadeView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.18f];
    [self addSubview:self.shadeView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.shadeView addGestureRecognizer:tap];
    
    
    // tagsView
    self.tagsView = [[JXTagsView alloc]init];
    _attribute = [[JXTagsAttribute alloc]init];
    _attribute.normalTextColor = BYBTEXTColor2;
    _attribute.selectedTextColor = BYBThemeColor;
    _attribute.tagPadding = 20;
    self.tagsView.isMultiSelect = NO;
    self.tagsView.tagAttribute = _attribute;
    _layout = [[JXTagsCollectionViewFlowLayout alloc]init];
    _layout.minimumInteritemSpacing = 30;
    self.tagsView.layout = _layout;
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    MJWeakSelf;
    [self.tagsView setCompletion:^(NSArray <NSString *> *selectArray,NSInteger index){
        if (weakSelf.selectBlock) {
            weakSelf.selectBlock(index);
        }
    }];
    
    self.tagsView.backgroundColor = [UIColor colorWithWhite:1.f alpha:0.48f];

    [self addSubview:self.tagsView];
    
}

- (void)tap{
    if (self.removeBlock) {
        self.removeBlock();
    }
}


- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    self.tagsView.selectIndex = selectIndex;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.shadeView.frame = CGRectMake(0, 0, self.width, self.height);
    self.tagsView.tagsArray = self.tagsArray;
    CGFloat height = [JXTagsView getHeightWithTags:self.tagsArray layout:_layout tagAttribute:_attribute maxWidth:self.bounds.size.width];
    
    __weak typeof(self) weakSelf = self;
    [self.tagsView setTagsFrameUpdateBlock:^(CGFloat height){
        
        weakSelf.tagsView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width, height);
        [weakSelf layoutIfNeeded];
    }];
    self.tagsView.frame = CGRectMake(0, 0, self.width, height);
}
@end

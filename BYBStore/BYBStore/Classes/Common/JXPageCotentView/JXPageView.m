//
//  JXPageView.m
//  JXShopDetailDemo
//
//  Created by mac on 17/8/3.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import "JXPageView.h"

@interface JXPageView ()
@property (nonatomic, weak) JXTitleView *titleView;
@end
@implementation JXPageView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray <NSString *>*)titles
                        style:(JXPageStyle *)style
                     childVcs:(NSArray <UIViewController *>*)childVcs
                     parentVc:(UIViewController *)parentVc{
    
    self.titles = titles;
    self.style = style;
    self.childVcs = childVcs;
    self.parentVc = parentVc;
    
    return [self initWithFrame:frame];
}

- (void)dealloc{
    JXLog(@"pageView --- dealloc");
}


- (void)setupUI{
    // 1.创建titleView
    CGRect titleFrame = CGRectMake(0, 0, self.bounds.size.width, self.style.titleHeight);
    
    JXTitleView *titleView = [[JXTitleView alloc]initWithFrame:titleFrame titles:self.titles style:self.style];
    _titleView = titleView;
    [self addSubview:titleView];
    
    // 2.创建contentView
    CGRect contentViewFram = CGRectMake(0, CGRectGetMaxY(titleView.frame), self.bounds.size.width, self.bounds.size.height - CGRectGetMaxY(titleView.frame));
    JXPageContentView *contentView = [[JXPageContentView alloc]initWithFrame:contentViewFram childVcs:self.childVcs parentVc:self.parentVc];
    [self addSubview:contentView];

    
    // 3.让titleView跟contentView沟通
    titleView.delegate = contentView;
    contentView.delegate = titleView;
    
    // 注意内存泄漏
    __weak typeof(self) weakSelf = self;
    titleView.didEndScrollBlock = ^(NSInteger index) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(pageViewDidEndScroll:indx:)]) {
            [weakSelf.delegate pageViewDidEndScroll:weakSelf indx:index];
        }
    };
    
    contentView.didEndScrollBlock = ^(NSInteger index) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(pageViewDidEndScroll:indx:)]) {
            [weakSelf.delegate pageViewDidEndScroll:weakSelf indx:index];
            
        }
    };
    
}

#pragma mark - Public Method
/**
 新增:主动点击某一个label
 @param indx label的indx
 */
- (void)titleLabelClick:(NSInteger)indx{
    [_titleView titleClick:indx];
}


@end

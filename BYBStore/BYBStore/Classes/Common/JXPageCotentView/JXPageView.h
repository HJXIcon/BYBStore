//
//  JXPageView.h
//  JXShopDetailDemo
//
//  Created by mac on 17/8/3.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPageContentView.h"
#import "JXPageStyle.h"
#import "UIColor+pageExtension.h"
#import "JXTitleView.h"


@class JXPageView;
@protocol JXPageViewDelegate <NSObject>

@optional

/**
 当滚动结束到indx或者点击indx的时候调用
 */
- (void)pageViewDidEndScroll:(JXPageView *)pageView indx:(NSInteger)indx;

@end

@interface JXPageView : UIView

@property(nonatomic, strong) NSArray <NSString *>*titles;
@property(nonatomic, strong) JXPageStyle *style;
@property(nonatomic, strong) NSArray <UIViewController *>*childVcs;
// 注意使用weak，否则造成循环引用
@property(nonatomic, weak) UIViewController *parentVc;


- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray <NSString *>*)titles
                        style:(JXPageStyle *)style
                     childVcs:(NSArray <UIViewController *>*)childVcs
                     parentVc:(UIViewController *)parentVc;


#pragma mark - *** 新增:
/**
 主动点击某一个label
 @param indx label的indx
 */
- (void)titleLabelClick:(NSInteger)indx;

/** delegate*/
@property (nonatomic, weak) id<JXPageViewDelegate> delegate;
@end

//
//  JXTitleView.h
//  JXShopDetailDemo
//
//  Created by mac on 17/8/3.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPageStyle.h"
#import "JXPageViewProtocol.h"


@interface JXTitleView : UIView<JXPageContentViewDelegate>

@property(nonatomic, strong) NSArray <NSString *>*titles;
@property(nonatomic, strong) JXPageStyle *style;
#pragma mark - 新增
@property (nonatomic, copy) void(^didEndScrollBlock)(NSInteger);

/** delegate*/
@property (nonatomic, weak)id<JXTitleViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray <NSString *>*)titles style:(JXPageStyle *)style;

#pragma mark - *** 新增:
/**
 主动点击某一个label
 @param indx label的indx
 */
- (void)titleClick:(NSInteger)indx;
@end

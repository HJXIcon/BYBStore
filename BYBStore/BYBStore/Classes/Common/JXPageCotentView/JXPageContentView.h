//
//  JXPageContentView.h
//  JXShopDetailDemo
//
//  Created by mac on 17/8/3.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPageViewProtocol.h"

@interface JXPageContentView : UIView<JXTitleViewDelegate>
@property(nonatomic, strong)NSArray <UIViewController *>*childVcs;
// 注意使用weak，否则造成循环引用
@property(nonatomic, weak)UIViewController *parentVc;
@property(nonatomic, weak) id<JXPageContentViewDelegate>delegate;


- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray <UIViewController *>*)childVcs parentVc:(UIViewController *)parentVc;


#pragma mark - 新增
@property (nonatomic, copy) void(^didEndScrollBlock)(NSInteger);

@end

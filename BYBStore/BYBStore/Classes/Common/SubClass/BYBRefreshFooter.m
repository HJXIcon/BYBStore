//
//  BYBRefreshFooter.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBRefreshFooter.h"

@implementation BYBRefreshFooter
#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=50; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading (%ld)_32x32_", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages duration:1.0 forState:MJRefreshStateRefreshing];
}

@end

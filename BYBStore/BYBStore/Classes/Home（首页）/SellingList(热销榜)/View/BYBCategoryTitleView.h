//
//  BYBCategoryTitleView.h
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseView.h"

@class BYBCategoryTitleView;
@protocol BYBCategoryTitleViewDelegate <NSObject>
- (void)titleView:(BYBCategoryTitleView *)titleView targetIndex:(NSInteger)targetIndex;

@end
@interface BYBCategoryTitleView : BYBBaseView

@property (nonatomic, weak) id<BYBCategoryTitleViewDelegate> delegate;
- (void)titleClick:(NSInteger)index;
@end

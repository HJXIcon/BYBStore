//
//  BYBSearchBarView.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/26.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BYBSearchBarViewStyleHome,
    BYBSearchBarViewStyleCategory,
} BYBSearchBarViewStyle;

@interface BYBSearchBarView : UIView
@property (nonatomic, copy) void(^msgBlock)();
@property (nonatomic, copy) void(^searchBlock)();
@property (nonatomic, copy) void(^cacelSearchBlock)();
@property (nonatomic, assign) BYBSearchBarViewStyle style;
// 如需要重新布局
- (void)cancel;
@end

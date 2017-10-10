//
//  JXEmitterButton.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/10.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JXEmitterButtonType) {
    WButtonTypeImageUp = 0,        // 图片在上
    WButtonTypeImageDown = 1,      // 图片在下
    BWButtonTypeImageLeft = 2,      // 图片在左边
    WButtonTypeImageRight = 3,     // 图片在右边
};

@interface JXEmitterButton : UIButton

/**
 *  初始化方法
 *
 *  @param type 类型
 *  @param spacing 间距
 *
 *  @return 实例对象
 */
- (instancetype)initWithType:(JXEmitterButtonType)type spacing:(CGFloat)spacing;

@end

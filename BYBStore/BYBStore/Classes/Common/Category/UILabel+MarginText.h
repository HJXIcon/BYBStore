//
//  UILabel+MarginText.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MarginText)

/**
 设置行间距文本

 @param text 文本
 @param lineSpacing 行间距距离
 */
- (void)setMarginText:(NSString *)text LineSpacing:(CGFloat)lineSpacing;
@end

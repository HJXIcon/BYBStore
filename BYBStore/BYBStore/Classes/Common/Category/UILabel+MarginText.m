//
//  UILabel+MarginText.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "UILabel+MarginText.h"

@implementation UILabel (MarginText)

- (void)setMarginText:(NSString *)text LineSpacing:(CGFloat)lineSpacing{
    if (text.length == 0) {
         NSAssert(text.length, @"text must not nil");
    }
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:lineSpacing];
    [attri addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [self setAttributedText:attri];
}

@end

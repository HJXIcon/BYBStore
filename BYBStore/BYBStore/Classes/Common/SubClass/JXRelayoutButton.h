//
//  JXRelayoutButton.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JXRelayoutButtonType) {
    JXRelayoutButtonTypeNomal  = 0,//默认
    JXRelayoutButtonTypeLeft   = 1,//标题在左
    JXRelayoutButtonTypeBottom = 2,//标题在下
    JXRelayoutButtonTypeTop    = 3,//标题在上
};

@interface JXRelayoutButton : UIButton

///图片大小
@property (assign,nonatomic)IBInspectable CGSize imageSize;
///图片相对于 top/right 的 offset
@property (assign,nonatomic)IBInspectable CGFloat offset;

@property (assign,nonatomic)IBInspectable JXRelayoutButtonType jx_type;

@end

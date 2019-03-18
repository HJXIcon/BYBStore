//
//  BYBGoodDetailBottomView.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseView.h"

@interface BYBGoodDetailBottomView : BYBBaseView
@property (nonatomic, copy) void(^shopCartBlock)(void);
@property (nonatomic, copy) void(^addShopCartBlock)(void);
@property (nonatomic, copy) void(^buyNowBlock)(void);
@end

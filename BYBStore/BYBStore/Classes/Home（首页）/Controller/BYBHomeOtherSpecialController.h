//
//  BYBHomeOtherSpecialController.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseCollectionViewController.h"

typedef enum : NSUInteger {
    BYBHomeSpecialFuShi,
    BYBHomeSpecialMeiZhuang,
    BYBHomeSpecialMuYing,
    BYBHomeSpecialQingShe,
    BYBHomeSpecialBaiHuo,
    BYBHomeSpecialMeiShi,
    BYBHomeSpecialYunDong,
    BYBHomeSpecialRiTao,
    BYBHomeSpecialMeiTao,
    BYBHomeSpecialChangXiaoBang,
} BYBHomeSpecial;
/**
 除了专题以外的类别
 */
@interface BYBHomeOtherSpecialController : BYBBaseCollectionViewController

@property (nonatomic, assign) BYBHomeSpecial special;

@end

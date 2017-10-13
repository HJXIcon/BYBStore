//
//  BYBSellingListCategoryController.h
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseTableViewController.h"

typedef enum : NSUInteger {
    BYBSellingListZhongBiao,
    BYBSellingListNvBao,
    BYBSellingListFuShiXieBao,
    BYBSellingListGeHuMeiZhuang,
    BYBSellingListMuYingYongPin,
    BYBSellingListShiPinBaoJian,
    BYBSellingListRiYongBaiHuo,
    BYBSellingListYunDongHuWai,
    BYBSellingListZhongBiaoShouShi,
    BYBSellingListJiaYongDianQi,
} BYBSellingListType;

@interface BYBSellingListCategoryController : BYBBaseTableViewController

@property (nonatomic, assign) BYBSellingListType  type;
@end

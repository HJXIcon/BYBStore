//
//  BYBGoodDetailModel.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailModel.h"
//// ----- BYBGoodDetailGetInfoDataModel ------ ////
@implementation BYBGoodDetailGetInfoDataModel


@end
//// ----- BYBGoodDetailGetInfoBrandDataModel ------ ////
@implementation BYBGoodDetailGetInfoBrandDataModel

@end
//// ----- BYBGoodDetailGetShareShoppingInfoListByInfoIDModel ------ ////
@implementation BYBGoodDetailGetShareShoppingInfoListByInfoIDModel

@end
//// ----- BYBGoodDetailGetInfoReviewModel ------ ////
@implementation BYBGoodDetailGetInfoReviewModel

@end

//// ----- BYBGoodDetailModel ------ ////
@implementation BYBGoodDetailModel

// 还是在mj_replacedKeyFromPropertyName中关联, 你只需要将 key 用.连接起来就行了
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             // 模型属性: JSON key, MJExtension 会自动将 JSON 的 key 替换为你模型中需要的属性
             @"GetInfoBrandData":@"GetInfoBrandData.result",
             @"GetShareShoppingInfoListByInfoID":@"GetShareShoppingInfoListByInfoID.result",
             @"GetInfoReview":@"GetInfoReview.result",
             @"GetOrdersCommodityReviewCountByInfoID":@"GetOrdersCommodityReviewCountByInfoID.result",
             @"ImageaCount":@"ImageaCount.ImageaCountResult"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"GetShareShoppingInfoListByInfoID":@"BYBGoodDetailGetShareShoppingInfoListByInfoIDModel",
             @"GetInfoReviewModel" : @"BYBGoodDetailGetInfoReviewModel"
             };
}

@end

//
//  BYBHomeBrandModel.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBrandModel.h"

@implementation BYBHomeBrandModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"listRecommendInfo":[BYBHomeBrandListRecommendModel class]
             };
}
@end


@implementation BYBHomeBrandListRecommendModel

@end


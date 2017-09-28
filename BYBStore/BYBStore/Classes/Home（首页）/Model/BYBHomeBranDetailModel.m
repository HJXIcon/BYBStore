//
//  BYBHomeBranDetailModel.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBranDetailModel.h"

@implementation BYBHomeBranDetailModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"listRecommendInfo":@"BYBHomeBrandListRecommendModel"
             };
}

- (void)setStrBrandContent:(NSString *)strBrandContent{
    _strBrandContent = strBrandContent;
    
    self.cellHeight = [self.strBrandContent sizeWithFont:[UIFont systemFontOfSize:15 weight:.2] andMaxSize:CGSizeMake(kScreenW - 37 * 2, MAXFLOAT) lineSpacing:10].height + 250;
}

@end

//
//  BYBHomeHotDetailModel.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeHotDetailModel.h"
#import "BYBHomeBrandModel.h"

@implementation BYBHomeHotDetailModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"listRecommendInfo":@"BYBHomeBrandListRecommendModel"
             };
}

- (void)setStrSpecialContent:(NSString *)strSpecialContent{
    _strSpecialContent = strSpecialContent;
    
    self.cellHeight = [strSpecialContent sizeWithFont:[UIFont systemFontOfSize:15 weight:.2] andMaxSize:CGSizeMake(kScreenW - 37 * 2, MAXFLOAT) lineSpacing:10].height + 250;
}


@end

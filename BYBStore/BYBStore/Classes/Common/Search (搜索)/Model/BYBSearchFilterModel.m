//
//  BYBSearchFilterModel.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/26.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchFilterModel.h"
#import "BYBSearchFilterListModel.h"
@implementation BYBSearchFilterModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"ListHotTag":@"BYBSearchFilterListModel"
             };
}
@end

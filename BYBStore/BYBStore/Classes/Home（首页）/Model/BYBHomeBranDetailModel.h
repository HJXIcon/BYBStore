//
//  BYBHomeBranDetailModel.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYBHomeBrandModel.h"

@interface BYBHomeBranDetailModel : NSObject
@property (nonatomic, strong) NSString *iBrandExclusiveID;
@property (nonatomic, strong) NSString *strBrandExclusiveTitle;
@property (nonatomic, strong) NSString *strBandUrl;
@property (nonatomic, strong) NSString *strBrandName;
@property (nonatomic, strong) NSString *strBrandImage;
@property (nonatomic, strong) NSString *strBrandContent;
@property (nonatomic, strong) NSString *strBrandDetailImage;
@property (nonatomic, strong) NSString *btBrandExclusiveType;
@property (nonatomic, strong) NSString *productShowType;
@property (nonatomic, strong) NSArray *brandCatList;
@property (nonatomic, strong) NSArray <BYBHomeBrandListRecommendModel*>*listRecommendInfo;
@property (nonatomic, strong) NSString *maxPage;
@property (nonatomic, strong) NSString *pageIndex;

/// 添加
/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end

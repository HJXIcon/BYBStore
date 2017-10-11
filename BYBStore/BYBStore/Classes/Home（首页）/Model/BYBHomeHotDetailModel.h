//
//  BYBHomeHotDetailModel.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BYBHomeBrandListRecommendModel;
@interface BYBHomeHotDetailModel : NSObject
@property (nonatomic, strong) NSString *iSpecialID;
@property (nonatomic, strong) NSString *strSpecialName;
@property (nonatomic, strong) NSString *strSpecialImage;
@property (nonatomic, strong) NSString *strSpecialDetailImage;
@property (nonatomic, strong) NSString *strSpecialIcon;
@property (nonatomic, strong) NSString *strSpecialContent;
@property (nonatomic, strong) NSString *strSpecialUrl;
@property (nonatomic, strong) NSString *iParentSpecialID;
@property (nonatomic, strong) NSString *strParentSpecialName;
@property (nonatomic, strong) NSString *btSpecialType;
@property (nonatomic, strong) NSArray <BYBHomeBrandListRecommendModel*>*listRecommendInfo;
@property (nonatomic, strong) NSString *maxPage;
@property (nonatomic, strong) NSString *pageIndex;

/// 添加
/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@end

//
//  BYBHomeBrandModel.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBHomeBrandListRecommendModel : NSObject
@property (nonatomic, strong) NSString *iInfoID;
@property (nonatomic, strong) NSString *strInfoTitle;
@property (nonatomic, strong) NSString *strCommodityPrice;
@property (nonatomic, strong) NSString *decOrginalPrice;
@property (nonatomic, strong) NSString *decMaxPrice;
@property (nonatomic, strong) NSString *decMinPrice;
@property (nonatomic, strong) NSString *decOrginalPriceRMB;
@property (nonatomic, strong) NSString *decMaxPriceRMB;
@property (nonatomic, strong) NSString *decMinPriceRMB;
@property (nonatomic, strong) NSString *strMainImage;
@property (nonatomic, strong) NSString *iIsGood;
@property (nonatomic, strong) NSString *iIsBad;
@property (nonatomic, strong) NSString *iInfoCollection;
@property (nonatomic, strong) NSString *iInfoReview;
@property (nonatomic, strong) NSString *strInfoUrl;
@property (nonatomic, strong) NSString *infoType;
@property (nonatomic, strong) NSString *dtInfoTime;
@property (nonatomic, strong) NSString *dtUpdateTime;
@property (nonatomic, strong) NSString *btSaleStatus;
@property (nonatomic, strong) NSString *BrandLogo;
@property (nonatomic, strong) NSString *iHitCount;
@property (nonatomic, strong) NSString *homeShow;
@property (nonatomic, strong) NSString *isTop;
@property (nonatomic, strong) NSString *iCurrency;
@property (nonatomic, strong) NSString *btCountry;
@property (nonatomic, strong) NSString *iIsPurchasing;
@property (nonatomic, strong) NSString *countrySmallIcon;
@property (nonatomic, strong) NSString *countryBigIcon;
@property (nonatomic, strong) NSString *isDecline;
@property (nonatomic, strong) NSString *declinePercent;
@property (nonatomic, strong) NSString *fontType;
@property (nonatomic, strong) NSString *showColor;
@property (nonatomic, strong) NSDictionary *mall;
@end


@interface BYBHomeBrandModel : NSObject
@property (nonatomic, strong) NSString *iBrandExclusiveID;
@property (nonatomic, strong) NSString *strBrandExclusiveTitle;
@property (nonatomic, strong) NSString *strBandUrl;
@property (nonatomic, strong) NSString *strBrandName;
@property (nonatomic, strong) NSString *strBrandImage;
@property (nonatomic, strong) NSString *strBrandContent;
@property (nonatomic, strong) NSArray<BYBHomeBrandListRecommendModel *> *listRecommendInfo;

@end




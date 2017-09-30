//
//  BYBGoodDetailModel.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYBUserModel.h"

//// ---- GetInfoData ----- ////
@interface BYBGoodDetailGetInfoDataModel : NSObject
@property (nonatomic, strong) NSString *iInfoID;
@property (nonatomic, strong) NSString *strInfoTitle;
@property (nonatomic, strong) BYBUserModel *user;
@property (nonatomic, strong) NSString *strEditorRemark;
@property (nonatomic, strong) NSDictionary *editor;
@property (nonatomic, strong) NSString *strCommodityPrice;
@property (nonatomic, strong) NSString *decOrginalPrice;
@property (nonatomic, strong) NSString *decMaxPrice;
@property (nonatomic, strong) NSString *decMinPrice;
@property (nonatomic, strong) NSString *decOrginalPriceRMB;
@property (nonatomic, strong) NSString *decMaxPriceRMB;
@property (nonatomic, strong) NSString *decMinPriceRMB;
@property (nonatomic, strong) NSString *strImageArray;
@property (nonatomic, strong) NSString *strMainImage;
@property (nonatomic, strong) NSString *strInfoContent;
@property (nonatomic, strong) NSDictionary *mall;
@property (nonatomic, strong) NSString *isSelfSales;
@property (nonatomic, strong) NSString *strRedirectUrl;
@property (nonatomic, strong) NSString *strSourceUrl;
@property (nonatomic, strong) NSString *btInfoNation;
@property (nonatomic, strong) NSString *iIsGood;
@property (nonatomic, strong) NSString *iIsBad;
@property (nonatomic, strong) NSString *iInfoCollection;
@property (nonatomic, strong) NSString *iInfoReview;
@property (nonatomic, strong) NSString *strInfoUrl;
@property (nonatomic, strong) NSString *infoType;
@property (nonatomic, strong) NSString *strCatUrl;
@property (nonatomic, strong) NSString *strCatName;
@property (nonatomic, strong) NSString *strTagUrl;
@property (nonatomic, strong) NSString *strTagName;
@property (nonatomic, strong) NSString *dtInfoTime;
@property (nonatomic, strong) NSString *dtUpdateTime;
@property (nonatomic, strong) NSString *btSaleStatus;
@property (nonatomic, strong) NSString *homeShow;
@property (nonatomic, strong) NSString *isTop;
@property (nonatomic, strong) NSString *iCurrency;
@property (nonatomic, strong) NSString *btCountry;
@property (nonatomic, strong) NSString *strBrandId;
@property (nonatomic, strong) NSString *strBrandUrl;
@property (nonatomic, strong) NSString *strBrandName;
@property (nonatomic, strong) NSString *strBrandEngName;
@property (nonatomic, strong) NSString *iIsPurchasing;
@property (nonatomic, strong) NSString *strSpecifications;
@property (nonatomic, strong) NSString *haveBrandSize;
@property (nonatomic, strong) NSString *isDecline;
@property (nonatomic, strong) NSString *declinePercent;
@property (nonatomic, strong) NSString *fontType;
@property (nonatomic, strong) NSString *showColor;


//// ------- 第一层数据
@property (nonatomic, strong) BYBGoodDetailGetInfoDataModel *result;
@property (nonatomic, strong) NSString *countrySmallIcon;
@property (nonatomic, strong) NSString *countryBigIcon;
@end

//// ---- GetInfoBrandData ----- ////
@interface BYBGoodDetailGetInfoBrandDataModel : NSObject
@property (nonatomic, strong) NSString *strBrandUrl;
@property (nonatomic, strong) NSString *strBrandName;
@property (nonatomic, strong) NSString *strBrandShortName;
@property (nonatomic, strong) NSString *strBrandEngName;
@property (nonatomic, strong) NSString *strBrandShortEngName;
@property (nonatomic, strong) NSString *iCountry;
@property (nonatomic, strong) NSString *strCountryName;
@property (nonatomic, strong) NSString *strBrandDes;
@property (nonatomic, strong) NSString *strBrandLogo;

//// ----- 新增
@property (nonatomic, assign) CGFloat cellHeight;
@end

//// ----GetShareShoppingInfoListByInfoID ----- ////
@interface BYBGoodDetailGetShareShoppingInfoListByInfoIDModel : NSObject

@property (nonatomic, strong) NSString *iSSID;
@property (nonatomic, strong) NSString *strSSTitle;
@property (nonatomic, strong) NSString *strMainImage;
@property (nonatomic, strong) NSString *strImages;
@property (nonatomic, strong) NSString *imageTags;
@property (nonatomic, strong) NSString *strImageTags;
@property (nonatomic, strong) NSString *strVideoURL;
@property (nonatomic, strong) NSString *iOrderID;
@property (nonatomic, strong) NSString *iInfoID;
@property (nonatomic, strong) NSString *iUserID;
@property (nonatomic, strong) NSString *strUserName;
@property (nonatomic, strong) NSString *strNickName;
@property (nonatomic, strong) NSString *strHeadImage;
@property (nonatomic, strong) NSString *iSelected;
@property (nonatomic, strong) NSString *iPraiseGoodCount;


@end



//// ----GetInfoReview ----- ////
@interface BYBGoodDetailGetInfoReviewModel : NSObject

@property (nonatomic, strong) NSString *iReviewID;
@property (nonatomic, strong) BYBUserModel *user;
@property (nonatomic, strong) NSString *strReviewContent;
@property (nonatomic, strong) NSString *dtReviewTime;

@end



//// ----BYBGoodDetailModel ----- ////
@interface BYBGoodDetailModel : NSObject

@property(nonatomic, strong) BYBGoodDetailGetInfoDataModel *GetInfoData;
@property(nonatomic, strong) BYBGoodDetailGetInfoBrandDataModel *GetInfoBrandData;
@property(nonatomic, strong) NSArray<BYBGoodDetailGetShareShoppingInfoListByInfoIDModel *> *GetShareShoppingInfoListByInfoID;
@property(nonatomic, strong) NSArray<BYBGoodDetailGetInfoReviewModel *>*GetInfoReview;
@property(nonatomic, strong) NSString *ImageaCount;
/// 到手评价数量
@property(nonatomic, strong) NSString *GetOrdersCommodityReviewCountByInfoID;
/// 比友跟帖数量
@property(nonatomic, strong) NSString *rowscount;
@end

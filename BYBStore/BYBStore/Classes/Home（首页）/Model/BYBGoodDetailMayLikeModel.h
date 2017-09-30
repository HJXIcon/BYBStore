//
//  BYBGoodDetailMayLikeModel.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBGoodDetailMayLikeModel : NSObject
@property (nonatomic, strong) NSString *InfoID;
@property (nonatomic, strong) NSString *InfoTitle;
@property (nonatomic, strong) NSString *InfoUrl;
@property (nonatomic, strong) NSString *MainImage;
@property (nonatomic, strong) NSString *CommodityPrice;
@property (nonatomic, strong) NSString *OrginalPriceRMB;
@property (nonatomic, strong) NSString *MaxPriceRMB;
@property (nonatomic, strong) NSString *InfoType;
@property (nonatomic, strong) NSString *MinPriceRMB;
@property (nonatomic, strong) NSString *isDecline;
@property (nonatomic, strong) NSString *declinePercent;
@property (nonatomic, strong) NSString *fontType;
@property (nonatomic, strong) NSString *showColor;

@end

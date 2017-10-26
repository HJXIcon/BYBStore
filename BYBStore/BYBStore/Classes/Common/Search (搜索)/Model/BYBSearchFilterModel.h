//
//  BYBSearchFilterModel.h
//  BYBStore
//
//  Created by yituiyun on 2017/10/26.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BYBSearchFilterListModel;
@interface BYBSearchFilterModel : NSObject
@property (nonatomic, strong) NSString *strGroupEngName;
@property (nonatomic, strong) NSString *strGroupImage;
@property (nonatomic, strong) NSString *iShowFlag;
@property (nonatomic, strong) NSArray <BYBSearchFilterListModel*>*ListHotTag;
@property (nonatomic, strong) NSString *strGroupUrl;
@property (nonatomic, strong) NSString *strGroupName;
@property (nonatomic, strong) NSString *iShowType;
@property (nonatomic, strong) NSString *iOrderBy;

@end

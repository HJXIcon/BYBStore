//
//  BYBCategoryHotTagModel.h
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BYBCategoryHotTagModel : NSObject
@property (nonatomic, strong) NSString *strGroupUrl;
@property (nonatomic, strong) NSString *strTagUrl;
@property (nonatomic, strong) NSString *strTagName;
@property (nonatomic, strong) NSString *strTagEngName;
@property (nonatomic, strong) NSString *strTagDes;
@property (nonatomic, strong) NSString *strTagImage;
@end


@interface BYBCategoryHotTagGroupModel : NSObject
@property (nonatomic, strong) NSString *strGroupUrl;
@property (nonatomic, strong) NSString *strGroupName;
@property (nonatomic, strong) NSString *strGroupEngName;
@property (nonatomic, strong) NSString *iShowType;
@property (nonatomic, strong) NSArray <BYBCategoryHotTagModel *>*ListHotTag;

@end

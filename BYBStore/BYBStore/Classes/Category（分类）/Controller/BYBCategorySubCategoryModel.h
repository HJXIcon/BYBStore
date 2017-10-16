//
//  BYBCategorySubCategoryModel.h
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 子分类
 */
@interface BYBCategorySubCategoryModel : NSObject

@property (nonatomic, strong) NSString *CatImage;
@property (nonatomic, strong) NSString *ParentName;
@property (nonatomic, strong) NSString *ParentUrl;
@property (nonatomic, strong) NSString *CatUrl;
@property (nonatomic, strong) NSString *CatName;

@end

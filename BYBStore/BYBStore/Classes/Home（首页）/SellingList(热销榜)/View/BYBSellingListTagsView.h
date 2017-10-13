//
//  BYBSellingListTagsView.h
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
热销榜的标签展示
 */
@interface BYBSellingListTagsView : UIView

@property (nonatomic, strong) NSArray <NSString *>*tagsArray;
@property (nonatomic, copy) void(^removeBlock)();
@property (nonatomic, copy) void(^selectBlock)(NSInteger);
@property (nonatomic, assign) NSInteger selectIndex;
@end

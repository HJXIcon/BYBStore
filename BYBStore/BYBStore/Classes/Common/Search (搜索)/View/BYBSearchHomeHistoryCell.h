//
//  BYBSearchHomeHistoryCell.h
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYBSearchHomeHistoryCell : UICollectionViewCell
@property (nonatomic, copy) void(^selectBlock)(NSInteger);
@property (nonatomic, strong) NSArray <NSString *>*tagsArray;
@property (nonatomic, copy) void(^updateCellHeightBlock)(CGFloat);
@property (nonatomic, copy) void(^clearHistoryBlock)();
@end

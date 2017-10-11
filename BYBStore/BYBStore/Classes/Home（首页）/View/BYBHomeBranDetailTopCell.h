//
//  BYBHomeBranDetailTopCell.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BYBHomeBranDetailModel,BYBHomeHotDetailModel;
@interface BYBHomeBranDetailTopCell : UICollectionViewCell
/** model*/
@property (nonatomic, strong) BYBHomeBranDetailModel *model;

/**
 热门专题详情model
 */
@property (nonatomic, strong) BYBHomeHotDetailModel *hotModel;
@end

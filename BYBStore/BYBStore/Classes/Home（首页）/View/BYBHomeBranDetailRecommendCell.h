//
//  BYBHomeBranDetailRecommendCell.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYBHomeBrandListRecommendModel,BYBHomeOtherSpecialModel;
@interface BYBHomeBranDetailRecommendCell : UICollectionViewCell

/** model*/
@property (nonatomic, strong) BYBHomeBrandListRecommendModel *model;

/** otherSpecialModel*/
@property (nonatomic, strong) BYBHomeOtherSpecialModel *otherSpecialModel;
@end

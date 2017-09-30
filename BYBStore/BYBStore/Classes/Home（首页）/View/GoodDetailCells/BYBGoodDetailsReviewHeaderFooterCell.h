//
//  BYBGoodDetailsReviewHeaderCell.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseTableViewCell.h"


@interface BYBGoodDetailsReviewHeaderCell : BYBBaseTableViewCell



@end

@interface BYBGoodDetailsReviewFooterCell : BYBBaseTableViewCell
/// 到手评价
@property (nonatomic, assign) NSInteger reviewNum;
/// 比友跟帖
@property (nonatomic, assign) NSInteger reviewCount;

@end

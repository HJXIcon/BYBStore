//
//  BYBGoodDetailMayLikeViewModel.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailMayLikeViewModel.h"

@implementation BYBGoodDetailMayLikeViewModel

- (void)setMayLikeData:(NSArray *)mayLikeData{
    _mayLikeData = mayLikeData;
    
    self.cellHeight = 44 + (mayLikeData.count / 2) * ([BYBGoodDetailMayLikeViewModel mayLikeCellHeight] + 10) + 15;
}

+ (CGFloat)mayLikeCellHeight{
    return 300;
}

@end

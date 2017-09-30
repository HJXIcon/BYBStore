//
//  BYBGoodDetailMayLikeViewModel.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBGoodDetailMayLikeViewModel : NSObject

@property (nonatomic, strong) NSArray *mayLikeData;

@property (nonatomic, assign) CGFloat cellHeight;

+ (CGFloat)mayLikeCellHeight;

@end

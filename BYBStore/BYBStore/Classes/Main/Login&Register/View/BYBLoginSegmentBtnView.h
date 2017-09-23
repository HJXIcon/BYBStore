//
//  BYBLoginSegmentBtnView.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYBLoginSegmentBtnView : UIView
@property (nonatomic, copy) void(^selectBlock)(NSInteger index);
@end

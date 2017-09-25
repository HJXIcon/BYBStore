//
//  BYBNoDataView.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseView.h"

@interface BYBNoDataView : BYBBaseView
- (void)setImageName:(NSString *)imageName  desText:(NSString *)desText refreshBtnTitle:(NSString *)refreshBtnTitle refreshBlock:(void(^)())refreshBlock;

@end

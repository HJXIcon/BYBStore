//
//  BYBLoadingView.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/26.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseView.h"

@interface BYBLoadingView : BYBBaseView
-(void)show;

-(void)dismiss;

+(void)showInView:(UIView*)view;

+(void)dismissInView:(UIView*)view;

+ (void)showInWindow;

+ (void)dismissInWindow;

@end

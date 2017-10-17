//
//  BYBControllerManger.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BYBControllerManger : NSObject

+ (UIViewController *)chooseRootController;

+ (void)presentLoginController;

+ (void)presentRegisterController;
/**
 拿到当前正在显示的控制器，不管是push进去的，还是present进去的都能拿到
 */
+ (UIViewController *)getVisibleViewControllerFrom:(UIViewController*)vc;
/**
 怎么通过view找到拥有这个View的Controller
 */
+ (UIViewController *)getControllerFormView:(UIView *)view;

+ (void)showSearchController;
+ (void)dismissSearchController;
//获取Window当前显示的ViewController
+ (UIViewController*)currentViewController;
@end

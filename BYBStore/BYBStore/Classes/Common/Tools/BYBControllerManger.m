//
//  BYBControllerManger.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBControllerManger.h"
#import "BYBTabBarController.h"
#import "BYBLoginViewController.h"
#import "BYBRegisterViewController.h"

@implementation BYBControllerManger

+ (UIViewController *)chooseRootController{

    BYBTabBarController *tabBarVc = [[BYBTabBarController alloc]init];
    
    return tabBarVc;
}

+ (void)presentLoginController{
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[BYBLoginViewController alloc]init] animated:YES completion:nil];
}

+ (void)presentRegisterController{
    UIViewController *topRootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
    
    // 在这里加一个这个样式的循环
    while (topRootViewController.presentedViewController) {
    // 这里固定写法
        topRootViewController = topRootViewController.presentedViewController;
    }
    BYBRegisterViewController *vc = [[UIStoryboard storyboardWithName:NSStringFromClass([BYBRegisterViewController class]) bundle:nil] instantiateInitialViewController];
    
    // 然后再进行present操作
    [topRootViewController presentViewController:vc animated:YES completion:nil];
    
}




/**
 拿到当前正在显示的控制器，不管是push进去的，还是present进去的都能拿到
 */
+ (UIViewController *)getVisibleViewControllerFrom:(UIViewController*)vc {
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        
        return [self getVisibleViewControllerFrom:[((UINavigationController*) vc) visibleViewController]];
        
    }else if ([vc isKindOfClass:[UITabBarController class]]){
        
        return [self getVisibleViewControllerFrom:[((UITabBarController*) vc) selectedViewController]];
        
    } else {
        
        if (vc.presentedViewController) {
            
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
            
        } else {
            
            return vc;
            
        }
        
    }
    
}



/**
 怎么通过view找到拥有这个View的Controller
 */
+ (UIViewController *)getControllerFormView:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end

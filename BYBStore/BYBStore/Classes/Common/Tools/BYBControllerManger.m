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
@end

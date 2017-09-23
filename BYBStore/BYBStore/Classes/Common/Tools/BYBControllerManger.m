//
//  BYBControllerManger.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBControllerManger.h"
#import "BYBTabBarController.h"

@implementation BYBControllerManger

+ (UIViewController *)chooseRootController{

    BYBTabBarController *tabBarVc = [[BYBTabBarController alloc]init];
    
    return tabBarVc;
}
@end

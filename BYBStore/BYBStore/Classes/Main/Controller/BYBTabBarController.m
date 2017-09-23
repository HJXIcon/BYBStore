//
//  JXTabBarController.m
//  JXProjectFramework
//
//  Created by mac on 17/5/19.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import "BYBTabBarController.h"
#import "BYBNavigationController.h"

@interface BYBTabBarController ()


@end

@implementation BYBTabBarController


#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor blackColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:9];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    
    dictSelected[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"0xf16156"];
    
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:9];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    
}




- (void)setUpAllChildVc
{
    [self setUpOneChildVcWithVc:[[UIViewController alloc]init] Image:@"home_tabbar_normal" selectedImage:@"home_tabbar_select" title:@"首页"];
    [self setUpOneChildVcWithVc:[[UIViewController alloc]init] Image:@"task_tabbar_normal" selectedImage:@"task_tabbar_select" title:@"我的需求"];
    [self setUpOneChildVcWithVc:[[UIViewController alloc]init] Image:@"square_tabbar_normal" selectedImage:@"square_tabbar_select" title:@"云广场"];
    [self setUpOneChildVcWithVc:[[UIViewController alloc]init] Image:@"tabbar_message_normal" selectedImage:@"tabbar_message_select" title:@"消息"];
    [self setUpOneChildVcWithVc:[[UIViewController alloc]init] Image:@"personCenter_tabbar_normal" selectedImage:@"personCenter_tabbar_select" title:@"企业中心"];

    
}


#pragma mark - 初始化设置tabBar上面单个按钮的方法
/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    BYBNavigationController *nav = [[BYBNavigationController alloc] initWithRootViewController:Vc];
    
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    

    
   
    Vc.navigationItem.title = title;
        
    
    [self addChildViewController:nav];
}



@end

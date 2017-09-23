//
//  JXTabBarController.m
//  JXProjectFramework
//
//  Created by mac on 17/5/19.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import "BYBTabBarController.h"
#import "BYBNavigationController.h"
#import "BYBHomeViewController.h"
#import "BYBMineViewController.h"
#import "BYBShopCarViewController.h"
#import "BYBShareOrderViewController.h"
#import "BYBCategoryViewController.h"

@interface BYBTabBarController ()


@end

@implementation BYBTabBarController


#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    
    dictSelected[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"0xf16156"];
    
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    
}




- (void)setUpAllChildVc
{
    [self setUpOneChildVcWithVc:[[BYBHomeViewController alloc]init] Image:@"newshouye_25x25_" selectedImage:@"newshouye-on_25x25_" title:@"首页"];
    [self setUpOneChildVcWithVc:[[BYBCategoryViewController alloc]init] Image:@"newfenlei_25x25_" selectedImage:@"newfenlei-on_25x25_" title:@"分类"];
    [self setUpOneChildVcWithVc:[[BYBShareOrderViewController alloc]init] Image:@"newguangshaidan_25x25_" selectedImage:@"newguangshaidan-on_25x25_" title:@"逛晒单"];
    [self setUpOneChildVcWithVc:[[BYBShopCarViewController alloc]init] Image:@"newgouwuche_25x25_" selectedImage:@"newgouwuche-on_25x25_" title:@"购物车"];
    [self setUpOneChildVcWithVc:[[BYBMineViewController alloc]init] Image:@"newwode_25x25_" selectedImage:@"newwode-on_25x25_" title:@"我"];

    
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

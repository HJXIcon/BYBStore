//
//  JXNavigationController.m
//  JXProjectFramework
//
//  Created by mac on 17/5/19.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import "BYBNavigationController.h"


@interface BYBNavigationController ()

/** 全局返回按钮 */
@property (strong, nonatomic) UIButton *backBtn;
@end

@implementation BYBNavigationController


#pragma mark - lazy loading
- (UIButton *)backBtn {
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        
        [_backBtn setImage:[UIImage imageNamed:@"fanhui_25x25_"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"fanhui_25x25_"] forState:UIControlStateHighlighted
         ];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
        _backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        CGFloat  ScreenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat btnW =  ScreenW > 375.0 ? 70 : 60;
        
        _backBtn.frame = CGRectMake(0, 0, btnW, 40);
        
    }
    return _backBtn;
}





+ (void)initialize
//+(void)load
{
    // 设置全局BarButtonItem
//    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19.0];
    dic[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    // 全局navigationBar
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    [bar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    //设置一张空的图片
//    [bar setShadowImage:[[UIImage alloc] init]];
    
    NSMutableDictionary *dicBar = [NSMutableDictionary dictionary];
    
    //    dicBar[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    dicBar[NSForegroundColorAttributeName] = [UIColor blackColor];
    [bar setTitleTextAttributes:dicBar];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 取消代理
    self.interactivePopGestureRecognizer.delegate = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    if (self.viewControllers.count > 0) {
        
        UIViewController *firstVC = self.childViewControllers[0];
        if (self.childViewControllers.count == 1) {
            
            if (firstVC.navigationItem.title.length >= 4) {
                self.backBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            }
            [self.backBtn setTitle:firstVC.navigationItem.title forState:UIControlStateNormal];
            [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else {
            [self.backBtn setTitle:@"返回" forState:UIControlStateNormal];
        }
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    return [super pushViewController:viewController animated:animated];
}



/**
 * 返回按钮点击
 */

- (void)backBtnClick {
    [self popViewControllerAnimated:YES];
    
}



@end

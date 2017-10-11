//
//  BYBSellingListViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/10/11.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSellingListViewController.h"

@interface BYBSellingListViewController ()

@end

@implementation BYBSellingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"热销榜";
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]postNotificationName:CXBPopNotiName object:nil];
}

@end

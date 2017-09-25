//
//  BYBShareOrderViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBShareOrderViewController.h"
#import "BYBShareOrderOfMineController.h"

@interface BYBShareOrderViewController ()

@end

@implementation BYBShareOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[BYBShareOrderOfMineController alloc]init] animated:YES];
}
@end

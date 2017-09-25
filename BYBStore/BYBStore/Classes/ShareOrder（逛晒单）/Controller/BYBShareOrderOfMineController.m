//
//  BYBShareOrderOfMineController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBShareOrderOfMineController.h"

@interface BYBShareOrderOfMineController ()

@end

@implementation BYBShareOrderOfMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showNotLoginView];
}

#pragma mark - Private Method
- (void)showNotLoginView{
    BYBNoDataView *noDataView = [BYBNoDataView viewForXib];
    noDataView.frame = self.view.bounds;
    [noDataView setImageName:@"gouwucheweikong_75x75_" desText:@"购物车还是空的\n快去挑几件喜欢的宝贝吧" refreshBtnTitle:@"去逛逛" refreshBlock:^{
        [BYBControllerManger presentLoginController];
    }];
    
    [self.view addSubview:noDataView];
}
@end

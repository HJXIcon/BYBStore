//
//  BYBHomeBranViewController.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseTableViewController.h"

@interface BYBHomeBranViewController : BYBBaseTableViewController
@property (nonatomic, copy) void(^scrollBlock)(BOOL);
@end

//
//  BYBBaseTableViewController.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYBBaseTableViewController : UITableViewController

/** 是否第一次进入界面 */
@property (nonatomic, assign) BOOL isRefresh;

- (void)loadFooterData;
- (void)loadHeaderData;
- (void)endRefreshing;
@end

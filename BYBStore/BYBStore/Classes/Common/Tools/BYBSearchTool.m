//
//  BYBSearchTool.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/17.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchTool.h"
#import "BYBSearchViewController.h"

@implementation BYBSearchTool

/// 写入并且搜索
+ (void)writeSearchTextAndSearch:(NSString *)searchText{
    
    if (searchText.length == 0) {
        return;
    }
    
    NSMutableArray *historyArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:HistorySearchArray]];
    
    if ([historyArray containsObject:searchText]) {
        // 1.先移除
        [historyArray removeObject:searchText];
        
    }
    // 2.插在第一位
    [historyArray insertObject:searchText atIndex:0];
    
    [[NSUserDefaults standardUserDefaults]setObject:historyArray forKey:HistorySearchArray];
    
    // 3.dismiss 搜索控制器
    [BYBControllerManger dismissSearchController];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 4.push到搜索控制器
        BYBSearchViewController *vc = [[BYBSearchViewController alloc]init];
        vc.searchText = searchText;
        [[BYBControllerManger currentViewController].navigationController pushViewController:vc animated:YES];
    });
}


@end

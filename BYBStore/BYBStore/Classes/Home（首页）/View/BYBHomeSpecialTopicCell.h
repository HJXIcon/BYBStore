//
//  BYBHomeSpecialTopicCell.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseTableViewCell.h"
@class BYBHomeSpecialTopicModel;
@interface BYBHomeSpecialTopicCell : BYBBaseTableViewCell
+  (instancetype)cellForTableView:(UITableView *)tableView;

/** model*/
@property (nonatomic, strong) BYBHomeSpecialTopicModel *model;
@end

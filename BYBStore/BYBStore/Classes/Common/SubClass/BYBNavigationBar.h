//
//  BYBNavigationBar.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBBaseView.h"

@interface BYBNavigationBar : BYBBaseView
@property (weak, nonatomic) IBOutlet UILabel *navigationLabel;
@property(nonatomic, copy) void(^backBlock)();
@end

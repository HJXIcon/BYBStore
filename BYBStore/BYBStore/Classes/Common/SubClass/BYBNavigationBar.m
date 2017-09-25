//
//  BYBNavigationBar.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBNavigationBar.h"

@interface BYBNavigationBar()
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;


@end
@implementation BYBNavigationBar

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.bottomImageView.image = [UIImage imageWithColor:BYBBGColor];
    
}
- (IBAction)backAction:(id)sender {
    
    if (self.backBlock) {
        self.backBlock();
    }
}


@end

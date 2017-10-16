//
//  BYBCategoryBusinessCell.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategoryBusinessCell.h"

@implementation BYBCategoryBusinessCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.imageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
    }
    return self;
}
@end

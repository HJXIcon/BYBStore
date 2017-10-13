//
//  BYBCategoryCategoryMoreCell.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/13.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategoryCategoryMoreCell.h"

@interface BYBCategoryCategoryMoreCell ()

@property (nonatomic, strong) UIImageView *imageView;


@end
@implementation BYBCategoryCategoryMoreCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.imageView = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:@"chakangengduo"]];
    
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 35));
        make.center.mas_equalTo(self.contentView);
    }];
    self.imageView.image = [UIImage imageNamed:@"chakangengduo"];
    
    self.label = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:.1] textColor:BYBTEXTColor1 text:@"" textAlignment:NSTextAlignmentCenter];
    [self.contentView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.left.right.mas_equalTo(self.contentView);
    }];
}



@end

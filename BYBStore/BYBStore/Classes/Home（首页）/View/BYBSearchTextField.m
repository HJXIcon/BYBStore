//
//  BYBSearchTextField.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/26.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchTextField.h"

@implementation BYBSearchTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.leftViewMode = UITextFieldViewModeAlways;
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 30)];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        imageView.image = [UIImage imageNamed:@"main_search_40x40_"];
        imageView.center = leftView.center;
        [leftView addSubview:imageView];
        self.leftView = leftView;
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"searchviewbuttonbg"]]];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
        
        self.placeholder = @"女包";
    }
    return self;
}

@end

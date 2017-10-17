//
//  BYBSearchBarView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/26.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchBarView.h"
#import "BYBSearchTextField.h"
#import "BYBSearchTool.h"
@interface BYBSearchBarView ()<UITextFieldDelegate>

@property (nonatomic, strong) BYBSearchTextField *searchTextField;
/** cancel*/
@property (nonatomic, strong) UIButton *cancelBtn;
/** msg*/
@property (nonatomic, strong) UIButton *msgBtn;

/** 是否更新约束 */
@property (nonatomic, assign) BOOL isUpdate;
@end
@implementation BYBSearchBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setStyle:(BYBSearchBarViewStyle)style{
    _style = style;
    self.msgBtn.hidden = style == BYBSearchBarViewStyleCategory;
    self.cancelBtn.hidden = YES;
    if (style == BYBSearchBarViewStyleCategory) {
        [self.searchTextField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [self layoutIfNeeded];
        [self updateConstraints];
    }
    
}

- (void)setupUI{
    
    self.searchTextField = [[BYBSearchTextField alloc]init];
    [self addSubview:self.searchTextField];
    self.searchTextField.delegate = self;
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 40));
    }];
    
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.centerY.mas_equalTo(self);
    }];
    self.cancelBtn.hidden = YES;
    
    if (self.style == BYBSearchBarViewStyleHome) {
        self.msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.msgBtn setImage:[UIImage imageNamed:@"icon_msgcenter_40x40_"] forState:UIControlStateNormal];
        [self.msgBtn addTarget:self action:@selector(msgAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.msgBtn];
        
        [self.msgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).offset(-5);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    
}

#pragma mark - Actions
- (void)msgAction{
    [self.searchTextField resignFirstResponder];
    
    if (self.msgBlock) {
        self.msgBlock();
    }
}


- (void)cancelAction{
    
    [self.searchTextField resignFirstResponder];
    
    if (self.style == BYBSearchBarViewStyleHome) {
        self.cancelBtn.hidden = YES;
        self.msgBtn.hidden = NO;
    }
    
    if (self.style == BYBSearchBarViewStyleCategory) {
        self.cancelBtn.hidden = YES;
        [self.searchTextField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [self layoutIfNeeded];
        [self updateConstraints];
    }
    
    if (self.cacelSearchBlock) {
        self.cacelSearchBlock();
    }
    
}


#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.cancelBtn.hidden = NO;
    self.msgBtn.hidden = YES;
    
    if (self.style == BYBSearchBarViewStyleCategory) {
        [self.searchTextField mas_updateConstraints:^(MASConstraintMaker *make) {
           make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 40));
        }];
        
        [self layoutIfNeeded];
        [self updateConstraints];
    }
    
    if (self.searchBlock) {
        self.searchBlock();
    }
}

//按return键键盘往下收  becomeFirstResponder
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    [BYBSearchTool writeSearchTextAndSearch:textField.text];
    textField.text = @"";
    return YES;
}



// 如需要重新布局
- (void)cancel{
    [self cancelAction];
}

@end

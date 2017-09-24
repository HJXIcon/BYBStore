
//
//  BYBAccountLoginView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBAccountLoginView.h"

@interface BYBAccountLoginView ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UITextField *accountTextF;


@property (nonatomic, strong) UIButton *rightBtn;
@end
@implementation BYBAccountLoginView

- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.size = CGSizeMake(24, 24);
        [_rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_rightBtn setImage:[UIImage imageNamed:@"weixianshimima_20x20_"] forState:UIControlStateNormal];
        [_rightBtn setImage:[UIImage imageNamed:@"xianshimima_20x20_"] forState:UIControlStateSelected];
    }
    return _rightBtn;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.enabled = NO;
    [self.loginBtn setBackgroundImage:[UIImage imageWithColor:BYBBGColor] forState:UIControlStateDisabled];
    [self.loginBtn setBackgroundImage:[UIImage imageWithColor:BYBThemeColor] forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.phoneTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.accountTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.accountTextF.rightViewMode = UITextFieldViewModeAlways;
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 34, 24)];
    [rightView addSubview:self.rightBtn];
    self.accountTextF.rightView = rightView;
    self.accountTextF.secureTextEntry = YES;
    
    
    [self.registerBtn setTitleColor:BYBThemeColor forState:UIControlStateNormal];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChangeAction) name:UITextFieldTextDidChangeNotification object:nil];
    
    
}



- (IBAction)loginAction:(id)sender {
}
- (IBAction)registerAction:(id)sender {
    
    [BYBControllerManger presentRegisterController];
}
- (IBAction)forgetAction:(id)sender {
}

- (void)textChangeAction{
    
    if (self.phoneTextF.text.length && self.accountTextF.text.length) {
        self.loginBtn.enabled = YES;
    }else{
         self.loginBtn.enabled = NO;
    }
}

- (void)rightBtnAction:(UIButton *)button{
    button.selected = !button.selected;
    self.accountTextF.secureTextEntry = !button.selected;
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end

//
//  BYBPhoneLoginView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBPhoneLoginView.h"


@interface BYBPhoneLoginView ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UITextField *codeTextF;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *regitserBtn;
@property(strong,nonatomic) NSTimer *timer;
/** 时间 */
@property (nonatomic, assign) int time;

@end
@implementation BYBPhoneLoginView
- (void)awakeFromNib{
    [super awakeFromNib];
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.enabled = NO;
    [self.loginBtn setBackgroundImage:[UIImage imageWithColor:BYBBGColor] forState:UIControlStateDisabled];
    [self.loginBtn setBackgroundImage:[UIImage imageWithColor:BYBThemeColor] forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.phoneTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.codeTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.getCodeBtn.enabled = NO;
    [self dealGetCodeBtn];
    
    [self.regitserBtn setTitleColor:BYBThemeColor forState:UIControlStateNormal];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChangeAction) name:UITextFieldTextDidChangeNotification object:nil];
    
}

#pragma mark - Private Method
- (void)dealGetCodeBtn{
    self.getCodeBtn.layer.cornerRadius = 5;
    self.getCodeBtn.layer.masksToBounds = YES;
    self.getCodeBtn.layer.borderWidth = 0.5;
    self.getCodeBtn.layer.borderColor = self.getCodeBtn.enabled ?  BYBThemeColor.CGColor : BYBBGColor.CGColor;
    [self.getCodeBtn setTitleColor:self.getCodeBtn.enabled ? BYBThemeColor : BYBBGColor forState:UIControlStateNormal];
}

#pragma mark - Actions
- (IBAction)loginAction:(UIButton *)sender {
    if (self.loginBlock) {
        self.loginBlock();
    }
}

- (IBAction)regitsterAction:(UIButton *)sender {
    
    [BYBControllerManger presentRegisterController];
    
}
- (IBAction)getCodeAction:(id)sender {
    
    if (![BYBCheckTools isMobile:self.phoneTextF.text]) {
        UIViewController *vc = [BYBControllerManger getControllerFormView:self];
        [vc showHint:@"请输入正确手机号!"];
        
        return;
    }
    /// 添加定时器
    _time = 60;
    self.getCodeBtn.titleLabel.text = [NSString stringWithFormat:@"已发送60s"];
    [self.getCodeBtn setTitle:[NSString stringWithFormat:@"已发送%ds",_time] forState:UIControlStateNormal];
    self.getCodeBtn.enabled = NO;
    [self dealGetCodeBtn];
    _timer = [NSTimer scheduledTimerWithTimeInterval: 1
                                              target: self
                                            selector: @selector(timerAction:)
                                            userInfo: nil
                                             repeats: YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:UITrackingRunLoopMode];
}

- (void)timerAction:(NSTimer *)theTimer{
    
    _time --;
    if (_time > 0) {
        self.getCodeBtn.titleLabel.text = [NSString stringWithFormat:@"已发送%ds",_time];
        [self.getCodeBtn setTitle:[NSString stringWithFormat:@"已发送%ds",_time] forState:UIControlStateNormal];
        self.getCodeBtn.enabled = NO;
        [self dealGetCodeBtn];
    }else {
        [_timer invalidate];
        self.getCodeBtn.enabled = YES;
        [self dealGetCodeBtn];
        [self.getCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    }
}


- (void)textChangeAction{
    
    if (self.phoneTextF.text.length && self.codeTextF.text.length) {
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
    
    
    self.getCodeBtn.enabled = self.phoneTextF.text.length > 0;
    [self dealGetCodeBtn];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end

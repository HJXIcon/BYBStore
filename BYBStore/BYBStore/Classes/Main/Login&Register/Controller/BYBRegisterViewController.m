//
//  BYBRegisterViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBRegisterViewController.h"
#import "BYBWebViewController.h"

#define TIMERCODE 60

@interface BYBRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UITextField *codeTextF;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextF;
@property (weak, nonatomic) IBOutlet UITextField *pdwTextF;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UILabel *agreementLabel;
@property(strong,nonatomic) NSTimer *timer;
@property (nonatomic, strong) UIButton *rightBtn;
/** 时间 */
@property (nonatomic, assign) int time;
@end

@implementation BYBRegisterViewController
#pragma mark - lazy load

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



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 34, 24)];
    [rightView addSubview:self.rightBtn];
    self.pdwTextF.rightViewMode = UITextFieldViewModeAlways;
    self.pdwTextF.rightView = rightView;
    self.pdwTextF.secureTextEntry = YES;
    
    self.commitBtn.layer.cornerRadius = 5;
    self.commitBtn.layer.masksToBounds = YES;
    self.commitBtn.enabled = NO;
    [self.commitBtn setBackgroundImage:[UIImage imageWithColor:BYBBGColor] forState:UIControlStateDisabled];
    [self.commitBtn setBackgroundImage:[UIImage imageWithColor:BYBThemeColor] forState:UIControlStateNormal];
    [self.commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChangeAction) name:UITextFieldTextDidChangeNotification object:nil];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(agreementAction)];
    self.agreementLabel.userInteractionEnabled = YES;
    [self.agreementLabel addGestureRecognizer:tap];
    
    
    self.getCodeBtn.enabled = NO;
    [self dealGetCodeBtn];
    
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

- (IBAction)commitAction:(id)sender {
    
}
- (IBAction)getCodeAction:(id)sender {
    
    if (![BYBCheckTools isMobile:self.phoneTextF.text]) {
        [self showHint:@"请输入正确手机号!"];
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
- (IBAction)colseAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)rightBtnAction:(UIButton *)button{
    button.selected = !button.selected;
    self.pdwTextF.secureTextEntry = !button.selected;
}

- (void)textChangeAction{
    
    if (self.phoneTextF.text.length && self.codeTextF.text.length && self.nickNameTextF.text.length && self.pdwTextF.text.length) {
        self.commitBtn.enabled = YES;
    }else{
        self.commitBtn.enabled = NO;
    }
    
    self.getCodeBtn.enabled = self.phoneTextF.text.length > 0;
    [self dealGetCodeBtn];
}

- (void)agreementAction{
    [self presentViewController:[[BYBWebViewController alloc]init] animated:YES completion:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

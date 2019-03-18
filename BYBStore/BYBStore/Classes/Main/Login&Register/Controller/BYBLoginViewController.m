//
//  BYBLoginViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBLoginViewController.h"
#import "BYBLoginSegmentBtnView.h"
#import "BYBPhoneLoginView.h"
#import "BYBAccountLoginView.h"

static CGFloat const BG_Height = 180;
static CGFloat const Segment_Height = 44;
static CGFloat const Scroll_Height = 350;

@interface BYBLoginViewController ()
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) BYBLoginSegmentBtnView *segmentBtnView;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end

@implementation BYBLoginViewController
#pragma mark - lazy laod
- (BYBLoginSegmentBtnView *)segmentBtnView{
    if (_segmentBtnView == nil) {
        
        JXWeakSelf;
        _segmentBtnView = [[BYBLoginSegmentBtnView alloc]initWithFrame:CGRectMake(30, BG_Height, kScreenW - 60, Segment_Height)];
        _segmentBtnView.selectBlock = ^(NSInteger index) {
            [weakSelf.mainScrollView setContentOffset:CGPointMake(index * self.mainScrollView.width, 0) animated:YES];
        };
    }
    return _segmentBtnView;
}

- (UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, BG_Height)];
        
        _bgImageView.image = [UIImage imageNamed:@"Login_beijing_360x130_"];
        _bgImageView.userInteractionEnabled = YES;
        
        UIImageView *logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Login_biyabilogo_154x52_"]];
        
        logoImageView.center = _bgImageView.center;
        [_bgImageView addSubview:logoImageView];
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(0, 20, 44, 44);
        [closeBtn setImage:[UIImage imageNamed:@"Login_guanbi_18x18_"] forState:UIControlStateNormal];
        closeBtn.adjustsImageWhenHighlighted = NO;
        [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        [_bgImageView addSubview:closeBtn];
    }
    return _bgImageView;
}
- (UIScrollView *)mainScrollView{
    if (_mainScrollView == nil) {
        _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, Segment_Height + BG_Height, kScreenW, Scroll_Height)];
        _mainScrollView.contentSize = CGSizeMake(kScreenW * 2, kScreenH);
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        JXWeakSelf;
        BYBPhoneLoginView *phoneView = [BYBPhoneLoginView viewForXib];
        phoneView.frame = CGRectMake(0, 0, kScreenW, Scroll_Height);
        [_mainScrollView addSubview:phoneView];
        
        phoneView.loginBlock = ^{
            [weakSelf loginAction];
        };
        
        BYBAccountLoginView *phoneView2 = [BYBAccountLoginView viewForXib];
        phoneView2.loginBlock = ^{
            [weakSelf loginAction];
        };
        phoneView2.frame = CGRectMake(kScreenW, 0, kScreenW, Scroll_Height);
        [_mainScrollView addSubview:phoneView2];
        
    }
    
    return _mainScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubViews];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
}

- (void)setupSubViews{
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.segmentBtnView];
    [self.view addSubview:self.mainScrollView];
}


#pragma makr - Actions
- (void)loginAction{
    [self.view makeToastActivity:CSToastPositionCenter];
    NSString *url = @"http://novel.juhe.im/sub-categories";
    [PPNetworkHelper GET:url parameters:nil success:^(id responseObject) {
        [self.view hideToastActivity];
        [BYBUserInfoHelper sharedUserInfo].token = @"bybdededheihhdehbhidoheih";
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSError *error) {
        [self.view hideToastActivity];
        [BYBUserInfoHelper sharedUserInfo].token = @"bybdededheihhdehbhidoheih";
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)tapAction{
    [self.view endEditing:YES];
}

- (void)closeAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

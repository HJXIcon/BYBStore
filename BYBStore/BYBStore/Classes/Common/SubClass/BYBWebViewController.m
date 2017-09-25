//
//  BYBWebViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBWebViewController.h"
#import "BYBNavigationBar.h"
#import <WebKit/WebKit.h>

@interface BYBWebViewController ()<WKNavigationDelegate,WKScriptMessageHandler>
@property (nonatomic, strong) WKWebView *web;
@property (nonatomic, strong) BYBNavigationBar *navigationBarView;
@end

@implementation BYBWebViewController

- (BYBNavigationBar *)navigationBarView{
 
    if (_navigationBarView == nil) {
        JXWeakSelf;
        _navigationBarView = [BYBNavigationBar viewForXib];
        _navigationBarView.frame = CGRectMake(0, 20, kScreenW, 44);
        _navigationBarView.backBlock = ^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        };
    }
    return _navigationBarView;
}

#pragma mark - Cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupNav];
    NSString *js = @"document.documentElement.style.webkitUserSelect='none';" ;
    WKUserScript *script = [[WKUserScript alloc]initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    
    NSString *js2 = @"document.documentElement.style.webkitTouchCallout='none';";
    WKUserScript *script2 = [[WKUserScript alloc]initWithSource:js2 injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    [config.userContentController addUserScript:script];
    [config.userContentController addUserScript:script2];
    [config.userContentController addScriptMessageHandler:self name:@"observe"];
    
    
    _web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) configuration:config];
    _web.navigationDelegate = self;
    _web.backgroundColor = [UIColor clearColor];
    _web.scrollView.showsVerticalScrollIndicator = NO;
    _web.scrollView.directionalLockEnabled = YES;
    _web.scrollView.showsHorizontalScrollIndicator = NO;
    _web.scrollView.bounces = NO;
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", @"http://dev.yituiyun.cn/api.php?m=h5.agreement"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:15];
    [_web loadRequest:request];
    [self.view addSubview:_web];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self hideHud];
}



- (void)setupNav{
    [self.view addSubview:self.navigationBarView];
    self.navigationBarView.navigationLabel.text = @"用户使用协议";
}



- (void)loadWebPageWithString:(NSString*)urlString
{
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[urlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    UILabel * myLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    myLabel.attributedText = attrStr;
    
    NSString *html_str = [NSString stringWithFormat:@"%@", myLabel.text];
    [_web loadHTMLString:html_str baseURL:nil];
}

#pragma mark - <UIWebViewDelegate>
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    [self hideHud];
    [self showHudInView1:self.view hint:@"加载中..."];
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    [self hideHud];
    
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [self hideHud];
    [self showHint:@"加载失败,请重试"];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
    [self hideHud];
    [self showHint:@"加载失败,请重试"];
}


#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
}

@end

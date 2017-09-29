//
//  BYBGoodDetailsCell4.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/29.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsCell4.h"
#import <WebKit/WebKit.h>

@interface BYBGoodDetailsCell4 ()<WKNavigationDelegate,UIWebViewDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSMutableDictionary *heightDic;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) BOOL hasLoad;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIWebView *uiwebView;

@end
@implementation BYBGoodDetailsCell4
- (NSMutableDictionary *)heightDic{
    if (_heightDic == nil) {
        _heightDic = [[NSMutableDictionary alloc]init];
    }
    return _heightDic;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    self.label = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:15 weight:.3] textColor:BYBTEXTColor2 text:@"商品详情" textAlignment:0];
    [self.contentView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(15);
    }];
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = BYBTEXTColor0;
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).offset(15);
        make.right.left.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.25);
    }];
    
//    NSString *js = @"document.documentElement.style.webkitUserSelect='none';" ;
//    WKUserScript *script = [[WKUserScript alloc]initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    
//    NSString *js2 = @"document.documentElement.style.webkitTouchCallout='none';";
//    WKUserScript *script2 = [[WKUserScript alloc]initWithSource:js2 injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
//    [config.userContentController addUserScript:script];
//    [config.userContentController addUserScript:script2];
//  
//    self.webView = [[WKWebView alloc]initWithFrame:CGRectZero configuration:config];
//    self.webView.scrollView.scrollEnabled = NO;
//    self.webView.navigationDelegate = self;
//    self.webView.backgroundColor = [UIColor whiteColor];
//    [self.contentView addSubview:self.webView];
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.lineView.mas_bottom).offset(20);
//        make.right.left.mas_equalTo(self.contentView);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
//    }];
//    
    
    
    self.uiwebView = [[UIWebView alloc]init];
    self.uiwebView.delegate = self;
    self.uiwebView.scalesPageToFit = NO;
    self.uiwebView.scrollView.bounces = NO;
    [self.uiwebView setAutoresizingMask:UIViewAutoresizingNone];
    [self.uiwebView.scrollView setScrollsToTop:NO];
    self.uiwebView.scrollView.scrollEnabled = NO;
    [self.contentView addSubview:self.uiwebView];
    self.uiwebView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webViewTapAction:)];
    tap.delegate = self;
    tap.cancelsTouchesInView = NO;
    tap.delaysTouchesBegan = YES;
    [self.uiwebView addGestureRecognizer:tap];
    
    [self.uiwebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(20);
        make.right.left.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    
}
#pragma mark - <UIWebViewDelegate>
//- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
//    
//    if (self.hasLoad) {
//        return;
//    }
//    
//    self.hasLoad = YES;
//    
//    JXWeakSelf;
//    //获取内容实际高度（像素）@"document.getElementById(\"content\").offsetHeight;"
//    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result,NSError * _Nullable error) {
//        // 此处js字符串采用scrollHeight而不是offsetHeight是因为后者并获取不到高度，看参考资料说是对于加载html字符串的情况下使用后者可以(@"document.getElementById(\"content\").offsetHeight;")，但如果是和我一样直接加载原站内容使用前者更合适
//        //获取页面高度，并重置webview的frame
//        // 防止死循环
//        if (![weakSelf.heightDic objectForKey:@"height"] || [[weakSelf.heightDic objectForKey:@"height"] doubleValue] != [result doubleValue]) {
//            
//            [weakSelf.heightDic setObject:result forKey:@"height"];
//            
//            JXLog(@"UpdateGoodDetailCell4Height --- ");
//            
//            [[NSNotificationCenter defaultCenter]postNotificationName:UpdateGoodDetailCell4Height object:@([result doubleValue] + 50)];
//        }
//        
//    }];
//    
//    
//}




- (void)setStrInfoContent:(NSString *)strInfoContent{
    _strInfoContent = strInfoContent;
    
    if (strInfoContent.length) {
        
        NSURL *cssURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"GoodDetail" ofType:@"css"]];
//        [self.webView loadHTMLString:[self handleWithHtmlBody:strInfoContent] baseURL:cssURL];
        [self.uiwebView loadHTMLString:[self handleWithHtmlBody:strInfoContent] baseURL:cssURL];
    }
}


- (NSString *)handleWithHtmlBody:(NSString *)htmlBody
{
    NSString *html = [htmlBody stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"<br>" withString:@""];
    NSString *cssName = @"GoodDetail.css";
    NSMutableString *htmlString =[[NSMutableString alloc]initWithString:@"<html>"];
    [htmlString appendString:@"<head><meta charset=\"UTF-8\">"];
    [htmlString appendString:@"<link rel =\"stylesheet\" href = \""];
    [htmlString appendString:cssName];
    [htmlString appendString:@"\" type=\"text/css\" />"];
    [htmlString appendString:@"</head>"];
    [htmlString appendString:@"<body>"];
    [htmlString appendString:html];
    [htmlString appendString:@"</body>"];
    [htmlString appendString:@"</html>"];
    return htmlString;
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    if (self.hasLoad) {
        return;
    }
    
    self.hasLoad = YES;
    
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]floatValue]+50;
    
    if (![self.heightDic objectForKey:@"height"] || [[self.heightDic objectForKey:@"height"] doubleValue] != height) {
        
        [self.heightDic setObject:@(height) forKey:@"height"];
        
        JXLog(@"uilCell4Height --- ");
        
        [[NSNotificationCenter defaultCenter]postNotificationName:UpdateGoodDetailCell4Height object:@(height)];
    }
    
}

#pragma mark - action
// 点击图片
- (void)webViewTapAction:(UITapGestureRecognizer *)tap{
    
    CGPoint pt = [tap locationInView:self.uiwebView];
    //判断点击到的是否是图片，可设置特殊的url，
    NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", pt.x, pt.y];
    NSString *urlToSave = [self.uiwebView stringByEvaluatingJavaScriptFromString:imgURL];
    
    if (urlToSave.length > 0) {
        NSLog(@"%@",urlToSave);
        [self showImageURL:urlToSave point:pt];
    }
}

- (void)showImageURL:(NSString *)url point:(CGPoint)point{
    if(![url hasPrefix:@"http"])return;
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
    imageInfo.imageURL = [NSURL URLWithString:url];
    imageInfo.referenceView = self;
    
    UIViewController *vc = [BYBControllerManger getControllerFormView:self];
    
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                           initWithImageInfo:imageInfo
                                           mode:JTSImageViewControllerMode_Image
                                           backgroundStyle:JTSImageViewControllerBackgroundOption_Blurred];
    [imageViewer showFromViewController:vc.navigationController transition:JTSImageViewControllerTransition_FromOffscreen];
    
    
}

#pragma mark - UIGestureRecognizerDelegate
/// 注意 一定要实现这个方法，否则点击webView没反应
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


@end

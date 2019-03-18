//
//  Define.h
//  JXProjectFramework
//
//  Created by mac on 17/5/19.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef Define_h
#define Define_h


// 一些常用方法的宏定义，摘自MVVMReactiveCocoa
#define ST_DOCUMENT_DIRECTORY NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#define ST_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define ST_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define ST_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])


/**! 屏幕适配*/
#define kScreenW ([UIScreen mainScreen].bounds.size.width)
#define kScreenH ([UIScreen mainScreen].bounds.size.height)


/**! Dubug相关*/
#ifdef DEBUG
#define JXLog(format,...)  NSLog((@"[函数名:%s]\n" "[行号:%d]\n" format),__FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define JXLog(...)
#endif



// 弱引用
#define JXWeakSelf __weak typeof(self) weakSelf = self;

//.h头文件中的单例宏
#define OSingletonH(name) + (instancetype)shared##name;

//.m文件中的单例宏
#define OSingletonM(name) \
static id _instance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
+ (instancetype)shared##name{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc] init];\
});\
return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone{\
return _instance;\
}




/*!   ------  网络请求 -------       */
/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */


#define DevelopSever 0
#define TestSever    1
#define ProductSever 0

#if DevelopSever
/** 接口前缀-开发服务器*/
static NSString *const kApiPrefix = @"接口服务器的请求前缀 例: http://192.168.10.10:8080";
#elif TestSever
/** 接口前缀-测试服务器*/
static NSString *const kApiPrefix = @"https://www.baidu.com";
#elif ProductSever
/** 接口前缀-生产服务器*/
static NSString *const kApiPrefix = @"https://www.baidu.com";
#endif



#import "UIImage+Image.h"
#import "UIColor+Extension.h"
#import "BYBControllerManger.h"
#import "UIView+Extension.h"
#import "BYBCheckTools.h"
#import "UIViewController+HUD.h"
#import "UITableView+placeholder.h"
#import "BYBNoDataView.h"
#import "UIView+Placeholder.h"
#import "BYBRefreshHeader.h"
#import "BYBRefreshFooter.h"
#import "BYBLoadingView.h"
#import "JXFactoryTool.h"
#import "UIView+masonry.h"
#import "UILabel+MarginText.h"
#import "NSString+JXExtension.h"
#import "UIBarButtonItem+Item.h"
#import "JXConst.h"
#import "BYBUserInfoHelper.h"

// 主题颜色
#define BYBThemeColor [UIColor colorWithHexString:@"0xfb1951"]
// 背景颜色
#define BYBBGColor [UIColor colorWithHexString:@"0xf0eff5"]
// borderColor
#define BYBBorderColor [UIColor colorWithHexString:@"0xf0f0f0"]

// 字体颜色0
#define BYBTEXTColor0 [UIColor colorWithHexString:@"0xc0c0c0"]
// 字体颜色1
#define BYBTEXTColor1 [UIColor colorWithHexString:@"0x808080"]
// 字体颜色2
#define BYBTEXTColor2 [UIColor colorWithHexString:@"0x707070"]

// 比例
#define BYBSCREEN_SCALE ((double)[ UIScreen mainScreen ].bounds.size.width/320)
// 占位视图
#define BYB_PlaceholderImage [UIImage imageNamed:@"netError"]

// 箭头图片
#define BYB_ArrowImage [UIImage imageNamed:@"common_icon_arrow"]
// 美工标出的字体大小 28px = 28 / 2 * 96 / 72 = 18.666
#define PSFont(I) I * 0.5 * 96 / 72
#define FontRadio(I)  I*[UIScreen mainScreen].bounds.size.width/375.0f
#define PSFontRadio(I) FontRadio(PSFont(I))





// ----- !***  判断  *** ----- ///
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]])

//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


// >>>>>> 适配iOS 11、iPhone X
#pragma mark -  *** 适配iOS 11、iPhone X

#define isIOS11 [[UIDevice currentDevice].systemVersion floatValue] >= 11

/// 底部宏，吃一见长一智吧，别写数字了
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define iPhone5s ([UIScreen mainScreen].bounds.size.width>=320.0f && [UIScreen mainScreen].bounds.size.height>=568.0f && IS_IPHONE)
#define iPhoneX ([UIScreen mainScreen].bounds.size.width>=375.0f && [UIScreen mainScreen].bounds.size.height>=812.0f && IS_IPHONE)

// 状态栏高度
#define TP_StatusBarHeight (iPhoneX ? 44.f : 20.f)
// 导航条高度
#define TP_NavigationBarHeight  44.f


// tabbar 高度
#define TP_TabbarHeight (iPhoneX ? (49.f+34.f) : 49.f)
// tabbarSafe
#define TP_TabbarSafeBottomMargin (iPhoneX ? 34.f : 0.f)


// 导航栏默认高度
#define  TP_StatusBarAndNavigationBarHeight  (iPhoneX ? 88.f : 64.f)
#define  TP_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})


/**!
 iOS11设备上运行出现最多问题应该就是tableview莫名奇妙的偏移20pt或者64pt了。
 原因是iOS11弃用了automaticallyAdjustsScrollViewInsets属性，取而代之的
 是UIScrollView新增了contentInsetAdjustmentBehavior属性，这一切的罪魁
 祸首都是新引入的safeArea;
 */
// 适配TableView、ScrollView、CollectionView
#define  adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)

// 适配iOS11 scrollView不偏移64p
// self.automaticallyAdjustsScrollViewInsets = NO;
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)

#endif /* Define_h */

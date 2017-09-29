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

// 主题颜色
#define BYBThemeColor [UIColor colorWithHexString:@"0xfb1951"]
// 背景颜色
#define BYBBGColor [UIColor colorWithHexString:@"0xf0eff5"]
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

#endif /* Define_h */

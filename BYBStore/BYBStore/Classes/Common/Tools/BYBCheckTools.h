//
//  BYBCheckTools.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBCheckTools : NSObject

/**
 *  正则表达式检测邮箱
 *
 *  @param email 传入邮箱
 *
 *  @return 返回检测信息
 */
+ (BOOL) isEmail:(NSString *)email;

/**
 *  正则表达式检测手机号码
 *
 *  @param mobile 传入手机号码
 *
 *  @return 返回检测信息
 */
+ (BOOL) isMobile:(NSString *)mobile;
/**
 *  检测字符串是否是纯数字
 *
 *  @param string 传入字符串
 *
 *  @return 返回检测信息
 */
+ (BOOL)isPureFloat:(NSString *)string;


@end

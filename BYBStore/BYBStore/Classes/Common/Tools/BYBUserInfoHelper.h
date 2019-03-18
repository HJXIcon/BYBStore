//
//  BYBUserInfoHelper.h
//  Orange
//
//  Created by 晓梦影 on 2019/1/6.
//  Copyright © 2019年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBUserInfoHelper : NSObject
@property (nonatomic, copy) NSString *token;
OSingletonH(UserInfo)

/// 是否登录了
- (BOOL)isLogin;


@end


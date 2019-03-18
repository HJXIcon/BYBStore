//
//  BYBUserInfoHelper.m
//  Orange
//
//  Created by 晓梦影 on 2019/1/6.
//  Copyright © 2019年 Orange. All rights reserved.
//

#import "BYBUserInfoHelper.h"

@implementation BYBUserInfoHelper
{
    NSString *_token;
    
}
OSingletonM(UserInfo)
@dynamic token;

- (void)setToken:(NSString *)token{
    _token = token;
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)token{
    if (_token == nil) {
        return [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    }
    return _token;
}

- (BOOL)isLogin{
    if (kStringIsEmpty(self.token)) {
        return NO;
    }
    return YES;
}


@end

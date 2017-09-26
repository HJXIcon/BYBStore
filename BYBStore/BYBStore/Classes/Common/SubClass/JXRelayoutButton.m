//
//  JXRelayoutButton.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "JXRelayoutButton.h"

@implementation JXRelayoutButton

- (void)setJx_type:(JXRelayoutButtonType)jx_type{
    
    _jx_type = jx_type;
    
    if (jx_type != JXRelayoutButtonTypeNomal) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
}


//重写父类方法,改变标题和image的坐标
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    
    switch (self.jx_type) {
        case JXRelayoutButtonTypeNomal:
        {
            return  [super imageRectForContentRect:contentRect];
        }
            break;
            
            
        case JXRelayoutButtonTypeLeft:
        {
            CGFloat x = contentRect.size.width - self.offset - self.imageSize.width ;
            CGFloat y =  contentRect.size.height - self.imageSize.height ;
            y = y/2;
            CGRect rect = CGRectMake(x,y,self.imageSize.width,self.imageSize.height);
            return rect;
            
        }
            break;
            
            
            
        case JXRelayoutButtonTypeBottom:
        {
            CGFloat x =  contentRect.size.width -  self.imageSize.width;
            CGFloat y = self.offset;
            x = x / 2;
            CGRect rect = CGRectMake(x,y,self.imageSize.width,self.imageSize.height);
            return rect;
        }
            break;
            
            
        case JXRelayoutButtonTypeTop:
        {
            CGFloat x =  contentRect.size.width -  self.imageSize.width;
            CGFloat y = contentRect.size.height - self.imageSize.height - self.offset;
            x = x / 2;
            CGRect rect = CGRectMake(x,y,self.imageSize.width,self.imageSize.height);
            return rect;
        }
            break;
            
        default:
            break;
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    switch (self.jx_type) {
        case JXRelayoutButtonTypeNomal:
        {
            return [super titleRectForContentRect:contentRect];
        }
            break;
            
        case JXRelayoutButtonTypeLeft:
        {
            return CGRectMake(0, 0, contentRect.size.width - self.offset - self.imageSize.width , contentRect.size.height);
        }
            break;
            
        case JXRelayoutButtonTypeBottom:
        {
            return CGRectMake(0,   self.offset + self.imageSize.height , contentRect.size.width , contentRect.size.height - self.offset - self.imageSize.height );
        }
            break;
            
        case JXRelayoutButtonTypeTop:
        {
            return CGRectMake(0,  0 , contentRect.size.width , contentRect.size.height - self.offset - self.imageSize.height);
        }
            break;
            
        default:
            break;
    }
}

@end

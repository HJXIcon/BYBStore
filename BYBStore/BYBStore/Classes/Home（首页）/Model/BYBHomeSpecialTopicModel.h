//
//  BYBHomeSpecialTopicModel.h
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBHomeSpecialTopicModel : NSObject
/** id*/
@property (nonatomic, strong) NSString *iSpecialID;
/** <#注释#>*/
@property (nonatomic, strong) NSString *strSpecialName;
/** <#注释#>*/
@property (nonatomic, strong) NSString *strSpecialImage;
/** <#注释#>*/
@property (nonatomic, strong) NSString *strSpecialDetailImage;
/** <#注释#>*/
@property (nonatomic, strong) NSString *strSpecialUrl;
/** <#注释#>*/
@property (nonatomic, strong) NSString *iParentSpecialID;
/** <#注释#>*/
@property (nonatomic, strong) NSString *strParentSpecialName;
/** <#注释#>*/
@property (nonatomic, strong) NSString *btSpecialType;
/** <#注释#>*/
@property (nonatomic, strong) NSString *btSpecialLevel;

@end

//
//  BYBShareOrderOfMineHeaderView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBShareOrderOfMineHeaderView.h"
#import "JXRelayoutButton.h"

@interface BYBShareOrderOfMineHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *likeNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareOrderNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UILabel *followLabel;
@property (weak, nonatomic) IBOutlet UILabel *circleLabel;


@end
@implementation BYBShareOrderOfMineHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.iconImageView.layer.cornerRadius = 33;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.image = [UIImage imageNamed:@"defaultheadimage_132x132_"];
    self.iconImageView.backgroundColor = [UIColor redColor];
    
    self.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}
- (IBAction)circleAction:(id)sender {
    
    JXLog(@"circleAction ---   ");
}


@end

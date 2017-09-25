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
@property (weak, nonatomic) IBOutlet JXRelayoutButton *circleBtn;
@property (weak, nonatomic) IBOutlet UILabel *likeNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareOrderNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UILabel *followLabel;


@end
@implementation BYBShareOrderOfMineHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.circleBtn.jx_type = JXRelayoutButtonTypeTop;
    self.circleBtn.imageSize = CGSizeMake(30, 30);
    [self.circleBtn setImage:[UIImage imageNamed:@"umsocial_wechat_timeline"] forState:UIControlStateNormal];
    [self.circleBtn setTitle:@"圈子" forState:UIControlStateNormal];
    
    self.iconImageView.layer.cornerRadius = 33;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.image = [UIImage imageNamed:@"defaultheadimage_132x132_"];
    self.iconImageView.backgroundColor = [UIColor redColor];
    
    
}
- (IBAction)circleAction:(id)sender {
    JXLog(@"circleAction  ------ ");
}

@end

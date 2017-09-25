//
//  BYBNoDataView.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/25.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBNoDataView.h"

@interface BYBNoDataView ()
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (nonatomic, copy) void(^refreshBlock)();
@end
@implementation BYBNoDataView
- (void)setImageName:(NSString *)imageName  desText:(NSString *)desText refreshBtnTitle:(NSString *)refreshBtnTitle refreshBlock:(void(^)())refreshBlock{
    self.desLabel.text = desText;
    self.bgImageView.image = [UIImage imageNamed:imageName];
    [self.refreshBtn setTitle:refreshBtnTitle forState:UIControlStateNormal];
    self.refreshBlock = refreshBlock;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.desLabel.textColor = BYBBGColor;
    self.desLabel.font = [UIFont boldSystemFontOfSize:14];
    
    self.refreshBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.refreshBtn.layer.cornerRadius = 3;
    self.refreshBtn.layer.masksToBounds = YES;
    self.refreshBtn.backgroundColor = BYBThemeColor;
}
- (IBAction)refreshAction:(id)sender {
    
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

@end

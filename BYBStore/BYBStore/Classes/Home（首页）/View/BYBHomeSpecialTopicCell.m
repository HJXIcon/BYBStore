//
//  BYBHomeSpecialTopicCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeSpecialTopicCell.h"
#import "BYBHomeSpecialTopicModel.h"

@interface BYBHomeSpecialTopicCell ()

/** <#注释#>*/
@property (nonatomic, strong) UIImageView *imageV;
@end
@implementation BYBHomeSpecialTopicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.imageV = [[UIImageView alloc]init];
    self.imageV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    self.imageV.layer.masksToBounds = YES;
    self.imageV.layer.cornerRadius = 5;
    
    
}


- (void)setModel:(BYBHomeSpecialTopicModel *)model{
    _model = model;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.strSpecialImage] placeholderImage:BYB_PlaceholderImage];
}


+ (instancetype)cellForTableView:(UITableView *)tableView{
    Class cellClass = NSClassFromString(NSStringFromClass(self));
    id cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (cell == nil) {
        cell = [[cellClass alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(self)];
    }
    return cell;
}


@end

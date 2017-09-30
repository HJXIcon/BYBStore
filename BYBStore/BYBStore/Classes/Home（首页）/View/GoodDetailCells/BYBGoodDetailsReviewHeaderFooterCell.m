//
//  BYBGoodDetailsReviewHeaderCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/30.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailsReviewHeaderFooterCell.h"
@interface  BYBGoodDetailsReviewHeaderCell()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIView *rightView;
@end
@implementation BYBGoodDetailsReviewHeaderCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.leftLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:15 weight:.2] textColor:BYBTEXTColor2 text:@"商品评论" textAlignment:0];
    [self.contentView addSubview:self.leftLabel];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(15);
    }];
    
    
    
    self.rightView = [[UIView alloc]init];
    [self.contentView addSubview:self.rightView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.rightView addGestureRecognizer:tap];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    }];
    
    
    UIImageView *imageView = [JXFactoryTool creatImageView:CGRectZero image:[UIImage imageNamed:@"icon_writereview_infodetail_30x30_"]];
    [self.rightView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(15);
        make.centerY.mas_equalTo(self.rightView);
        make.left.mas_equalTo(self.rightView).offset(10);
    }];
    
    
    UILabel *label = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:15 weight:.2] textColor:BYBThemeColor text:@"写评论" textAlignment:0];
    [self.rightView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.rightView);
        make.left.mas_equalTo(imageView.mas_right).offset(5);
    }];
    
    
}


- (void)tapAction{
    JXLog(@"写评论 ----- ");
}


@end


//// ----------
@interface  BYBGoodDetailsReviewFooterCell()

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@end

@implementation BYBGoodDetailsReviewFooterCell

- (void)setReviewNum:(NSInteger)reviewNum{
    _reviewNum = reviewNum;
    [self.rightBtn setTitle:[NSString stringWithFormat:@"到手评价 %ld",reviewNum] forState:UIControlStateNormal];
}

- (void)setReviewCount:(NSInteger)reviewCount{
    _reviewCount = reviewCount;
    [_leftBtn setTitle:[NSString stringWithFormat:@"比友跟帖 %ld",reviewCount] forState:UIControlStateNormal];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{

    CGFloat btnW = 120;
    CGFloat btnH = 30;
    CGFloat margin = (kScreenW - btnW * 2 - 20) / 2;
    self.leftBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont systemFontOfSize:12 weight:.1] normalColor:BYBTEXTColor2 selectColor:nil title:@"比友跟帖" nornamlImageName:nil selectImageName:nil textAlignment:NSTextAlignmentCenter target:self action:@selector(leftAction)];
    [self.contentView addSubview:self.leftBtn];
    self.leftBtn.layer.borderWidth = 1;
    self.leftBtn.layer.masksToBounds = YES;
    self.leftBtn.layer.cornerRadius = 3;
    self.leftBtn.layer.borderColor = BYBTEXTColor1.CGColor;
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(btnW);
        make.height.mas_equalTo(btnH);
        make.left.mas_equalTo(self.contentView).offset(margin);
    }];
    
    
    self.rightBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont systemFontOfSize:12 weight:.1] normalColor:BYBTEXTColor2 selectColor:nil title:@"到手评价" nornamlImageName:nil selectImageName:nil textAlignment:NSTextAlignmentCenter target:self action:@selector(rightAction)];
    self.rightBtn.layer.borderWidth = 1;
    self.rightBtn.layer.masksToBounds = YES;
    self.rightBtn.layer.cornerRadius = 3;
    self.rightBtn.layer.borderColor = BYBTEXTColor1.CGColor;
    [self.contentView addSubview:self.rightBtn];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftBtn);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-margin);
        make.width.mas_equalTo(btnW);
        make.height.mas_equalTo(btnH);
    }];
    
}



- (void)rightAction{
    
}

- (void)leftAction{
    
}

@end

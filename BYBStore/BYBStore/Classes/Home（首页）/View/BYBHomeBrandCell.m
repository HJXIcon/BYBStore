//
//  BYBHomeBrandCell.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/27.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBHomeBrandCell.h"


@interface BYBHomeBrandCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UICollectionView *collectionView;

@end
@implementation BYBHomeBrandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.iconImageView = [JXFactoryTool creatImageView:CGRectZero image:BYB_PlaceholderImage];
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.width.height.mas_equalTo(45);
    }];
    
    self.titleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont boldSystemFontOfSize:15] textColor:nil text:@"江原道" textAlignment:0];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(8);
    }];
    
    
    self.subTitleLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12] textColor:BYBBGColor text:@"还好四次黑hi安倍hi哦啊我和讴歌奥和哦我啊回复得会" textAlignment:0];
    [self.contentView addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
    
    self.desLabel = [JXFactoryTool creatLabel:CGRectZero font:[UIFont systemFontOfSize:12 weight:.5] textColor:[UIColor grayColor] text:@"十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵十大黑海和多喝哦啊呵呵" textAlignment:0];
    self.desLabel.numberOfLines = 2;
    /// 行间距
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self.desLabel.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:5];
    [attri addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.desLabel.text.length)];
    [self.desLabel setAttributedText:attri];
    
    [self.contentView addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_left);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).offset(10);
        make.width.mas_equalTo(kScreenW - 20);
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(180, 250);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.desLabel.mas_bottom).offset(0);
        make.right.left.bottom.mas_equalTo(self.contentView);
    }];
    
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    return cell;
}



@end

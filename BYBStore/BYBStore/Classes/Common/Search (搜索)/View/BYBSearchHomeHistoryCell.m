//
//  BYBSearchHomeHistoryCell.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/16.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchHomeHistoryCell.h"
#import "JXTagsView.h"

@interface BYBSearchHomeHistoryCell ()
@property (nonatomic, strong) JXTagsView *tagsView;
@property (nonatomic, strong) JXTagsCollectionViewFlowLayout *layout;
@property (nonatomic, strong) JXTagsAttribute *attribute;

@property (nonatomic, strong) UIButton *clearBtn;

@end
@implementation BYBSearchHomeHistoryCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setupUI{
    // tagsView
    self.tagsView = [[JXTagsView alloc]init];
    _attribute = [[JXTagsAttribute alloc]init];
    _attribute.normalTextColor = [UIColor blackColor];
    _attribute.selectedTextColor = [UIColor blackColor];
    _attribute.tagPadding = 20;
    self.tagsView.isMultiSelect = NO;
    self.tagsView.tagAttribute = _attribute;
    _layout = [[JXTagsCollectionViewFlowLayout alloc]init];
    _layout.minimumInteritemSpacing = 10;
    self.tagsView.layout = _layout;
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    MJWeakSelf;
    [self.tagsView setCompletion:^(NSArray <NSString *> *selectArray,NSInteger index){
        if (weakSelf.selectBlock) {
            weakSelf.selectBlock(index);
        }
    }];
    self.tagsView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.tagsView];
    
    
    self.clearBtn = [JXFactoryTool creatButton:CGRectZero font:[UIFont systemFontOfSize:13 weight:.3] normalColor:[UIColor blackColor] selectColor:nil title:@"清空历史搜索" nornamlImageName:@"rubish_icon_12x12_" selectImageName:nil textAlignment:0 target:self action:@selector(clearAction)];
    [self.contentView addSubview:self.clearBtn];
    
    
}


- (void)setTagsArray:(NSArray<NSString *> *)tagsArray{

    _tagsArray = tagsArray;
    self.tagsView.tagsArray = tagsArray;
    [self.contentView layoutSubviews];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat height = [JXTagsView getHeightWithTags:self.tagsArray layout:_layout tagAttribute:_attribute maxWidth:self.bounds.size.width];
    self.tagsView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
    if (height && self.updateCellHeightBlock) {
        self.updateCellHeightBlock(height + 35);
    }
    self.clearBtn.frame = CGRectMake(0, CGRectGetMaxY(self.tagsView.frame), 120, 35);
    self.clearBtn.centerX  = self.centerX;
    
    
}


- (void)clearAction{
    if (self.clearHistoryBlock) {
        self.clearHistoryBlock();
    }
}
@end

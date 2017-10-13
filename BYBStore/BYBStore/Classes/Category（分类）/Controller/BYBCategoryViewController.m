//
//  BYBCategoryViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/23.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBCategoryViewController.h"
#import "BYBSearchBarView.h"
#import "JXPageView.h"
#import "BYBCategoryTitleView.h"
#import "BYBSellingListViewController.h"
#import "BYBCategoryBrandController.h"
#import "BYBCategoryCategoryController.h"
#import "BYBCategoryHotTagModel.h"

@interface BYBCategoryViewController ()<JXPageViewDelegate,BYBCategoryTitleViewDelegate>

@property (nonatomic, weak) JXPageView *pageView;
@property (nonatomic, strong) BYBCategoryTitleView *titleView;
@property (nonatomic, strong) NSArray <BYBCategoryHotTagGroupModel *>*dataArray;

@end

@implementation BYBCategoryViewController
- (BYBCategoryTitleView *)titleView{
    if (_titleView == nil) {
        _titleView = [[BYBCategoryTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
    }
    return _titleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupUI];
    
    [[NSNotificationCenter defaultCenter]addObserverForName:CXBPopNotiName object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [self.pageView titleLabelClick:1];
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:CXBPopNotiName object:nil];
}

#pragma mark - load Data
- (void)loadData{
    // http://openapi.biyabi.com/webservice.asmx/GetHotTagGroupJson
    NSString *URLStr = @"http://openapi.biyabi.com/webservice.asmx/GetHotTagGroupJson";
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        self.dataArray = [BYBCategoryHotTagGroupModel mj_objectArrayWithKeyValuesArray:responseObject];

        
    } failure:^(NSError *error) {
        [self loadData];
    }];

}


#pragma mark - UI
- (void)setupNav{
    BYBSearchBarView *barView = [[BYBSearchBarView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 35)];
    barView.style = BYBSearchBarViewStyleCategory;
    self.navigationItem.titleView = barView;
}

- (void)setupUI{
    NSArray *titles = @[@"分类",@"品牌",@"榜单"];
    JXPageStyle *style = [[JXPageStyle alloc]init];
    style.isNeedScale = NO;
    style.isScrollEnable = NO;
    style.isShowBottomLine = YES;
    style.bottomLineColor = BYBThemeColor;
    style.normalColor = [UIColor blackColor];
    style.selectColor = BYBThemeColor;
    style.titleFont = [UIFont boldSystemFontOfSize:17];
    style.titleHeight = 50;
    
    NSMutableArray *childVcs = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++){
        
        UIViewController *vc;
        switch (i) {
            case 0:
                vc = [[BYBCategoryCategoryController alloc]init];
                
                break;
                
            case 1:
                vc = [[BYBCategoryBrandController alloc]init];
                
                break;
                
            case 2:
                vc = [[UIViewController alloc]init];
                vc.view.backgroundColor = [UIColor whiteColor];
                break;

                
            default:
                break;
        }
       
        [childVcs addObject:vc];
    }
    
    CGRect pageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, kScreenH - 64 - 49);
    
    JXPageView *pageView = [[JXPageView alloc]initWithFrame:pageViewFrame titles:titles style:style childVcs:childVcs parentVc:self];
    pageView.delegate = self;
    _pageView = pageView;
    [self.view addSubview:pageView];
    
    // 覆盖一层
    [self.view addSubview:self.titleView];
    self.titleView.delegate = self;
    
}


#pragma mark - JXPageViewDelegate
- (void)pageViewDidEndScroll:(JXPageView *)pageView indx:(NSInteger)indx{
    [self.titleView titleClick:indx];
    if (indx == 2) {
        [self.navigationController pushViewController:[[BYBSellingListViewController alloc]init] animated:YES];
    }
}

#pragma mark - BYBCategoryTitleViewDelegate
- (void)titleView:(BYBCategoryTitleView *)titleView targetIndex:(NSInteger)targetIndex{
    [self.pageView titleLabelClick:targetIndex];
    
}


@end

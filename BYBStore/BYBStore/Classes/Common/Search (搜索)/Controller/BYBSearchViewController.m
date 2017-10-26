//
//  BYBSearchViewController.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/17.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchViewController.h"
#import <JXDropDownMenu.h>
#import "BYBSearchFilterModel.h"
#import "BYBSearchFilterListModel.h"

@interface BYBSearchViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchControllerDelegate,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource,JXDropDownMenuDataSource,JXDropDownMenuDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UITableView *tableView;

// 数据源数组
@property (nonatomic, strong) NSMutableArray *datas;
// 搜索结果数组
@property (nonatomic, strong) NSMutableArray *results;
/// 提示label
@property (nonatomic, strong) UILabel *msgLabel;

@property (nonatomic, strong) NSMutableArray <BYBSearchFilterModel *> *searchFilters;
@property (nonatomic, weak) JXDropDownMenu *menu;

@property (nonatomic, strong) NSMutableArray <NSMutableArray <NSString *>*> *menuTitles;
@end

@implementation BYBSearchViewController

#pragma mark - lazy load
- (NSMutableArray<NSMutableArray<NSString *> *> *)menuTitles{
    if (_menuTitles == nil) {
        
        _menuTitles = [NSMutableArray arrayWithArray:@[[NSMutableArray arrayWithArray:@[@"所有类别"]],[NSMutableArray arrayWithArray:@[@"所有品牌"]],[NSMutableArray arrayWithArray:@[@"综合排序",@"价格由高到低",@"价格由低到高"]]]];
    }
    return _menuTitles;
}

- (NSMutableArray<BYBSearchFilterModel *> *)searchFilters{
    if (_searchFilters == nil) {
        _searchFilters = [NSMutableArray array];
    }
    return _searchFilters;
}

- (UILabel *)msgLabel{
    if (_msgLabel == nil) {
        _msgLabel = [JXFactoryTool creatLabel:CGRectMake(0, CGRectGetMaxY(self.menu.frame), kScreenW, 30) font:[UIFont systemFontOfSize:10 weight:.1] textColor:[UIColor whiteColor] text:@"" textAlignment:0];
    }
    return _msgLabel;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)datas {
    if (_datas == nil) {
        _datas = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _datas;
}

- (NSMutableArray *)results {
    if (_results == nil) {
        _results = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _results;
}
/***！
 
 //http://www.jianshu.com/p/aa9a153a5b58
 // 初始化方法, 参数是展示搜索结果的控制器, 如果是在当前控制器展示搜索结果, 就传nil
 - (instancetype)initWithSearchResultsController:(nullable UIViewController *)searchResultsController;
 
 // 负责更新搜索结果的代理, 需要遵循 UISearchResultsUpdating 协议
 @property (nullable, nonatomic, weak) id <UISearchResultsUpdating> searchResultsUpdater;
 
 // 搜索控制器是否是活跃状态, 当在一个控制器展示搜索结果的时候, 可以此来判断返回的数据源
 @property (nonatomic, assign, getter = isActive) BOOL active;
 // 控制器代理  遵循 UISearchControllerDelegate协议
 @property (nullable, nonatomic, weak) id <UISearchControllerDelegate> delegate;
 // 当搜索框激活时, 是否添加一个透明视图
 @property (nonatomic, assign) BOOL dimsBackgroundDuringPresentation __TVOS_PROHIBITED;
 @property (nonatomic, assign) BOOL obscuresBackgroundDuringPresentation NS_AVAILABLE_IOS(9_1); // default is YES
 // 当搜索框激活时, 是否隐藏导航条
 @property (nonatomic, assign) BOOL hidesNavigationBarDuringPresentation;     // default is YES
 
 @property (nullable, nonatomic, strong, readonly) UIViewController *searchResultsController;
 @property (nonatomic, strong, readonly) UISearchBar *searchBar;
 
 
 */
- (UISearchController *)searchController{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.delegate = self;
        
        UITextField *searchField = [_searchController.searchBar valueForKey:@"_searchField"];
        searchField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        searchField.contentMode = UIViewContentModeTopLeft;
        searchField.leftViewMode = UITextFieldViewModeAlways;
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        imageView.image = [UIImage imageNamed:@"main_search_40x40_"];
        imageView.center = leftView.center;
        [leftView addSubview:imageView];
        searchField.leftView = leftView;
        
        [searchField setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"searchviewbuttonbg"]]];
        
        searchField.layer.masksToBounds = YES;
        searchField.layer.cornerRadius = 3;
        
        //  搜索图标如何让它一直靠左  -->> 在文字后面加空格的方法。
        NSString *placeholder = [NSString stringWithFormat:@"%@                                                             ",@"女包女"];
        
        NSString *string = [[NSMutableString alloc]initWithString:self.searchText];
        
        if (self.searchText.length < placeholder.length) {
            NSInteger count = placeholder.length - self.searchText.length;
            for (int i = 0; i < count; i ++) {
                
                string = [string stringByAppendingString:@" "];
            }
        }
        searchField.placeholder = string;
        
        
    }
    return _searchController;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

#pragma mark - Cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadData];
}


#pragma mark - Private Method
- (void)setupUI{
    [self.view addSubview:self.collectionView];
    self.navigationItem.titleView = self.searchController.searchBar;
    
    // DOPDropDownMenu
    JXDropDownMenu *menu = [[JXDropDownMenu alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 44)];
    self.menu = menu;
    menu.delegate = self;
    menu.dataSource = self;
    menu.textSelectedColor = BYBThemeColor;
    menu.textNormalColor = BYBTEXTColor2;
    menu.maxMenuContentHeight = kScreenH * 0.6;
    [self.view addSubview:menu];
}

- (void)loadData{
    
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/GetInfoListWithBrandJson_V2?appId=264&bigPrice=0&brandUrl=&brightUrl=&btCountry=0&catUrl=&deviceToken=D7A7D413-5136-4849-A5C6-CF76CB20859C&exceptMallUrl=&homeShow=0&infoNation=0&infoType=0&isPurchasing=1&isTop=1&keyWord=%@&latitude=23.143585&longitude=113.338841&mallUrl=&orderBy=0&pageIndex=1&pageSize=20&smallPrice=0&tagUrl=&userId=19024376",@"钟表"];
    
    NSString *encodedString = [URLStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [PPNetworkHelper GET:encodedString parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
       
        NSString *msg = (NSString *)responseObject[@"message"];
        if (msg.length) {
            [self showMsgLabel:msg removeAfter:2];
            return ;
        }
        
        self.searchFilters = nil;
        for (int i = 0; i < self.menuTitles.count; i ++) {
            if (i == self.menuTitles.count - 1) {
                break;
            }
            NSMutableArray *array = self.menuTitles[i];
            if (array.count > 1) {
                [array removeObjectsInRange:NSMakeRange(1, array.count - 1)];
            }
        }
        
        NSArray *dictArray = responseObject[@"result"][@"filterList"];
        
        [self.searchFilters addObjectsFromArray:[BYBSearchFilterModel mj_objectArrayWithKeyValuesArray:dictArray]];
        __block NSMutableArray *array1 = self.menuTitles[0];
        [self.searchFilters[0].ListHotTag enumerateObjectsUsingBlock:^(BYBSearchFilterListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array1 addObject:obj.strTagName];
        }];
        
        __block NSMutableArray *array2 = self.menuTitles[1];
        [self.searchFilters[1].ListHotTag enumerateObjectsUsingBlock:^(BYBSearchFilterListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array2 addObject:obj.strTagEngName];
        }];
        
        [self.menu reloadData];
        
        
    } failure:^(NSError *error) {
        [self showHint:@"请求失败"];
    }];
}


- (void)showMsgLabel:(NSString *)msg removeAfter:(CGFloat)time{
    
    self.msgLabel.text = msg;
    [self.view addSubview:self.msgLabel];
    [self.view bringSubviewToFront:self.msgLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.msgLabel removeFromSuperview];
    });
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 这里通过searchController的active属性来区分展示数据源是哪个
    if (self.searchController.active) {
        
        return self.results.count ;
    }
    
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    // 这里通过searchController的active属性来区分展示数据源是哪个
    if (self.searchController.active ) {
        
        cell.textLabel.text = [self.results objectAtIndex:indexPath.row];
    } else {
        
        cell.textLabel.text = [self.datas objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.searchController.active) {
        NSLog(@"选择了搜索结果中的%@", [self.results objectAtIndex:indexPath.row]);
    } else {
        
        NSLog(@"选择了列表中的%@", [self.datas objectAtIndex:indexPath.row]);
    }
    
}


#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *inputStr = searchController.searchBar.text ;
    if (self.results.count > 0) {
        [self.results removeAllObjects];
    }
    for (NSString *str in self.datas) {
        
        if ([str.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
            
            [self.results addObject:str];
        }
    }
    
    [self.tableView reloadData];
}


#pragma mark - JXDropDownMenuDataSource
/**
 *  返回 menu 有多少列 ，默认1列
 */
- (NSInteger)numberOfColumnsInMenu:(JXDropDownMenu *)menu{
    return self.menuTitles.count;
}

/**
 *  每一列有多少列Item ， 默认1列
 */
- (NSInteger)menu:(JXDropDownMenu *)menu columnsInColumns:(NSInteger)column{
    if (column == self.menuTitles.count - 1) {
        return 1;
    }
    return 2;
}
/**
 *  返回 menu 第column列有Items
 */
- (NSInteger)menu:(JXDropDownMenu *)menu numberOfItemsInColumn:(NSInteger)column{
    
    return self.menuTitles[column].count;
}

/**
 *  返回 menu 第column列 每个Items的title
 */
- (NSString *)menu:(JXDropDownMenu *)menu titleForItemAtIndexPath:(JXDropDownIndexPath *)indexPath{
    
    return self.menuTitles[indexPath.column][indexPath.item];
}


- (void)menu:(JXDropDownMenu *)menu didSelectItemAtIndexPath:(JXDropDownIndexPath *)indexPath{
    
    NSLog(@"col == %ld,item == %ld",indexPath.column,indexPath.item);
}

@end

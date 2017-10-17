//
//  BYBSearchViewController.m
//  BYBStore
//
//  Created by yituiyun on 2017/10/17.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBSearchViewController.h"

@interface BYBSearchViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchControllerDelegate,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UITableView *tableView;

// 数据源数组
@property (nonatomic, strong) NSMutableArray *datas;
// 搜索结果数组
@property (nonatomic, strong) NSMutableArray *results;


@end

@implementation BYBSearchViewController

#pragma mark - lazy load

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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    [self.view addSubview:self.collectionView];
    self.navigationItem.titleView = self.searchController.searchBar;
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


@end

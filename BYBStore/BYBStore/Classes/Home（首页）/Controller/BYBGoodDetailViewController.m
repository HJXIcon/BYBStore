//
//  BYBGoodDetailViewController.m
//  BYBStore
//
//  Created by 晓梦影 on 2017/9/28.
//  Copyright © 2017年 BYBStore. All rights reserved.
//

#import "BYBGoodDetailViewController.h"
#import "BYBGoodDetailModel.h"
#import "BYBGoodDetailsCell1.h"


@interface BYBGoodDetailViewController ()
/** goodDetailModel*/
@property (nonatomic, strong) BYBGoodDetailModel *goodDetailModel;
@end

@implementation BYBGoodDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商品详情";
    [self loadData];
    self.tableView.backgroundColor = BYBBGColor;
}


#pragma mark - load Data
- (void)loadData{
    
    [BYBLoadingView showInView:self.view];
    NSString *URLStr = [NSString stringWithFormat:@"http://openapi.biyabi.com/webservice.asmx/GetNewInfoDetial?iInfoID=%@&userId=19024376",self.iInfoID];
    [PPNetworkHelper GET:URLStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        [BYBLoadingView dismissInView:self.view];
        self.goodDetailModel = [BYBGoodDetailModel mj_objectWithKeyValues:responseObject];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        [BYBLoadingView dismissInView:self.view];
        [self showHint:@"请求失败"];
    }];
    
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        {
            BYBGoodDetailsCell1 *cell = [BYBGoodDetailsCell1 cellForTableView:tableView];
            cell.model = self.goodDetailModel.GetInfoData;
            return cell;
        }
            break;
            
        default:
            break;
    }
    
    static NSString *const cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"section == %ld,row == %ld",indexPath.section,indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return  580;
            break;
            
        default:
            return  44;
            break;
    }
    
}

#pragma mark - footer/header
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return section == 6 ?  0.00001 : 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}

@end

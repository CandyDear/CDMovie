//
//  CinemaViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "CinemaViewController.h"
#import "District.h"
#import "Cinema.h"
#import "CinemaCellTableViewCell.h"

@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_districtData;
    
    UITableView *_tableView;
}

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"影院";
    
    [self loadData];
    
    [self _creatView];
    
}
#pragma mark - loadData
-(void)loadData
{
    //读取地区数据
   NSDictionary *dicDistrict = [BaseJSON readJSONFile:@"district_list"];
    NSArray *districtList = dicDistrict[@"districtList"];
    _districtData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic1 in districtList) {
        District *district = [[District alloc] initContentWithDic:dic1];
        [_districtData addObject:district];
    }
    //读取电影院数据
    NSDictionary *dicCinema = [BaseJSON readJSONFile:@"cinema_list"];
    NSArray *cinamaList = dicCinema[@"cinemaList"];
    for (NSDictionary *dic2 in cinamaList) {
        Cinema *cinema = [[Cinema alloc] initContentWithDic:dic2];
        for(District *dis in _districtData)
        {
            if([dis.districtID isEqualToString:cinema.districtId])
            {
                [dis.cinemas addObject:cinema];
                break;
            }
        }
    }
}
#pragma mark - _creatView
-(void)_creatView
{

    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor blackColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tag = 1000;
    [self.view addSubview:_tableView];
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _districtData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出地区中电影院的个数
    District* dis = _districtData[section];
    if (dis.isShow) {
        
        return dis.cinemas.count;
    }
    return 0;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinemaCell"];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CinemaCellTableViewCell" owner:self options:nil]lastObject];
        
        
    }
    District *district = _districtData[indexPath.section];
    NSArray *cinemas = district.cinemas;
    cell.cinema = cinemas[indexPath.row];
    return cell;
}
#pragma mark - 高度
//头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 42;
}
//单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    District *dis = _districtData[section];
    NSString *string = dis.name;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage"] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    button.tag = section;
    return button;
}
#pragma mark - 分组展开，收起
-(void)buttonAction:(UIButton *)sender
{
    //获取对应小组的索引
    NSInteger section = sender.tag;
    //每一次点击，展开状态取反
    District *dis = _districtData[section];
    dis.isShow = !dis.isShow;
    //刷新对应的分组
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:section];
    [_tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

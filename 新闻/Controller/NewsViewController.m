//
//  NewsViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "News.h"
#import "NewsImageViewController.h"
#import "NewsWebViewController.h"

@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_listView;
    NSMutableArray *_newsData;
    UIImageView *_topImageView;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"新闻";

    [self loadData];
}
-(void)loadData
{
   
    NSArray *array = [BaseJSON readJSONFile:@"news_list"];
    _newsData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array)
    {
        News *news = [[News alloc]initContentWithDic:dic];
        [_newsData addObject:news];
    }
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _newsData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // 在storyboard读取单元格
    /*
     如何从故事版中 创建单元格
     1.在故事版中 绘制表视图
     2.在表视图上添加单元格 并自定义单元格上的控jian
     3。给单元格设定id
     4.在代码中使用dequeueReusableCellWithIdentifier:来读取单元格
     */
    News *news = _newsData[indexPath.row];
    if(indexPath.row == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopNewsCell"];
        //取tag值
        _topImageView= (UIImageView *) [cell.contentView viewWithTag:100];
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:101];
        //取出对应信息
        label.text = news.title;
        [_topImageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        return cell;
    }
    else
    {
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
        cell.titleLabel.text = news.title;
        [cell.newsImage sd_setImageWithURL:[NSURL URLWithString:news.image]];
        cell.summaryLabel.text = news.summary;
        if([news.type isEqualToNumber:@0])
        {
            
        }
        if([news.type isEqualToNumber:@1])
        {
            cell.typeImage.image = [UIImage imageNamed:@"sctpxw"];
            
        }
        if([news.type isEqualToNumber:@2])
        {
            cell.typeImage.image = [UIImage imageNamed:@"scspxw"];
        }

        
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return 150;
    }
    else
    {
        return 60;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *news = _newsData[indexPath.row];
    if([news.type isEqualToNumber:@0])
    {
        [self.navigationController pushViewController:[[NewsWebViewController alloc]init] animated:YES];
    }
    if([news.type isEqualToNumber:@1])
    {
        [self.navigationController pushViewController:[[NewsImageViewController alloc] init]
          animated:YES];
        
        
    }
    if([news.type isEqualToNumber:@2])
    {
    }
    
}
#pragma mark - 滑动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获得滑动视图的偏移量y
    CGFloat yOffset = scrollView.contentOffset.y + 64;
//    NSLog(@"y = %f",yOffset);
    if(yOffset < 0)
    {
        //图片的原始高度
        CGFloat oldImageHeight = 150;
        //图片变化后的高度
        CGFloat newImageHeight = 150 - yOffset;
        //放大的比例
        CGFloat scale = newImageHeight / oldImageHeight;
        //放大图片
        CGAffineTransform transform = CGAffineTransformMakeScale ( scale, scale);
        _topImageView.transform = transform;
        //改变图片的位置
        _topImageView.top = yOffset;
        
    }
    else
    {
        //为了 保险 对视图进行还原
        _topImageView.transform = CGAffineTransformIdentity;
    }
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

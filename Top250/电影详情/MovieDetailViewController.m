//
//  MovieDetailViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/29.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "Comment.h"
#import "CommentCell.h"
#import "DetailHeadView.h"

@interface MovieDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    
    NSMutableArray *_commentData;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"电影详情";
    
    [self loadData];
    //读取xib
    DetailHeadView *head = [[[NSBundle mainBundle] loadNibNamed:@"DetailHeadView" owner:nil options:nil]lastObject];
    
    head.navigationController = self.navigationController;
    _tableView.backgroundColor = [UIColor blackColor];
    _tableView.tableHeaderView = head;
    
}
-(void)loadData
{
    //读取评论数据
    NSDictionary *dic = [BaseJSON readJSONFile:@"movie_comment"];
    NSArray *array = dic[@"list"];
    _commentData = [[NSMutableArray alloc] init];
    for(NSDictionary *dictionary in array)
    {
        Comment *comment = [[Comment alloc] initWithContentsOfDictionary:dictionary];
        [_commentData addObject:comment];
    }
    
    
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _commentData.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    if(cell == nil)
    {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"commentCell"];
    }
    cell.comment = _commentData[indexPath.row];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //计算字符label高度
    //拿到当前的评论对象
    Comment *comment = _commentData[indexPath.row];
    if(comment.isShow)
    {
    //评论的内容
    NSString *contentString = comment.content;
    //根据字符串的长度 计算label的大小
    CGSize maxSize = CGSizeMake(kScreenWidth - 20, CGFLOAT_MAX);
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
    CGRect rect = [contentString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect.size.height + 100;
    }
    else
    {
        return 80;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //改变这条数据的显示状态
    Comment *comment = _commentData[indexPath.row];
    comment.isShow = !comment.isShow;
    //刷新单元格
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

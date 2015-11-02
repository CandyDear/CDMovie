//
//  DetailHeadView.m
//  CDMovie
//
//  Created by mac04 on 15/8/30.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "DetailHeadView.h"
#import "UIButton+WebCache.h"
//系统提供的视频播放框架
#import <MediaPlayer/MediaPlayer.h>
@interface DetailHeadView()
{
    NSDictionary *_data;
}
@end
@implementation DetailHeadView


-(void)awakeFromNib
{
    [self loadData];
    
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.layer.cornerRadius = 5;
    _scrollView.layer.borderColor = [UIColor yellowColor].CGColor;
    _scrollView.layer.borderWidth = 2;
    NSArray *array = _data[@"images"];
    CGFloat width  = _scrollView.height - 10;
    for(int i = 0;i < array.count;i++)
    {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(i * (width + 5) + 5, 5, width, width)];
        [view sd_setImageWithURL:[NSURL URLWithString:array[i]]];
        [_scrollView addSubview:view];
    }
    _scrollView.contentSize = CGSizeMake(5 + (width + 5) *6, 0);
    
}
-(void)loadData
{
    _data = [BaseJSON readJSONFile:@"movie_detail"];
    NSURL *url = [NSURL URLWithString:_data[@"image"]];
    [_imageButton sd_setImageWithURL:url forState:UIControlStateNormal];
    
    _titleLabel.text = _data[@"titleCn"];
    
    NSArray *directorsArray = _data[@"directors"];
    _directorsLabel.text = [NSString stringWithFormat:@"导演: %@",[directorsArray componentsJoinedByString:@","]];
    
    NSArray *actorsArray = _data[@"actors"];
    _actorsLabel.text = [NSString stringWithFormat:@"演员: %@",[actorsArray componentsJoinedByString:@","]];

    NSArray *typeArray = _data[@"type"];
    _typeLabel.text = [NSString stringWithFormat:@"类型: %@",[typeArray componentsJoinedByString:@"," ]];
    _yearLabel.text = [NSString stringWithFormat:@"上映年份: %@",_data[@"year"]];
    
}
- (IBAction)imageButtonAction:(id)sender
{
    //播放视频
//    NSArray *videos = _data[@"videos"];
    
    MPMoviePlayerViewController  *moviePlayer = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString: @"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"]];
    [self.navigationController pushViewController:moviePlayer animated:YES];
}
@end

//
//  MovieCell.m
//  CDMovie
//
//  Created by mac04 on 15/8/21.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "MovieCell.h"
#import "Movie.h"
#import "StarView.h"

@implementation MovieCell

//覆写setMovie方法
-(void)setMovie:(Movie *)movie
{
    _movie = movie;
    //将电影model对象中存储的数据取出来显示到label imageView
    _titleLabel.text = _movie.titleC;
    _yearLabel.text = [NSString stringWithFormat:@"上映年份:%@",_movie.year];
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_movie.rating];
    //从网络读取图片
    //创建url
    NSString *urlString = _movie.images[@"small"];
    NSURL *url = [NSURL URLWithString:urlString];
    [_movieImageView sd_setImageWithURL:url];
    
    //创建星星，使StarView适应于自定义的_starView的大小位置并且评分适应_movie.rating
    StarView *star = [[StarView alloc] initWithFrame:_starView.frame];
    [self addSubview:star];
                      
    star.rating = _movie.rating;

    
  
    
    
    
}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

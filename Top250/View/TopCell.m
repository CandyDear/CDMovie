//
//  TopCell.m
//  CDMovie
//
//  Created by mac04 on 15/8/24.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell


-(void)setMovie:(Movie *)movie
{
    //填充数据
    _movie = movie;
    [_topImageView sd_setImageWithURL:[NSURL URLWithString:movie.images[@"medium"]]];
    _titleLabel.text = _movie.titleC;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_movie.rating];
    _starView.rating = _movie.rating;
//    //创建星星，使StarView适应于自定义的_starView的大小位置并且评分适应_movie.rating
//    StarView *star = [[StarView alloc] initWithFrame:_starView.frame];
//    [self addSubview:star];
//    
//    star.rating = _movie.rating;
}

@end

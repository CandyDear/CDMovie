//
//  HeadImageCell.m
//  CDMovie
//
//  Created by mac04 on 15/8/26.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "HeadImageCell.h"
@interface HeadImageCell()
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;

@end
@implementation HeadImageCell
-(void)setMovie:(Movie *)movie
{
    _movie = movie;
    NSURL *url = [NSURL URLWithString:_movie.images[@"small"]];
    [_headImageView sd_setImageWithURL:url];
}
- (void)awakeFromNib {
    // Initialization code
}

@end

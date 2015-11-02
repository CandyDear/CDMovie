//
//  PostCell.m
//  CDMovie
//
//  Created by mac04 on 15/8/26.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "PostCell.h"
#import "StarView.h"
@interface PostCell()

@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UIImageView *smallImageView;
@property (strong, nonatomic) IBOutlet UILabel *CNTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *ENTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *yearLabel;

@property (strong, nonatomic) IBOutlet StarView *starView;


@end
@implementation PostCell
-(void)setMovie:(Movie *)movie
{
    _movie = movie;
    NSURL *url = [NSURL URLWithString:_movie.images[@"large"]];
    [_bigImageView sd_setImageWithURL:url];
    [_smallImageView sd_setImageWithURL:url];
    _CNTitleLabel.text = _movie.titleC;
    _ENTitleLabel.text = _movie.titleE;
    _yearLabel.text = _movie.year;
    _starView.rating = _movie.rating;
}
-(void)filpCell
{
    [UIView transitionWithView:self
                      duration:0.35
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        _bigImageView.hidden = !_bigImageView.hidden;
    
                        }
                    completion:nil];
}
-(void)backCell
{
    _bigImageView.hidden = NO;
}
- (void)awakeFromNib {
    // Initialization code
}

@end

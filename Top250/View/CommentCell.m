//
//  CommentCell.m
//  CDMovie
//
//  Created by mac04 on 15/8/30.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

-(void)setComment:(Comment *)comment
{
    _comment = comment;
    _nickNameLabel.text = _comment.nickName;
    _ratingLabel.text = _comment.rating;
    _contentLabel.text = _comment.content;
    NSString *urlString = _comment.userImage;
    NSURL *url = [NSURL URLWithString:urlString];
    

    [_userImageView sd_setImageWithURL:url];
    _view.layer.cornerRadius = 5;
    _view.layer.borderWidth = 3;
    _view.layer.borderColor = [UIColor purpleColor].CGColor;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

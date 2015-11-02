//
//  CommentCell.h
//  CDMovie
//
//  Created by mac04 on 15/8/30.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
@interface CommentCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIView *view;

@property(nonatomic,strong) Comment *comment;
@end

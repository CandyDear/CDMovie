//
//  NewsCell.h
//  CDMovie
//
//  Created by mac04 on 15/8/23.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *newsImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UIImageView *typeImage;

@end

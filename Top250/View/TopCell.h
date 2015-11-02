//
//  TopCell.h
//  CDMovie
//
//  Created by mac04 on 15/8/24.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "Movie.h"
@interface TopCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *topImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet StarView *starView;


@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property(nonatomic,strong)Movie *movie;
@end

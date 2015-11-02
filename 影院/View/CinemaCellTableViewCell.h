//
//  CinemaCellTableViewCell.h
//  CDMovie
//
//  Created by mac04 on 15/8/29.
//  Copyright (c) 2015年 mac04. All rights reserved.
//
/*
 @property(nonatomic,copy)NSString *isSeatSupport;//有座 1
 @property(nonatomic,copy)NSString *isCouponSupport;//有券 1
 @property(nonatomic,copy)NSString *isImaxSupport;//imax 1
 @property(nonatomic,copy)NSString *isGroupBuySupport;//团购 1
 */
#import <UIKit/UIKit.h>
#import "Cinema.h"
@interface CinemaCellTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *grade;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *price;


@property (strong, nonatomic) IBOutlet UIImageView *seatImageView;
@property (strong, nonatomic) IBOutlet UIImageView *couponImageView;
@property (strong, nonatomic) IBOutlet UIImageView *imaxImageView;
@property (strong, nonatomic) IBOutlet UIImageView *groupImageView;

@property (nonatomic,strong) Cinema *cinema;
@end

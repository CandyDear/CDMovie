//
//  CinemaCellTableViewCell.m
//  CDMovie
//
//  Created by mac04 on 15/8/29.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "CinemaCellTableViewCell.h"

@implementation CinemaCellTableViewCell


-(void)setCinema:(Cinema *)cinema
{
    _cinema = cinema;
    //label
    _name.text = _cinema.name;
    _grade.text = _cinema.grade;
    _address.text = _cinema.address;
    if (_cinema.lowPrice.length == 0) {
        _price.text = @"暂无报价";
    }
    else
    {
        _price.text = [NSString stringWithFormat:@"¥%@",_cinema.lowPrice];
        
    }
    //imageView
    _couponImageView.hidden = [_cinema.isCouponSupport isEqualToString:@"0"];
    _seatImageView.hidden = [_cinema.isSeatSupport isEqualToString:@"0"];
    _groupImageView.hidden = [_cinema.isGroupBuySupport isEqualToString:@"0"];
    _imaxImageView.hidden = [_cinema.isImaxSupport isEqualToString:@"0"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

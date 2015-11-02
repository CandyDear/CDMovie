//
//  BigImageCell.h
//  CDMovie
//
//  Created by mac04 on 15/8/25.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageCell : UICollectionViewCell

@property(nonatomic,strong) NSURL *imageURL;//单元格中的imageView显示的图片

-(void)backImageZoomingScale;
@end

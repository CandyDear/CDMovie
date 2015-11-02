//
//  PostCell.h
//  CDMovie
//
//  Created by mac04 on 15/8/26.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@interface PostCell : UICollectionViewCell
@property(nonatomic,strong) Movie *movie;
//翻转单元格
-(void)filpCell;
//取消翻转
-(void)backCell;
@property(nonatomic,assign)NSInteger headIndex;
@end

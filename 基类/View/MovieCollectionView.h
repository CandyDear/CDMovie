//
//  MovieCollectionView.h
//  CDMovie
//
//  Created by mac04 on 15/8/29.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionView : UICollectionView
@property(nonatomic,assign) CGSize itemSize;

@property(nonatomic,assign) NSInteger index;//关联的index，两个视图对应的页码
@end

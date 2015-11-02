//
//  BigImageViewController.h
//  CDMovie
//
//  Created by mac04 on 15/8/25.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "BaseViewController.h"

@interface BigImageViewController : BaseViewController

@property(nonatomic,strong)NSArray *bigImageData;//接受newsImage传来的数据
@property(nonatomic,strong)NSIndexPath *indexPath;//纪录前一个页面点击的单元格

@end

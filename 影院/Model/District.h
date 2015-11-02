//
//  District.h
//  CDMovie
//
//  Created by mac04 on 15/8/28.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "BaseModel.h"

@interface District : BaseModel
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *districtID;

@property(nonatomic,strong) NSMutableArray *cinemas;//地区中所有的电影院

@property(nonatomic,assign) BOOL isShow;
@end

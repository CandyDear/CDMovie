//
//  District.m
//  CDMovie
//
//  Created by mac04 on 15/8/28.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "District.h"

@implementation District
-(id)initContentWithDic:(NSDictionary *)jsonDic
{
    //调用父类的初始化方法，来加载属姓名和key相同的数据
    self = [super initContentWithDic:jsonDic];
    if (self)
    {
        //手动加载 名字不相同的数据
        self.districtID = jsonDic[@"id"];
        //初始化电影院数组
        
        _cinemas = [[NSMutableArray alloc] init];
        
    }
    return self;
}

@end

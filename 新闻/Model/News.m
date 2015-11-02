//
//  News.m
//  CDMovie
//
//  Created by mac04 on 15/8/22.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "News.h"

@implementation News
/*
 属性名与json字典中key的映射关系
 key:  json字典的key名
 value: model对象的属性名
 */
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
    //添加key和model中属姓名的映射关系
    [mapDic setObject:@"newsID" forKey:@"id"];
    return mapDic;
}

@end

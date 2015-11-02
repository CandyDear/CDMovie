//
//  News.h
//  CDMovie
//
//  Created by mac04 on 15/8/22.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface News : BaseModel
/*
 {
 "id" : 1491552,
 "type" : 1,
 "image" : "http://img31.mtime.cn/mg/2012/06/28/112005.28198250.jpg",
 "title" : "《小律师有大作为》宣传海报",
 "summary" : "小律师有大作为,TNT,律政剧"
 }
 */
@property(nonatomic,strong)NSNumber *newsID;
@property(nonatomic,strong)NSNumber *type;//新闻类型：0是普通，1是图片，2是视屏
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary;//新闻简介
@property(nonatomic,copy)NSString *image;

@end

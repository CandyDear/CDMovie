//
//  BaseJSON.m
//  CDMovie
//
//  Created by mac04 on 15/8/22.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "BaseJSON.h"

@implementation BaseJSON
+(id)readJSONFile:(NSString *)fileName
{
    //1.获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    //2.读取文件
    NSData *data = [NSData dataWithContentsOfFile:filePath];
  
    //3.文件解析
    //JSONKit TouchJSON SBJSON 第三方解析器
    //NSJON 苹果公司自己开发的解析器 稳定 高效 不需要第三方解析器
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil ];
    return json;
}
@end

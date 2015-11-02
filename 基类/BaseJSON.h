//
//  BaseJSON.h
//  CDMovie
//
//  Created by mac04 on 15/8/22.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseJSON : NSObject
//读取JSON文件
+(id)readJSONFile:(NSString *)fileName;
@end

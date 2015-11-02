//
//  Comment.h
//  CDMovie
//
//  Created by mac04 on 15/8/27.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject
@property(nonatomic,copy) NSString *userImage;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *content;

@property(nonatomic,assign)BOOL isShow;
-(id)initWithContentsOfDictionary:(NSDictionary *)dictionary;
+(id)CommentWithContentsOfDictionary:(NSDictionary *)dictionary;


@end

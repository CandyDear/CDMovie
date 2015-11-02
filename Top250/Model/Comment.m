//
//  Comment.m
//  CDMovie
//
//  Created by mac04 on 15/8/27.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "Comment.h"

@implementation Comment
-(id)initWithContentsOfDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        _userImage =dictionary[@"userImage"];
        _nickName = dictionary[@"nickname"];
        _rating = dictionary[@"rating"];
        _content = dictionary[@"content"];
    }
    return self;
}
+(id)CommentWithContentsOfDictionary:(NSDictionary *)dictionary
{
    return [[Comment alloc]initWithContentsOfDictionary:dictionary];
}
@end

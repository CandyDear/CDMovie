//
//  Movie.h
//  CDMovie
//
//  Created by mac04 on 15/8/21.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
@interface Movie : UIButton
//中文名
@property(nonatomic,copy) NSString *titleC;
//英文名
@property(nonatomic,copy) NSString *titleE;
//上映时间
@property(nonatomic,copy) NSString *year;
//图片
@property(nonatomic,copy) NSDictionary *images;
//评分
@property(nonatomic,assign) CGFloat rating;

-(id)initWithContentsOfDictionary:(NSDictionary *)dictionary;
+(id)MovieWithContentsOfDictionary:(NSDictionary *)dictionary;


@end

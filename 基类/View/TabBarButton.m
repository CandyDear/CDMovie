//
//  TabBarButton.m
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "TabBarButton.h"

@implementation TabBarButton
-(id)initWithTitle:(NSString *)title imageName:(NSString *)imageName fram:(CGRect)fram
{
    self = [super initWithFrame:fram];
    if(self)
    {
        //创建图片和label
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((fram.size.width - 20)/2, 8, 20, 22)];
        imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:imageView];
        //拉伸图片
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, fram.size.width,15)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  TabBarButton.h
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarButton : UIButton
/*
 * 初始化方法
 * title 按钮下部的文字
 * imageName 按钮上部图片名
 */

-(id)initWithTitle:(NSString *)title
         imageName:(NSString *)imageName
              fram:(CGRect)fram;

@end

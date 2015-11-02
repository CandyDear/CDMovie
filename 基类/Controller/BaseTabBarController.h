//
//  BaseTabBarController.h
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController
/**
 *  设置自定义的标签栏是否隐藏
 *
 *  @param hidden    是否隐藏
 *  @param animation 是否添加动画
 */
-(void)setTabBarHidden:(BOOL)isHidden;
@end

//
//  BaseViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    UILabel *_titleLabel;
    BOOL _isHiddenTabBar;//此界面 是否隐藏标签栏
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //自定义title
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:24];
    _titleLabel.text = self.title;
    self.navigationItem.titleView = _titleLabel;
    //设置背景图片
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

-(void)setTitle:(NSString *)title
{
    // _title 是一个 @package 修饰的属性 所以不能直接修改
    // _title = title;
    // 所以需要使用父类中的setTitle方法来修改_title
    [super setTitle:title];
    _titleLabel.text = title;
}

#pragma  mark - 标签栏的隐藏和显示控制
- (void)viewWillAppear:(BOOL)animated
{
    if (_isHiddenTabBar)
    {
        // 隐藏标签栏
        BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
        [tab setTabBarHidden:YES];
    }
    else
    {
        // 显示标签栏
        BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
        [tab setTabBarHidden:NO];
    }
}


- (void)viewWillDisappear:(BOOL)animated
{
    // 显示标签栏
    BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
    [tab setTabBarHidden:NO];
}


- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
{
    _isHiddenTabBar = hidesBottomBarWhenPushed;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

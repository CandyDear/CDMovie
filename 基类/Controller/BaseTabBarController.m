//
//  BaseTabBarController.m
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//
#import "BaseTabBarController.h"
#import "TabBarButton.h"
@interface BaseTabBarController ()
{
    //自定义标签栏
    UIView *_myTabBar;
    //选中图片
    UIImageView *_selectedImageView;
}
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTabBar];
    
}
/**
 *  设置自定义的标签栏是否隐藏
 *
 *  @param hidden    是否隐藏
 *  @param animation 是否添加动画
 */

-(void)setTabBarHidden:(BOOL)isHidden
{
        /*if (animation)
        {
            //隐藏动画
            [UIView animateWithDuration:.3 animations:^{
                if (hidden)
                {
                    _myTabBar.top = kScreenHeight;
                }
                else
                {
                    _myTabBar.bottom = kScreenHeight;
                }
            }];
        }
        else
        {
            if (hidden)
            {
                _myTabBar.top = kScreenHeight;
            }
            else
            {
                _myTabBar.bottom = kScreenHeight;
            }
    
            
        }*/
    _myTabBar.hidden = isHidden;
}

-(void)_createTabBar
{
    //隐藏系统自带的tabBar
    self.tabBar.hidden = YES;
    //自定义tabBar
    _myTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    _myTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg_all"]];
    [self.view addSubview:_myTabBar];
    
    //添加自定义按钮
    //计算按钮宽度
    CGFloat buttonWidth = kScreenWidth/self.viewControllers.count;
    
    //创建选中图片
    _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 49)];
    _selectedImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [_myTabBar addSubview:_selectedImageView];
    

    NSArray *titles = @[@"电影",@"新闻",@"Top",@"影院",@"更多"];
    NSArray *imageNames = @[@"movie_home",
                           @"msg_new",
                           @"start_top250",
                           @"icon_cinema",
                           @"more_setting"];
    for (int i = 0;i < self.viewControllers.count;i ++)
    {
        //创建一个子类化按钮
        TabBarButton *button = [[TabBarButton alloc] initWithTitle:titles[i] imageName:imageNames[i] fram:CGRectMake(i * buttonWidth, 0, buttonWidth, 49)];
        button.tag = i + 100;
        [button addTarget:self
                   action:@selector(buttonAction:)
         forControlEvents:UIControlEventTouchUpInside];
        //将这个按钮添加到标签栏上去
        [_myTabBar addSubview:button];
    }
    }
#pragma mark - 按钮点击事件
-(void)buttonAction:(UIButton *)sender
{
    NSInteger index = sender.tag - 100;
    //切换到对应的子视图控制器
    self.selectedIndex = index;
    //滑动选中的图片视图

//   CGRect fram = CGRectMake(index * sender.frame.size.width, 0, sender.frame.size.width, 49);
    [UIView animateWithDuration:0.35 animations:^{
        
//        _selectedImageView.frame = fram;
        _selectedImageView.center = sender.center;
    }];
    
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

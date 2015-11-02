//
//  LaunchViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/31.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(showImageView:) userInfo:nil repeats:YES];
}

#pragma mark - 隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
#pragma mark -  显示图片
-(void)showImageView:(NSTimer *)timer
{
    static NSInteger i = 1;
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:i];
    //显示这个ImageView
    imageView.hidden = NO;
    i++;
    if (i == 25)
    {
        [timer invalidate];
        // 延迟0.5秒 跳转到主界面
        [self performSelector:@selector(jumpToMainViewController) withObject:nil afterDelay:0.5];
    }
}
#pragma mark - 跳转到主页面
-(void)jumpToMainViewController
{
    //读取故事版 获取ViewController
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //从故事版中 第一个ViewController
    UIViewController *vc = [storyboard instantiateInitialViewController];
    //获取当前控制器的_view 所显示在哪个窗口上
    self.view.window.rootViewController = vc;
    //界面显示动画
    vc.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:.3 animations:^{
        vc.view.transform = CGAffineTransformIdentity;
    }];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:@YES forKey:@"first"];
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

//
//  FirstViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/31.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "FirstViewController.h"
#import "LaunchViewController.h"
@interface FirstViewController ()<UIScrollViewDelegate>
{
    UIImageView *_guideProgressImageView;
    UIButton *_enterButton;
}



@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createView];

}
-(void)_createView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(kScreenWidth * 5, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    //反弹效果
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    for (int i = 1; i < 6; i++)
    {

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((i - 1) * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        NSString *imageName = [NSString stringWithFormat:@"guide%i",i];
        
        imageView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
    }
    //进度显示条
    _guideProgressImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - 86.5) / 2, kScreenHeight - 40, 86.5, 13)];
    _guideProgressImageView.image = [UIImage imageNamed:@"guideProgress1"];
    [self.view addSubview:_guideProgressImageView];
    //按钮
    _enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _enterButton.frame = CGRectMake((kScreenWidth - 150 ) / 2, kScreenHeight - 100, 150, 20);
    [_enterButton setTitle:@"欢迎进入" forState:UIControlStateNormal];
    _enterButton.backgroundColor = [UIColor orangeColor];
    _enterButton.layer.cornerRadius = 5;
    _enterButton.hidden = YES;
    [_enterButton addTarget:self
                     action:@selector(buttonAction)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_enterButton];
 

    
    }
#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算当前偏移量
    CGFloat xOffset = scrollView.contentOffset.x;
    //计算当前实现的页码
    NSInteger index = xOffset / kScreenWidth;
    //改变图片
    NSString *imageName = [NSString stringWithFormat:@"guideProgress%li",index + 1];
    _guideProgressImageView.image = [UIImage imageNamed:imageName];
    _enterButton.hidden = !(index == 4);
    
}
-(void)buttonAction
{
    //设定应用程序为是第一次运行
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"first"];
    //跳转到主页面
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

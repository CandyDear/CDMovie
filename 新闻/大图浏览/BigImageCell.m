//
//  BigImageCell.m
//  CDMovie
//
//  Created by mac04 on 15/8/25.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "BigImageCell.h"
#import "BigImageViewController.h"
@interface BigImageCell()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;//底层滑动视图，用来实现图片的捏合
    UIImageView *_imageView;
    NSTimer *_timer;

}
@end
@implementation BigImageCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self _createViews];
    }
    return self;
}

-(void)_createViews
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.contentSize = self.frame.size;
    //设置缩放倍数
    _scrollView.maximumZoomScale = 3;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.delegate = self;
    
    [self.contentView addSubview:_scrollView];
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
//    _imageView.image = [UIImage imageNamed:@"1"];
    [_scrollView addSubview:_imageView];
    //图片的拉伸模式
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //创建手势识别器
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTapAction)];
    oneTap.numberOfTapsRequired = 1;
    oneTap.numberOfTouchesRequired = 1;
    //将手势识别器 添加到某个视图上
    [_imageView addGestureRecognizer:oneTap];
    //给图片视图 开启点击事件
    _imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *twoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoTapAction)];
    twoTap.numberOfTapsRequired = 2;
    twoTap.numberOfTouchesRequired = 1;
    //将手势识别器 添加到某个视图上
    [_imageView addGestureRecognizer:twoTap];
    //给图片视图 开启点击事件
    _imageView.userInteractionEnabled = YES;
}
#pragma mark - 手势的点击方法
//单击时执行的方法
-(void)oneTapAction
{
    //单击
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                              target:self
                                            selector:@selector(oneAction)
                                            userInfo:nil
                                             repeats:NO];
    
 
}
//单击之后 延迟调用执行的方法
-(void)oneAction
{
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tap" object:nil];
  
}
-(void)twoTapAction
{
    [_timer invalidate];
    if (_scrollView.zoomScale > 1)
    {
        [_scrollView setZoomScale:1 animated:YES];
    }
    else
    {
        [_scrollView setZoomScale:3 animated:YES];
    }
}
#pragma mark - UIScrollViewDelegate
//返回捏合手势的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}
-(void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [_imageView sd_setImageWithURL:_imageURL];
}
-(void)backImageZoomingScale
{
//    _scrollView.zoomScale = 1;
    [_scrollView setZoomScale:1];
    
}
@end


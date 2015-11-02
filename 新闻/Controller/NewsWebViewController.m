//
//  NewsWebViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/31.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "NewsWebViewController.h"

@interface NewsWebViewController ()

@end

@implementation NewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"网页新闻";
    //UIWebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    //-----使用UIWebView加载一个网页
    //URL网络地址
    NSURL *url = [NSURL URLWithString:@"http://lol.qq.com"];
    //网络请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    //使用一个网络请求 来加载网页
    [webView loadRequest:request];
    webView.scalesPageToFit = YES;
   /*
    //-----使用HTML字符串加载页面-----
    //1.读取HTML文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    //2.读取文件数据
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //3.加载 页面
    [webView loadHTMLString:htmlString baseURL:nil];
    */
    //1.读取文件
    //读取HTML文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    //读取文件数据
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //读取新闻数据json文件
    NSDictionary *dic = [BaseJSON readJSONFile:@"news_detail"];
    //2.拼接HTML字符串
    //读取网页需要使用的相关数据
    NSString *title = dic[@"title"];
    NSString *content = dic[@"content"];
    NSString *time = dic[@"time"];
    NSString *source = dic[@"source"];
    htmlString = [NSString stringWithFormat:htmlString,title,content,time,source];
    //3.加载 页面
    [webView loadHTMLString:htmlString baseURL:nil];
    
    
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

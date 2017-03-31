//
//  ViewController.m
//  Demo_Refresh
//
//  Created by sajiner on 2017/3/28.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "XPageView.h"
#import "XTitleViewConfig.h"
#import "XTitleView.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    [button setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:button];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *titles = @[@"头条", @"新闻娱乐", @"娱乐", @"娱乐", @"新闻娱乐", @"娱乐", @"娱乐", @"新闻娱乐", @"娱乐", @"娱乐"];
    NSMutableArray *childVcs = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
        [self addChildViewController:vc];
        [childVcs addObject:vc];
    }
    XPageView *pageView = [[XPageView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) titles:titles childVcs:childVcs];
    
    [self.view addSubview:pageView];
    
    [pageView.titleView updateWithConfig:^(XTitleViewConfig *config) {
        config.titleFont = [UIFont systemFontOfSize:15];
        config.isScroll = YES;
        config.selColor = [UIColor orangeColor];
        config.indicatorColor = [UIColor orangeColor];
        config.margin = 20;
        config.indicatorHeight = 3;
    }];
    
//    int a = 0;
//    void(^block)() = ^(){
//        NSLog(@"a === %d\n", a);
//    };
//    a = 1;
//    block();
//    
//    __block int b = 0;
//    void(^block1)() = ^(){
//        NSLog(@"b === %d\n", b);
//    };
//    b = 1;
//    block1();
//    
//    __block int c = 0;
//    void(^block2)() = ^(){
//        NSLog(@"c ==== %d\n", c);
//        c = 2;
//    };
//    c = 1;
//    block2();
//    NSLog(@"c ======> %d\n", c);
}

- (void)click {
    TwoViewController *twoVc = [[TwoViewController alloc] init];
    
    //    __weak typeof(self) weakSelf = self;
    //    twoVc.block = ^(){
    //        NSLog(@"%@", weakSelf.view);
    //    };
    
    [self.navigationController pushViewController:twoVc animated:YES];
}

- (void)dealloc {
    NSLog(@"%s -- dealloc", __func__);
}



@end

//
//  TwoViewController.m
//  Demo_Refresh
//
//  Created by sajiner on 2017/3/28.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import "TwoViewController.h"
#import "ThirdViewController.h"

@interface TwoViewController ()

@property (nonatomic, copy) void(^block2)();

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:button];
    __weak typeof(self) weakSelf = self;
//    _block2 = ^(){
//         NSLog(@"%@", weakSelf.view);
//    };
    
    [[NSNotificationCenter defaultCenter] addObserverForName:nil object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@", weakSelf.view);
    }];
}

- (void)dealloc {
    NSLog(@"%s -- dealloc", __func__);
}

- (void)click {
    ThirdViewController *twoVc = [[ThirdViewController alloc] init];
    
//
//        twoVc.block = ^(){
//            NSLog(@"%@", self.view);
//        };
    
    [self.navigationController pushViewController:twoVc animated:YES];
}

@end

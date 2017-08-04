//
//  ViewController.m
//  WPExpandViewDemo
//
//  Created by wupeng on 2017/8/4.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"
#import "DFExpandedWidgetView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DFExpandedWidgetView *expandedView = [[DFExpandedWidgetView alloc] initWithFrame:CGRectMake(20, 400, 100, 100) Titles:@[@"相似k线",@"历史回看",@"历史回看",@"历史回看",@"历史回看"]];
    expandedView.onClickExpandedBtnBlock = ^(NSInteger index) {
        NSLog(@"点击了索引%ld",index);
    };
    [self.view addSubview:expandedView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

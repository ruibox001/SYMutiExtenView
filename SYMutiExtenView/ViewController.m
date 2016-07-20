//
//  ViewController.m
//  SYMutiExtenView
//
//  Created by 王声远 on 16/7/20.
//  Copyright © 2016年 创美汇. All rights reserved.
//

#import "ViewController.h"
#import "SYMutiExtenProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"iOS Ripple Background";
    
    CGFloat radius = 100;
    SYMutiExtenProgressView *exView = [SYMutiExtenProgressView shareMutiExtenProgressViewWithFrame:CGRectMake((self.view.frame.size.width-radius*2)*0.5, 200, radius*2, radius*2) extenCount:8 extenColorWithRGB:0xeaa9ff];
    [self.view addSubview:exView];
    
    [exView startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

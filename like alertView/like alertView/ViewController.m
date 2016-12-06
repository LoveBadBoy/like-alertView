//
//  ViewController.m
//  弹框demo
//
//  Created by 刘胤辰 on 16/7/22.
//  Copyright © 2016年 it.com. All rights reserved.
//

#import "ViewController.h"
#import "YCAlertView.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *v2=[[YCAlertView alloc]initWithTitle:@"保单生效后不允许退保，是否确认生效时间为" message:@"sfsfsfsfsfs" cancelButtonTitle:@"取消" idenfyButtonTitle:@"确定" hasBtnCount:2 superView:self.view];
    
    [self.view addSubview:v2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

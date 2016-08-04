//
//  PushViewController.m
//  Jwy-RESideMenu
//
//  Created by XiaoMing on 16/7/29.
//  Copyright © 2016年 JWY. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}

-(void)creatUI{
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"6929_f.jpg"];
    [self.view addSubview:imageView];
    self.title=@"我是子界面";
}


@end

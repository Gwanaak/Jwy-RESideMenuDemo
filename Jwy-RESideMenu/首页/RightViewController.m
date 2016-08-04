//
//  RightViewController.m
//  Jwy-RESideMenu
//
//  Created by XiaoMing on 16/7/29.
//  Copyright © 2016年 JWY. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatUI];

}

-(void)creatUI{
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"1332_w500.jpg"];
    [self.view addSubview:imageView];
}

@end

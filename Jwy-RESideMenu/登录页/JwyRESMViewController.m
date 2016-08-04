//
//  JwyRESMViewController.m
//  Jwy-RESideMenu
//
//  Created by XiaoMing on 16/8/3.
//  Copyright © 2016年 JWY. All rights reserved.
//

#import "JwyRESMViewController.h"

@interface JwyRESMViewController ()

@end

@implementation JwyRESMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    //由于子控制带有RESideMenu滑动效果，跟系统右滑冲突，所以这里监听是否开启关闭滑动手势
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(disableRESideMenu) name:@"disableRESideMenu" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableRESideMenu) name:@"enableRESideMenu" object:nil];
    
    [self creatUI];
}
-(void)creatUI{
    self.backgroundImage = [UIImage imageNamed:@"6641_w500.jpg"];
    self.menuPreferredStatusBarStyle = 1;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
}
//开启滑动手势
- (void)enableRESideMenu {
    self.panGestureEnabled = YES;
}
//关闭滑动手势
- (void)disableRESideMenu {
    self.panGestureEnabled = NO;
}


@end

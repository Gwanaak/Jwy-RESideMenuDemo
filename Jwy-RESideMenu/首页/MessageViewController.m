//
//  MessageViewController.m
//  Jwy-RESideMenu
//
//  Created by XiaoMing on 16/7/29.
//  Copyright © 2016年 JWY. All rights reserved.
//

#import "MessageViewController.h"
#import "RESideMenu.h"
#import "PushViewController.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNav];
    [self creatUI];
}
-(void)creatUI{
    //背景图
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"5244_w500.jpg"];
    [self.view addSubview:imageView];
    
    //点我 按钮
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 80, 80, 30)];
    btn.backgroundColor=[UIColor clearColor];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *exitBtn=[[UIButton alloc]initWithFrame:CGRectMake(290, 80, 80, 30)];
    exitBtn.backgroundColor=[UIColor clearColor];
    [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.view addSubview:exitBtn];
    [exitBtn addTarget:self action:@selector(didClickExitBtn:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)didClickExitBtn:(UIButton *)btn{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)creatNav{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(presentRightMenuViewController:)];
}
-(void)didClick:(UIButton *)btn{
    
    PushViewController *pushVC=[[PushViewController alloc]init];
    [self LeftPageJumpWith:pushVC];
}
//控制器push跳转
-(void)LeftPageJumpWith:(id)viewController{
    
    //当push子界面隐藏底部tabbar
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"enableRESideMenu" object:self userInfo:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"disableRESideMenu" object:self userInfo:nil];
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

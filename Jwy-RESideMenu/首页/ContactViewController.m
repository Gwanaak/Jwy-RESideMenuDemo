//
//  ContactViewController.m
//  Jwy-RESideMenu
//
//  Created by XiaoMing on 16/7/29.
//  Copyright © 2016年 JWY. All rights reserved.
//

#import "ContactViewController.h"
#import "RESideMenu.h"
@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatNav];
    [self creatUI];
}

-(void)creatUI{
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"4743_w500.jpg"];
    [self.view addSubview:imageView];
    
    UIButton *exitBtn=[[UIButton alloc]initWithFrame:CGRectMake(290, 80, 80, 30)];
    [exitBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
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
-(void)LeftPageJumpWith:(id)viewController{
    
    [self.navigationController pushViewController:viewController animated:YES];
}
//viewWillAppear这个方法，会执行在另一个控制器的viewWillDisappear前面，所以这里用viewDidAppear
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"enableRESideMenu" object:self userInfo:nil];
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

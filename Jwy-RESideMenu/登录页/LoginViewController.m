//
//  LoginViewController.m
//  Jwy-RESideMenu
//
//  Created by XiaoMing on 16/7/29.
//  Copyright © 2016年 JWY. All rights reserved.
//

#import "LoginViewController.h"
#import "JwyRESMViewController.h"
#import "MessageViewController.h"
#import "ContactViewController.h"
#import "DynamicViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "RESideMenu.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
    
//    __weak LoginViewController *weakSelf=self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        //[weakSelf demo1];
//        //[weakSelf demo2];
//        [weakSelf demo3];
//    });
    
    
}
-(void)creatUI{
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"4739_w500.jpg"];
    [self.view addSubview:imageView];
    
    NSArray *arr=@[@"demo1",@"demo2",@"demo3"];
    UISegmentedControl *segment=[[UISegmentedControl alloc]initWithItems:arr];
    CGPoint point=self.view.center;
    point.y=500;
    segment.center=point;
    [self.view addSubview:segment];
    
    [segment addTarget:self action:@selector(myAction:)forControlEvents:UIControlEventValueChanged];
}
-(void)myAction:(UISegmentedControl *)segment{
    
    switch (segment.selectedSegmentIndex) {
        case 0:
            [self demo1];
            break;
        case 1:
            [self demo2];
            break;
        case 2:
            [self demo3];
            break;
            
        default:
            break;
    }
    
    
}
//QQ效果
-(void)demo1{
    
    UITabBarController *rootVC=[[UITabBarController alloc]init];
    rootVC.tabBar.barTintColor=[UIColor whiteColor];
    MessageViewController *messageVC=[[MessageViewController alloc]init];
    ContactViewController *contactVC=[[ContactViewController alloc]init];
    DynamicViewController *dynamicVC=[[DynamicViewController alloc]init];
    UINavigationController *messageNav=[[UINavigationController alloc]initWithRootViewController:messageVC];
    UINavigationController *contactNav=[[UINavigationController alloc]initWithRootViewController:contactVC];
    UINavigationController *dynamicNav=[[UINavigationController alloc]initWithRootViewController:dynamicVC];
    messageNav.navigationBar.barTintColor=[UIColor cyanColor];
    messageNav.navigationBar.tintColor=[UIColor whiteColor];
    contactNav.navigationBar.barTintColor=[UIColor cyanColor];
    contactNav.navigationBar.tintColor=[UIColor whiteColor];
    dynamicNav.navigationBar.barTintColor=[UIColor cyanColor];
    dynamicNav.navigationBar.tintColor=[UIColor whiteColor];
    messageNav.tabBarItem.image=[UIImage imageNamed:@"home_Newtask"];
    contactNav.tabBarItem.image=[UIImage imageNamed:@"jf-name"];
    dynamicNav.tabBarItem.image=[UIImage imageNamed:@"yellowStar"];
    messageNav.tabBarItem.title=@"消息";
    contactNav.tabBarItem.title=@"联系人" ;
    dynamicNav.tabBarItem.title=@"动态";
    messageVC.title=@"消息";
    contactVC.title=@"联系人";
    dynamicVC.title=@"动态";

    [rootVC addChildViewController:messageNav];
    [rootVC addChildViewController:contactNav];
    [rootVC addChildViewController:dynamicNav];
   
    LeftViewController *LeftVC=[[LeftViewController alloc]init];
    LeftVC.indexDemo=1;
    
    JwyRESMViewController *RESM=[[JwyRESMViewController alloc]initWithContentViewController:rootVC leftMenuViewController:LeftVC rightMenuViewController:nil];
    [self presentViewController:RESM animated:NO completion:nil];
    
    
}
//纯侧边效果，也是自己项目使用的框架
-(void)demo2{
    DynamicViewController *DynamicVC=[[DynamicViewController alloc]init];
    DynamicVC.title=@"首页";
    UINavigationController *Nav=[[UINavigationController alloc]initWithRootViewController:DynamicVC];
    LeftViewController *LeftVC=[[LeftViewController alloc]init];
    LeftVC.indexDemo=2;
    RESideMenu *RESM=[[RESideMenu alloc]initWithContentViewController:Nav leftMenuViewController:LeftVC rightMenuViewController:nil];
    RESM.backgroundImage = [UIImage imageNamed:@"6641_w500.jpg"];
    RESM.menuPreferredStatusBarStyle = 1;
    RESM.contentViewShadowColor = [UIColor cyanColor];//阴影颜色
    RESM.contentViewShadowOffset = CGSizeMake(-20, -20);//阴影偏移范围
    RESM.contentViewShadowOpacity = 0.6;//阴影深浅度
    RESM.contentViewShadowRadius = 12;//阴影分散范围大小
    RESM.contentViewShadowEnabled = YES;//是否开启阴影
    
    [self presentViewController:RESM animated:NO completion:nil];
}

//RESideMenu的demo效果
-(void)demo3{
    
    DynamicViewController *DynamicVC=[[DynamicViewController alloc]init];
    DynamicVC.title=@"首页";
    UINavigationController *Nav=[[UINavigationController alloc]initWithRootViewController:DynamicVC];
    LeftViewController *LeftVC=[[LeftViewController alloc]init];
    LeftVC.indexDemo=3;
    RightViewController *RightVC=[[RightViewController alloc]init];
    RESideMenu *RESM=[[RESideMenu alloc]initWithContentViewController:Nav leftMenuViewController:LeftVC rightMenuViewController:RightVC];
    RESM.backgroundImage = [UIImage imageNamed:@"6641_w500.jpg"];
    RESM.menuPreferredStatusBarStyle = 1;
    RESM.contentViewShadowColor = [UIColor redColor];//阴影颜色
    RESM.contentViewShadowOffset = CGSizeMake(0, 0);//阴影偏移范围
    RESM.contentViewShadowOpacity = 0.6;//阴影深浅度
    RESM.contentViewShadowRadius = 12;//阴影分散范围大小
    RESM.contentViewShadowEnabled = YES;//是否开启阴影
    
    [self presentViewController:RESM animated:NO completion:nil];

}

@end

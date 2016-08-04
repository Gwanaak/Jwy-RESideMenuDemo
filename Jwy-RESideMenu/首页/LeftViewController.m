//
//  LeftViewController.m
//  Jwy-RESideMenu
//
//  Created by XiaoMing on 16/7/29.
//  Copyright © 2016年 JWY. All rights reserved.
//

#import "LeftViewController.h"
#import "PushViewController.h"
#import "RESideMenu.h"
#import "ContactViewController.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}
-(void)creatUI{
    self.view.backgroundColor=[UIColor clearColor];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(60, 170, 100, 30)];
    btn.backgroundColor=[UIColor clearColor];
    [btn setTitle:@"点我点我..." forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)didClick:(UIButton *)btn{
    
    switch (self.indexDemo) {
        case 1:
            [self didClickDemo1];
            break;
        case 2:
            [self didClickDemo2];
            break;
        case 3:
            [self didClickDemo3];
            break;
            
        default:
            break;
    }
}
-(void)didClickDemo1{
    RESideMenu *RESM=(RESideMenu *)self.parentViewController;
    UITabBarController *TBVC=(UITabBarController *)RESM.contentViewController;
    UINavigationController *Nav=TBVC.selectedViewController;
    
    //实现push跳转：
    PushViewController *pushVC=[[PushViewController alloc]init];
    //方式一：
    //[Nav pushViewController:pushVC animated:YES];
    //方式二：
    SEL jumpSelector = NSSelectorFromString(@"LeftPageJumpWith:");
    UIViewController *VC=Nav.viewControllers[0];
    SuppressPerformSelectorLeakWarning([VC performSelector:jumpSelector withObject:pushVC]);
    
    [self.sideMenuViewController hideMenuViewController];
}
-(void)didClickDemo2{
    RESideMenu *RESM=(RESideMenu *)self.parentViewController;
    UINavigationController *Nav=(UINavigationController *)RESM.contentViewController;
    PushViewController *pushVC=[[PushViewController alloc]init];
    //一：
    [Nav pushViewController:pushVC animated:YES];
    //二：
//    SEL jumpSelector = NSSelectorFromString(@"LeftPageJumpWith:");
//    UIViewController *VC=Nav.viewControllers[0];
//    SuppressPerformSelectorLeakWarning([VC performSelector:jumpSelector withObject:pushVC]);

    [self.sideMenuViewController hideMenuViewController];
}
-(void)didClickDemo3{
    ContactViewController *contactVC=[[ContactViewController alloc]init];
    contactVC.title=@"另一个首页喽";
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:contactVC]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}
@end

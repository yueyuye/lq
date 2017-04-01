//
//  AppDelegate.m
//  xiupin
//
//  Created by mac on 17/2/16.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "Home Page.h"
#import "MyWalletVC.h"
#import "Shopping cart.h"
#import "MY.h"
#import "ViewController.h"
#import "IQKeyboardManager.h"
@interface AppDelegate (){
    Home_Page *home;
    
    Shopping_cart * shopping;
    
    MY *my;
    
    MyWalletVC *mywallet;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController *tab = [[UITabBarController alloc]init];
    self.window.rootViewController = tab;
    
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    
    home = [[Home_Page alloc]init];
    UIImage *img1=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_home"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img2=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_home_now"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    home.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:img1 selectedImage:img2];
    
    
    mywallet=[[MyWalletVC alloc]init];
    UIImage *imge=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_dividend"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *imge1=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_dividend_now"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mywallet.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"钱包" image:imge selectedImage:imge1];
    
    
    shopping = [[Shopping_cart alloc]init];
    UIImage *img3=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_shopping"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img4=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_shopping_now"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shopping.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:img3 selectedImage:img4];
    
    
    
    
    
    my = [[MY alloc]init];
    UIImage *img5=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_mine"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img6=[[UIImage imageNamed:[NSString stringWithFormat:@"icon_mine_mine"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    my.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:img5 selectedImage:img6];
    
    
    //    tab.viewControllers = @[home,shopping,my];
    
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:12]}   forState:UIControlStateNormal];
    
    tab.tabBar.tintColor= UIColorFromRGB(0x31cdaa);
    
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:home];
    UINavigationController *navi=[[UINavigationController alloc]initWithRootViewController:shopping];
    UINavigationController *navig=[[UINavigationController alloc]initWithRootViewController:my];
    UINavigationController *naviga=[[UINavigationController alloc]initWithRootViewController:mywallet];
    tab.viewControllers = @[nav,naviga,navi,navig,];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    

    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.window endEditing:YES];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

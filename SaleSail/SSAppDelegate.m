//
//  SSAppDelegate.m
//  SaleSail
//
//  Created by e on 1/10/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SSAppDelegate.h"
//#import "SS_LoginViewController.h"
#import "SS_SearchViewController.h"
#import "SS_FavoritesViewController.h"
#import "SS_MySalesViewController.h"
#import "SS_ProfileViewController.h"

@implementation SSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *searchController = [[SS_SearchViewController alloc] initWithNibName:@"SS_SearchViewController" bundle:nil];
    UINavigationController *searchNavController = [[UINavigationController alloc]
                                             initWithRootViewController:searchController];
    
    UIViewController *favoritesController = [[SS_FavoritesViewController alloc] initWithNibName:@"SS_FavoritesViewController" bundle:nil];
    UINavigationController *favoritesNavController = [[UINavigationController alloc]
                                                   initWithRootViewController:favoritesController];
    
    UIViewController *mySalesController = [[SS_MySalesViewController alloc] initWithNibName:@"SS_MySalesViewController" bundle:nil];
    UINavigationController *mySalesNavController = [[UINavigationController alloc]
                                                      initWithRootViewController:mySalesController];
    
    UIViewController *profileController = [[SS_ProfileViewController alloc] initWithNibName:@"SS_ProfileViewController" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[searchNavController, favoritesNavController, mySalesNavController, profileController];
    self.window.rootViewController = self.tabBarController;
    
//    SS_LoginViewController *loginViewController = [[SS_LoginViewController alloc] init];
//    self.window.rootViewController = loginViewController;
    
    self.hud = [[MBProgressHUD alloc] initWithView:self.window];
    self.hud.labelText = @"please wait";
    self.hud.dimBackground = YES;
    self.hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    [self.window addSubview:self.hud];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showLoading {
    [self.window bringSubviewToFront:self.hud];
    [self.hud setMode:MBProgressHUDModeIndeterminate];
    [self.hud setLabelText:@"please wait"];
    [self.hud show:YES];
}

- (void)hideLoading {
    [self.hud hide:YES];
    [self.window sendSubviewToBack:self.hud];
}

- (void)showLoadingMessage: (NSString*) message {
    [self.window bringSubviewToFront:self.hud];
    [self.hud setMode:MBProgressHUDModeIndeterminate];
    [self.hud setLabelText:message];
    [self.hud show:YES];
    
}

- (void)showDone {
    [self.window bringSubviewToFront:self.hud];
    [self.hud setLabelText:@"Done"];
    
	self.hud.mode = MBProgressHUDModeCustomView;    
	
	[self.hud show:YES];
	[self.hud hide:YES afterDelay:3];
}

@end

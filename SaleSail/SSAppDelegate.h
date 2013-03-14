//
//  SSAppDelegate.h
//  SaleSail
//
//  Created by e on 1/10/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface SSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) MBProgressHUD *hud;
@property (nonatomic, retain) UITabBarController *tabBarController;

@end

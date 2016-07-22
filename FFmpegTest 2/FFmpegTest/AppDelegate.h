//
//  AppDelegate.h
//  FFmpegTest
//
//  Created by chenhairong on 15/5/3.
//  Copyright (c) 2015年 times. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic ,strong) LoginViewController *Login;
- (void)toMain;
@end


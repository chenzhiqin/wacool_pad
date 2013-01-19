//
//  AppDelegate.m
//  wacool_pad
//
//  Created by 邓生金 on 13-1-13.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "AppDelegate.h"
#import "UncaughtExceptionHandler.h"
#import "MyViewController.h"

#import "MD5Util.h"
#import "PhoneUtil.h"
#import "DateUtil.h"
#import "ViewController2.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
<<<<<<< HEAD
    self.viewController = [[[MyViewController alloc] initWithNibName:@"MyViewController" bundle:nil] autorelease];
=======
    self.viewController = [[[ViewController2 alloc] initWithNibName:@"view2" bundle:nil] autorelease];
>>>>>>> 8382e7b9622aaccf573df321fe98c854ddc1ee6a
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    [self initApplicationData];
    return YES;
}

-(void) initApplicationData
{
    InstallUncaughtExceptionHandler();
    NSLog(@"md5=%@,platform=%@,deviceVersion=%@,padOrPhone=%@,mac=%@,ip=%@,udid=%@,width=%0.0f,height=%0.0f,time=%@,date=%@,parseTime=%@",[MD5Util getMD5Str:@"s"],[PhoneUtil getDeviceVersion],[PhoneUtil getCurrentIOSVersion],[PhoneUtil isUserInterfaceIdiomPhone]?@"YES":@"NO",[PhoneUtil getMacAddress],[PhoneUtil getCurrentIpAddress],[PhoneUtil getOpenUDID],[PhoneUtil getScreenWidth],[PhoneUtil getScreenHeight],[DateUtil getTime],[DateUtil getDate],[DateUtil parseDate:1358488888]);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    }

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    //主要用于应用完全退出时保存数据
}

@end

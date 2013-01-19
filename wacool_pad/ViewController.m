//
//  ViewController.m
//  wacool_pad
//
//  Created by 邓生金 on 13-1-13.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btn;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setBtn:nil];//设置btn为nil
    [super viewDidUnload];
}

//控制横竖屏
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        return YES;
    }
    if(interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        return YES;
    }
    return YES;
}

- (IBAction)dfs:(id)sender {
    [self performSelector:@selector(aaaa)];
}

- (void)dealloc
{
    [btn release];    //回收代码
    [super dealloc];
}
@end

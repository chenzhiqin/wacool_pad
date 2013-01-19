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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

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
@end

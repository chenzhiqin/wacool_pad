//
//  MyViewController.m
//  wacool_pad
//
//  Created by dengshengjin on 13-1-19.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController
@synthesize btn=_btn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setBtn:nil];
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

-(IBAction) testException:(id)sender{
    [self performSelector:@selector(exceptionMethod)];

}

- (void)dealloc
{
    [_btn release];
    [super dealloc];
}

@end

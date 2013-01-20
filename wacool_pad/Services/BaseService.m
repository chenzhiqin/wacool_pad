//
//  BaseSerives.m
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-20.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "BaseService.h"
#import "ASIHTTPRequest.h"
#import "WacoolConstant.h"

@implementation BaseService

-(void)sendAsynchronousReq:(NSString *)urlStr delegate:(id)delegate tag:(int) tag
{
    
    NSURL *url=[NSURL URLWithString:urlStr];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    [request setUserAgentString:[NSString stringWithFormat:@"Wacool_iOS_Request_Tag_%@",kWacoolTypeTag]];
    [request setTag:tag];
    [request setDelegate:delegate];
    [request setNumberOfTimesToRetryOnTimeout:3];
    [request setShouldContinueWhenAppEntersBackground:YES];
    [request setTimeOutSeconds:30];
    [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:YES];
    [request startAsynchronous];
    
    [url release];
    [request autorelease];
}

@end

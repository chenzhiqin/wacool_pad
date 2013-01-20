//
//  BaseModel.m
//  wacool_pad
//
//  Created by dengshengjin on 13-1-14.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "BaseModel.h"
#import "SBJson.h"

@implementation BaseModel

@synthesize returnCode;
@synthesize errorMsg;

+(int)parseReturnCode:(NSString *)jsonStr{
    NSDictionary *results=[jsonStr JSONValue];
    int rs=[[results objectForKey:@"result"] intValue];
    [results release];
    return  rs;
}

@end

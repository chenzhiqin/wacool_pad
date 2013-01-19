//
//  UserDefaultsDBUtil.m
//  wacool_pad
//
//  Created by dengshengjin on 13-1-14.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "UserDefaultsDBUtil.h"
#import "UserDefaultsConstant.h"

@implementation UserDefaultsDBUtil

+(void) saveData{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    [accountDefaults setObject:@"myValue" forKey:KEY];
}

+(NSString *) getData{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    return [accountDefaults stringForKey:KEY];
}

@end

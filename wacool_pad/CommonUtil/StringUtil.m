//
//  StringUtil.m
//  wacool_pad
//
//  Created by dengshengjin on 13-1-17.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil

+(BOOL)isBlankString:(NSString *)str{
    
    if (str == nil) {
        return YES;
    }
    
    if (str == NULL) {
        return YES;
    }
    
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    
    return NO;
    
}

@end

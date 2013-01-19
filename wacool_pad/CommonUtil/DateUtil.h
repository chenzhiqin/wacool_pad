//
//  DateUtil.h
//  wacool_pad
//
//  Created by dengshengjin on 13-1-17.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+(NSString *) getTime;

+(NSString *) getDate;//获取当前时间

+(NSString *) parseDate:(long) time;

@end

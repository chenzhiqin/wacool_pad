//
//  DateUtil.m
//  wacool_pad
//
//  Created by dengshengjin on 13-1-17.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+(NSString *) getTime{
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[[NSDateFormatter alloc] init] autorelease];
    [dateformatter setDateFormat:@"HH:mm:ss"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

+(NSString *) getDate{
    NSDate *sendDate=[NSDate date];
    NSCalendar  * cal=[NSCalendar  currentCalendar];
    NSUInteger  unitFlags=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:sendDate];
    int year = [conponent year];
    int month = [conponent month];
    int day = [conponent day];
    int hour = [conponent hour];
    int minute = [conponent minute];
    int second = [conponent second];
    NSString *nsDateString= [NSString  stringWithFormat:@"%4d-%2d-%2d %2d:%2d:%2d",year,month,day,hour,minute,second];
    return nsDateString;
}

+(NSString *) parseDate:(long)time{

    
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
//    
//    NSDate *datenow = [NSDate date];
//    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
//    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    return confromTimespStr;
}

@end

//
//  PhoneUtil.h
//  wacool_pad
//
//  Created by dengshengjin on 13-1-17.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <Foundation/Foundation.h>
//deviceVersion
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

#import "OpenUDID.h"
#import "IPAddress.h"

@interface PhoneUtil : NSObject

+ (BOOL) isUserInterfaceIdiomPhone;//eg:phone or pad

+ (NSString *) getCurrentIOSVersion;//eg:iPhone os 5.0

+ (NSString *) getDeviceVersion;//eg:iPod Touch 4G

+ (NSString *) getCurrentIpAddress;//eg:192.168.0.104

+ (NSString *) getOpenUDID;//eg:72effea63a8a28bf46c0a6a5ba763cdb611ddf8a

+ (NSString *) getMacAddress;//eg:7073CB7EA29A

+ (CGFloat) getScreenWidth;

+ (CGFloat) getScreenHeight;

@end

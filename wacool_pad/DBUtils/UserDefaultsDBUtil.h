//
//  UserDefaultsDBUtil.h
//  wacool_pad
//
//  Created by dengshengjin on 13-1-14.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsDBUtil : NSObject

+(void) saveData;

+(NSString *) getData;

@end

//
//  BaseSerives.h
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-20.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseService : NSObject

-(void)sendAsynchronousReq:(NSString *)urlStr delegate:(id)delegate tag:(int)tag;

@end

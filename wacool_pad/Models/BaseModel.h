//
//  BaseModel.h
//  wacool_pad
//
//  Created by dengshengjin on 13-1-14.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property(nonatomic,assign) int returnCode;
@property(nonatomic,copy) NSString *errorMsg;

+(int) parseReturnCode:(NSString *)jsonStr;

@end

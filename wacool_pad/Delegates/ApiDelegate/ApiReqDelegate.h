//
//  ApiReqDelegate.h
//  wacool_ec
//
//  Created by Yu Jingye on 12-5-15.
//  Copyright (c) 2012年 freshopenair. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApiReqDelegate <NSObject>

- (void) reqSuccWithArray:(NSMutableArray *)results;

- (void) reqFailWithErrorMsg:(NSString *)errorMsg;

@end

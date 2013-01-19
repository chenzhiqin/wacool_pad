//
//  ItemDBUtil.m
//  wacool_pad
//
//  Created by dengshengjin on 13-1-15.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "ItemDBUtil.h"
#import "ItemDBConstant.h"
#import "EGODatabase.h"

@implementation ItemDBUtil

#pragma 创建数据库
+(EGODatabase *) openDatabase{
    NSArray *documnetsPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *databaseFilePath=[[documnetsPaths objectAtIndex:0] stringByAppendingPathComponent:DATABASE_NAME];
    return [[EGODatabase alloc] initWithPath:databaseFilePath];
}

#pragma 创建表
+(void) initDatabase{
    EGODatabase *db=[ItemDBUtil openDatabase];
    NSString *createDBSql=[NSString stringWithFormat:CREATE_TABLE_SQL, TABLE_NAME, COLUMN_NAME];
    [db executeUpdate:createDBSql];
}

@end

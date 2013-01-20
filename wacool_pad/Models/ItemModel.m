//
//  ItemModel.m
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-19.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "ItemModel.h"
#import "SBJson.h"

@implementation ItemModel

@synthesize itemId;
@synthesize title;
@synthesize imgUrl;
@synthesize imgRatio;
@synthesize likes;
@synthesize shares;
@synthesize outerUrl;
@synthesize price;
@synthesize hasNextPage;
@synthesize isMyFavorite;
@synthesize userId;
@synthesize userName;
@synthesize userImage;
@synthesize sPath;
@synthesize sTime;
@synthesize cmts;
@synthesize cmtList;

+(NSMutableArray *)buildItemModelList:(NSString *)jsonStr{
    
    
    NSMutableArray *itemArray=[[[NSMutableArray alloc] init] autorelease];
    NSDictionary *results=[jsonStr JSONValue];
    if(results){
        int rs=[BaseModel parseReturnCode:jsonStr];
        if(rs!=1)
            return  nil;
        BOOL hasNext=[[results objectForKey:@"hasNext"]boolValue];
        NSArray *itemList=(NSArray *)[results objectForKey:@"itemList"];
        for (int i=0,c=[itemList count]; i<c; i++) {
            NSDictionary *itemDict=(NSDictionary *)[itemList objectAtIndex:i];
            ItemModel *itemModel=[ItemModel convertJsonDictToItemModel:itemDict];
            [itemArray addObject:itemModel];
            [itemDict release];
        }
        if([itemArray count]>1){
            ItemModel *firstModel=[itemArray objectAtIndex:0];
            firstModel.hasNextPage=hasNext;
        }
        [results release];
    }
    return itemArray;
    
}

+(ItemModel *)convertJsonDictToItemModel:(NSDictionary *)itemDict{
    
    ItemModel *itemModel=[[[ItemModel alloc] init]autorelease] ;
    itemModel.itemId=[[itemDict objectForKey:@"itemId"] intValue];
    itemModel.title=[itemDict objectForKey:@"title"];
    itemModel.imgUrl=[itemDict objectForKey:@"imgUrl"];
    itemModel.imgRatio=[[itemDict objectForKey:@"imgRatio"] doubleValue];
    itemModel.shares=[[itemDict objectForKey:@"shares"]intValue];
    itemModel.likes=[[itemDict objectForKey:@"likes"]intValue];
    itemModel.outerUrl=[itemDict objectForKey:@"outerUrl"];
    itemModel.price=[itemDict objectForKey:@"price"];
    itemModel.userId=[[itemDict objectForKey:@"userId"]intValue];
    itemModel.userName=[itemDict objectForKey:@"userName"];
    itemModel.userImage=[itemDict objectForKey:@"userImage"];
    itemModel.sPath=[itemDict objectForKey:@"sPath"];
    itemModel.sTime=[itemDict objectForKey:@"sTime"];
    
    return itemModel;
    
}


@end

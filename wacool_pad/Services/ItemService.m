//
//  ItemService.m
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-20.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "ItemService.h"

@implementation ItemService

-(void) getAllItemList:(long) lastId pageSize:(int) pageSize delegate:(id) delegate tag:(int)tag{
    apiReqDelegate = delegate;
    NSString *urlStr = [NSString stringWithFormat:@"http://api.wacool.co/m/restful/items/queryAllItems.do?lastId=%ld&pageSize=%d&tag=%@&appId=%d",lastId,pageSize,kWacoolTypeTag, APP_ID];
    [self sendAsynchronousReq:urlStr delegate:self tag:tag];
}

#pragma mark -
#pragma mark ASI Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request{
    int tag=request.tag;
    NSString *jsonStr=[request responseString];
    NSLog(@"%@",jsonStr);
    NSMutableArray *itemList=nil;
    if(tag==ALL_ITEMS_REQ){
        itemList=[ItemModel buildItemModelList:jsonStr];
    }
    [apiReqDelegate reqSuccWithArray:itemList];
}

-(void)requestFailed:(ASIHTTPRequest *)request{
    [apiReqDelegate reqFailWithErrorMsg:@"请检查网络连接..."];
}

@end

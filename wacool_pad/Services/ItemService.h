//
//  ItemService.h
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-20.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "ApiReqDelegate.h"
#import "BaseService.h"
#import "ItemModel.h"

@interface ItemService : BaseService{
   id<ApiReqDelegate> apiReqDelegate;
}

-(void) getAllItemList:(long) lastId pageSize:(int) pageSize delegate:(id) delegate tag:(int) tag;

@end

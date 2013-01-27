//
//  ItemModel.h
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-19.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "BaseModel.h"

@interface ItemModel : BaseModel{
    
}

@property (nonatomic,assign) long itemId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,assign) double imgRatio;
@property (nonatomic,assign) int likes;
@property (nonatomic,assign) int shares;
@property (nonatomic,copy) NSString *outerUrl;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,assign) BOOL hasNextPage;
@property (nonatomic,assign) BOOL isMyFavorite;
@property (nonatomic,assign) int userId;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *userImage;
@property (nonatomic,copy) NSString *sPath;
@property (nonatomic,copy) NSString *sTime;
@property (nonatomic,copy) NSString *cmts;
@property (nonatomic,retain) NSMutableArray *cmtList;

//+(NSString *) reverseItemModelToJson:(ItemModel *)itemModel;
+(ItemModel *) convertJsonDictToItemModel:(NSDictionary *)itemDict;
//+(ItemModel *) convertJsonDictToShareItemModel:(NSDictionary *)itemDict hasNextPage:(BOOL) hasNext;
+(NSMutableArray *)buildItemModelList:(NSString *)jsonStr;
//+(NSMutableArray *)bulidShareItemModelList:(NSString *)jsonStr;

@end

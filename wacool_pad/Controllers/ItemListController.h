//
//  ItemListController.h
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-22.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemService.h"
#import "RefreshHeaderAndFooterView.h"


@interface ItemListController : UIViewController<RefreshHeaderAndFooterViewDelegate,UIScrollViewDelegate,ApiReqDelegate>{
    IBOutlet UIButton *allBtn,*hotBtn,*collectBtn,*favoriteBtn,*moreBtn;

    IBOutlet UIImageView *refreshImg,*leftLineImg;
    IBOutlet UIScrollView *itemScrollView;
    IBOutlet UILabel *pageLabel;
    
    RefreshHeaderAndFooterView * refreshHeaderAndFooterView;
    BOOL reloading;
    
    ItemService *itemService;
    NSMutableArray *itemData;
    int scrollPage;
    int pageCount,pageSize;

}

@end

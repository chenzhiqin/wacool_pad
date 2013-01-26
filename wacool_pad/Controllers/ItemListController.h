//
//  ItemListController.h
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-22.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "ItemService.h"


@interface ItemListController : UIViewController<EGORefreshTableHeaderDelegate,UIScrollViewDelegate,ApiReqDelegate>{
    IBOutlet UIButton *allBtn,*hotBtn,*collectBtn,*favoriteBtn,*moreBtn;

    IBOutlet UIImageView *refreshImg,*leftLineImg;
    IBOutlet UIScrollView *itemScrollView;
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    ItemService *itemService;
    int scrollPage;
}


- (void)reloadDataSource;

- (void)doneLoadingData;
@end

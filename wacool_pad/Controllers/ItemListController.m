//
//  ItemListController.m
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-22.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "ItemListController.h"
#import "WacoolConstant.h"
#import "ItemPageView.h"

@interface ItemListController ()

@end

@implementation ItemListController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        itemService = [[ItemService alloc] init];
        scrollPage=0;
    }
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *highlightColor = APP_GENERAL_COLOR;
    
    [allBtn setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [hotBtn setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [collectBtn setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [favoriteBtn setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [moreBtn setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [leftLineImg setBackgroundColor:highlightColor];
    itemScrollView.showsHorizontalScrollIndicator=NO;
    itemScrollView.pagingEnabled=YES;
    [itemScrollView setDelegate:self];
    [self setRefreshHeaderView];
    [self getItemData:0 pageSize:60 delegate:self tag:ALL_ITEMS_REQ];
    
}


-(EGORefreshTableHeaderView*)setRefreshHeaderView{
    if (_refreshHeaderView == nil) {
        
        EGORefreshTableHeaderView *view = [[[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - itemScrollView.bounds.size.width, self.view.frame.size.height, itemScrollView.bounds.size.width)]autorelease];
        view.delegate = self;
        [itemScrollView addSubview:view];
        _refreshHeaderView = view;
        
    }
    
    //  update the last update date
    [_refreshHeaderView refreshLastUpdatedDate];
    
    return _refreshHeaderView;
}

// 重写UIScrollViewDelegate 中的scrollViewDidScroll，scrollViewDidEndDragging
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
}


// 下拉刷新，正在刷新时
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    // 正在加载数据
    [self reloadDataSource];
    // 数据加载完成后
    [self performSelector:@selector(doneLoadingData) withObject:nil afterDelay:3.0];
    
}

// 获取是否正在刷新。
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
    return _reloading; // should return if data source model is reloading
    
}

// 更新刷新的时间
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; // should return date data source was last changed
    
}



- (void)reloadDataSource{
    _reloading = YES;
}

- (void)doneLoadingData{
    _reloading = NO;
}


-(void)getItemData:(long) lastId pageSize:(int) pageSize delegate:(id) delegate tag:(int) tag{
    [itemService getAllItemList:lastId pageSize:pageSize delegate:self tag:tag];
}


-(void)reqSuccWithArray:(NSMutableArray *)results{
    int pageCount=6;

    for (int i=0,j=[results count]/pageCount; i<j; i++) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"ItemPageView" owner:self options:nil];
        ItemPageView *itemPageView=[nib objectAtIndex:0];
        [itemPageView setFrame:CGRectMake(itemScrollView.bounds.size.width*i, 0, itemScrollView.bounds.size.width, itemScrollView.bounds.size.height)];
        
        ItemModel *model1=[results objectAtIndex:i*6];
        [itemPageView updateItemView:model1 view:itemPageView.view1 descLabel:itemPageView.descLab1 favorImg:itemPageView.favorImg1];
        ItemModel *model2=[results objectAtIndex:i*6+1];
        [itemPageView updateItemView:model2 view:itemPageView.view2 descLabel:itemPageView.descLab2 favorImg:itemPageView.favorImg2];
        ItemModel *model3=[results objectAtIndex:i*6+2];
        [itemPageView updateItemView:model3 view:itemPageView.view3 descLabel:itemPageView.descLab3 favorImg:itemPageView.favorImg3];
        ItemModel *model4=[results objectAtIndex:i*6+3];
        [itemPageView updateItemView:model4 view:itemPageView.view4 descLabel:itemPageView.descLab4   favorImg:itemPageView.favorImg4];
        ItemModel *model5=[results objectAtIndex:i*6+4];
        [itemPageView updateItemView:model5 view:itemPageView.view5 descLabel:itemPageView.descLab5 favorImg:itemPageView.favorImg5];
        ItemModel *model6=[results objectAtIndex:i*6+5];
        [itemPageView updateItemView:model6 view:itemPageView.view6 descLabel:itemPageView.descLab6 favorImg:itemPageView.favorImg6];
        
        [itemScrollView addSubview:itemPageView];
        
    }
    NSLog(@"load data succ");
    scrollPage=scrollPage+[results count]/pageCount;
    itemScrollView.contentSize = CGSizeMake(itemScrollView.bounds.size.width * scrollPage, itemScrollView.bounds.size.height);

    
}


-(void)reqFailWithErrorMsg:(NSString *)errorMsg{
    NSLog(@"请求失败");

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
}

@end

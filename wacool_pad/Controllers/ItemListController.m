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
        itemData=[[NSMutableArray alloc]init];
        scrollPage=0;
        pageCount=6;
        pageSize=6*10;
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
    itemScrollView.contentSize = CGSizeMake(itemScrollView.bounds.size.width * 1, itemScrollView.bounds.size.height);

    refreshHeaderAndFooterView= [[RefreshHeaderAndFooterView alloc] initWithFrame:CGRectMake(0, 0, itemScrollView.contentSize.width,itemScrollView.frame.size.height)];
    [refreshHeaderAndFooterView setDelegate:self];
    [itemScrollView addSubview:refreshHeaderAndFooterView];

    
    [self getItemData:0 pageSize:pageSize delegate:self tag:ALL_ITEMS_REQ];
    
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
    [refreshHeaderAndFooterView RefreshScrollViewDidScroll:scrollView];
    
    CGFloat pageWidth = scrollView.frame.size.width;
    int currentPage=floor((scrollView.contentOffset.x-pageWidth/ 2) / pageWidth)+ 2;
    pageLabel.text=[NSString stringWithFormat:@"%d",currentPage];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [refreshHeaderAndFooterView RefreshScrollViewDidEndDragging:scrollView];
	
}
#pragma mark -
#pragma mark RefreshHeaderAndFooterViewDelegate Methods

- (void)RefreshHeaderAndFooterDidTriggerRefresh:(RefreshHeaderAndFooterView*)view{
	reloading = YES;
    if (refreshHeaderAndFooterView.refreshHeaderView.state == PullRefreshLoading) {//下拉刷新动作的内容
        NSLog(@"header");
        [self performSelector:@selector(refreshData) withObject:nil afterDelay:3.0];
        
    }else if(refreshHeaderAndFooterView.refreshFooterView.state == PullRefreshLoading){//上拉加载更多动作的内容
        NSLog(@"footer");
        [self performSelector:@selector(moreData) withObject:nil afterDelay:3.0];
    }
}

- (BOOL)RefreshHeaderAndFooterDataSourceIsLoading:(RefreshHeaderAndFooterView*)view{
	
	return reloading; // should return if data source model is reloading
	
}
- (NSDate*)RefreshHeaderAndFooterDataSourceLastUpdated:(RefreshHeaderAndFooterView*)view{
    return [NSDate date];
}

-(void)refreshData{
    scrollPage=0;
//    [self getItemData:0 pageSize:pageSize delegate:self tag:ALL_ITEMS_REQ];
    reloading=NO;
    [refreshHeaderAndFooterView RefreshScrollViewDataSourceDidFinishedLoading:itemScrollView];
}

-(void)moreData{
//    ItemModel *model=[itemData objectAtIndex:itemData.count-1];
//    int lastId=model.itemId;
//    [self getItemData:lastId pageSize:pageSize delegate:self tag:ALL_ITEMS_REQ];    
//    [model release];
    reloading=NO;
    [refreshHeaderAndFooterView RefreshScrollViewDataSourceDidFinishedLoading:itemScrollView];

}


-(void)getItemData:(long) lastId pageSize:(int) size delegate:(id) delegate tag:(int) tag{
    [itemService getAllItemList:lastId pageSize:size delegate:self tag:tag];
}


-(void)reqSuccWithArray:(NSMutableArray *)results{

    [itemData addObjectsFromArray:results];
    for (int i=0,j=[results count]/pageCount; i<j; i++) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"ItemPageView" owner:self options:nil];
        ItemPageView *itemPageView=[nib objectAtIndex:0];
        [itemPageView setFrame:CGRectMake(itemScrollView.bounds.size.width*i, 0, itemScrollView.bounds.size.width, itemScrollView.bounds.size.height)];
        
        ItemModel *model1=[results objectAtIndex:i*6];
        [itemPageView updateItemView:model1 view:itemPageView.view1 descLabel:itemPageView.descLab1 favorImg:itemPageView.favorImg1 likeNumLab: itemPageView.likeNumLab1];
        ItemModel *model2=[results objectAtIndex:i*6+1];
        [itemPageView updateItemView:model2 view:itemPageView.view2 descLabel:itemPageView.descLab2 favorImg:itemPageView.favorImg2 likeNumLab:itemPageView.likeNumLab2];
        ItemModel *model3=[results objectAtIndex:i*6+2];
        [itemPageView updateItemView:model3 view:itemPageView.view3 descLabel:itemPageView.descLab3 favorImg:itemPageView.favorImg3 likeNumLab: itemPageView.likeNumLab3];
        ItemModel *model4=[results objectAtIndex:i*6+3];
        [itemPageView updateItemView:model4 view:itemPageView.view4 descLabel:itemPageView.descLab4   favorImg:itemPageView.favorImg4 likeNumLab: itemPageView.likeNumLab4];
        ItemModel *model5=[results objectAtIndex:i*6+4];
        [itemPageView updateItemView:model5 view:itemPageView.view5 descLabel:itemPageView.descLab5 favorImg:itemPageView.favorImg5 likeNumLab: itemPageView.likeNumLab5];
        ItemModel *model6=[results objectAtIndex:i*6+5];
        [itemPageView updateItemView:model6 view:itemPageView.view6 descLabel:itemPageView.descLab6 favorImg:itemPageView.favorImg6 likeNumLab: itemPageView.likeNumLab6];
        
        [itemScrollView addSubview:itemPageView];
        
    }
    NSLog(@"load data succ");
    scrollPage=scrollPage+[results count]/pageCount;
    itemScrollView.contentSize = CGSizeMake(itemScrollView.bounds.size.width * scrollPage, itemScrollView.bounds.size.height);
    [refreshHeaderAndFooterView updateFooterLayout:itemScrollView.frame];

   
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
    [itemService release];
    [itemData release];
    [super dealloc];
}

@end

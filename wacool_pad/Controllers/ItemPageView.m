//
//  ItemPageView.m
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-24.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import "ItemPageView.h"
#import "EGOImageView.h"
@implementation ItemPageView

@synthesize view1,view2,view3,view4,view5,view6;
@synthesize descLab1,descLab2,descLab3,descLab4,descLab5,descLab6;
@synthesize favorImg1,favorImg2,favorImg3,favorImg4,favorImg5,favorImg6;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)updateItemView:(ItemModel *) itemModel view:(UIView *) view descLabel:(UILabel *) lable  favorImg:(UIImageView *) img{
  UIImageView  *itemBgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 200.f, 200.f)];
    UIImage *stretchedBackground = [[UIImage imageNamed:@"table_image_bd.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:4];
    itemBgImageView.image = stretchedBackground;

    EGOImageView *imageView = [[EGOImageView alloc] initWithPlaceholderImage:nil];
    imageView.imageURL = [NSURL URLWithString:itemModel.imgUrl];
    imageView.frame = CGRectMake(10.f, 10.f, 180.f, 160.f);
    [view addSubview:itemBgImageView];
    [view addSubview:imageView];
    lable.text=itemModel.title;
    if(itemModel.likes==1){
        UIImage *favorImg=[UIImage imageNamed:@"icon_collected.png"];
        [img setImage:favorImg];
        [favorImg release];
    }
    [imageView release];

}
@end

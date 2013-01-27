//
//  ItemPageView.h
//  wacool_pad
//
//  Created by 陈志琴 on 13-1-24.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface ItemPageView : UIView
@property (nonatomic, retain) IBOutlet UIView *view1,*view2,*view3,*view4,*view5,*view6;
@property (nonatomic, retain) IBOutlet UILabel *descLab1,*descLab2,*descLab3,*descLab4,*descLab5,*descLab6,*likeNumLab1,*likeNumLab2,*likeNumLab3,*likeNumLab4,*likeNumLab5,*likeNumLab6;
@property (nonatomic, retain) IBOutlet UIImageView *favorImg1,*favorImg2,*favorImg3,*favorImg4,*favorImg5,*favorImg6;

-(void)updateItemView:(ItemModel *) itemModel view:(UIView *) view descLabel:(UILabel *) lable  favorImg:(UIImageView *) img likeNumLab:(UILabel *)likeNumLab;

@end

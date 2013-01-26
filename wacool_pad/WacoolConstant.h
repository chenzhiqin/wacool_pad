//
//  WacoolConstant.h
//  wacool_pad
//
//  Created by dengshengjin on 13-1-19.
//  Copyright (c) 2013年 wacool. All rights reserved.
//

#ifndef wacool_pad_WacoolConstant_h
#define wacool_pad_WacoolConstant_h

//判断是否为iPhone5
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


#endif

#define kWacoolTypeTag @"0" //0 normal //1 girls //2 boys
#define APP_GENERAL_COLOR [UIColor colorWithRed:246.0/255.0 green:102.0/255.0 blue:52.0/255.0 alpha:1.0] // tag 0 wacool all
//#define APP_GENERAL_COLOR [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:153.0/255.0 alpha:1.0] // tag 1 girl color
//#define APP_GENERAL_COLOR [UIColor colorWithRed:63.0/255.0 green:142.0/255.0 blue:249.0/255.0 alpha:1.0] // tag 2 boy color


// App base params
const static int DEFAULT_PAGE_SIZE = 30;
const static int APP_ID = 1;

// Tag for requests
const static int CATEGORY_REQ = 1;
const static int ALL_ITEMS_REQ = 2;
const static int HOT_ITEMS_REQ = 3;
const static int CATEGORY_ITEMS_REQ = 4;
const static int SHARE_ITEM_REQ = 5;
const static int LIKE_ITEM_REQ = 6;
const static int REG_OR_UPDATE_USER = 7;
const static int COLLECT_ITEM = 8;
const static int ALL_COLLECT_ITEMS_REQ = 9;
const static int CTG_COLLECT_ITEMS_REQ = 10;
const static int USER_COLLECT_ITEMS_REQ = 11;
const static int LIKE_COLLECTED_ITEM_REQ = 12;
const static int ITEM_COMMENTS_REQ = 14;
const static int ADD_COMMENT_REQ = 15;
const static int DISLIKE_ITEM_REQ = 16;
const static int DISLIKE_COLLECTED_ITEM_REQ = 17;
const static int REG_QI_NIU_TOKEN_REQ = 18;

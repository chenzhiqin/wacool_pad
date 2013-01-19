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

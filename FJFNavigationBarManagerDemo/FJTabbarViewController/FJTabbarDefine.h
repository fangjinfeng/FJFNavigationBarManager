//
//  FJTabbarDefine.h
//  FJTabbarViewControllerDemo
//
//  Created by fjf on 2017/9/19.
//  Copyright © 2017年 fjf. All rights reserved.
//

#ifndef FJTabbarDefine_h
#define FJTabbarDefine_h


#import <UIKit/UIKit.h>


// 设置 十六 进制 RGB 颜色
#define kFJColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 设置 十六 进制 RGB 颜色 和 透明度
#define kColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


// tabbar item image ratio
#define kFJTabbarItemImageRatio 0.7

// tabbar item badge height
#define kFJTabbarbadgeViewNormalHeight 15.0f;

// tabbar item badge to tabbar button spacing
#define kFJTabbarbadgeViewToTabbarButtonSpacing 3.0f;

/** 颜色 **/

// tabbar button normal color
#define kFJTabbarButtonNormalTitleColor kFJColorFromRGB(0xA7A5A6)


// tabbar button select color
#define kFJTabbarButtonSelectTitleColor kFJColorFromRGB(0xFE5252)


// tabbar button badge background color
#define kFJTabbarBadgeBackgroundColor kFJColorFromRGB(0xFE5252)


// tabbar button badge normal color
#define kFJTabbarBadgeTitleNormalColor kFJColorFromRGB(0xFFFFFF)


// tabbar button select color
#define kFJTabbarSplitLineBackgroundColor kFJColorFromRGB(0xF2F2F2)


/** 字体 **/

// font
#define kFJSystemFontSize(a) [UIFont systemFontOfSize:a]

// tabbar button font size
#define kFJTabbarButtonFontSize kFJSystemFontSize(12)

// tabbar button font size
#define kFJTabbarBadgeFontSize kFJSystemFontSize(10)





#endif /* FJTabbarDefine_h */

//
//  FJTabbarViewStyle.h
//  FJTabbarViewControllerDemo
//
//  Created by fjf on 2018/1/31.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJTabbarViewStyle : NSObject
/**
 *  TabBar item title font   tabbarItem 字体 大小
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  TabBar item's badge title font 消息提示 字体大小
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  TabBar item image ratio  tabbarItem 图片比例
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  TabBar item's badge background color 消息 提示 背景色
 */
@property (nonatomic, strong) UIColor *badgeBackgroundColor;

/**
 *  TabBar item's badge nomal color 消息 提示 通常 字体颜色
 */
@property (nonatomic, strong) UIColor *badgeTitleNomalColor;

/**
 *  TabBar item title color tabbarItem 普通 字体颜色
 */
@property (nonatomic, strong) UIColor *normalItemTitleColor;

/**
 *  TabBar selected item title color  tabbarItem 选中 颜色
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  TabBar LineView backgroud color 背景 颜色
 */
@property (nonatomic, strong) UIColor *lineViewBackgroundColor;

/**
 *  TabBar item's badge width 消息 提示 正常 高度
 */
@property (nonatomic, assign) CGFloat badgeViewNormalHeight;

/**
 *  TabBar item's badge to tabbarButton spacing 消息 提示 距离 按键 间隔
 */
@property (nonatomic, assign) CGFloat badgeViewToTabbarButtonSpacing;
@end

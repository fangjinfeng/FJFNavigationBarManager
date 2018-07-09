//
//  LETabBarView.h
//  LemonLive
//
//  Created by chenzy on 16/11/18.
//  Copyright © 2016年 Qingning Science & Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FJTabBarView;
@class FJTabBarButton;
@class FJTabbarViewStyle;

@protocol FJTabBarViewDelegate <NSObject>

@optional
- (void)tabBarView:(FJTabBarView *)tabBarView
    didClickButton:(NSInteger)index;

@end

@interface FJTabBarView : UIView

/**
 *  TabBar's item array
 */
@property (nonatomic, strong) NSArray *itemArray;

/**
 *  TabBar item badge value
 */
@property (nonatomic, copy) NSString *badgeValue;

/**
 *  tabbarViewStyle
 */
@property (nonatomic, strong) FJTabbarViewStyle *tabbarViewStyle;

/**
 *  TabBar delegate
 */
@property (nonatomic, weak) id<FJTabBarViewDelegate> delegate;


/**
 依据 索引 设置 选择 按键

 @param buttonIndex 按键 索引
 */
- (void)setSelectedTabbarButtonIndex:(NSUInteger)buttonIndex;


/**
 依据 按键 索引 获取 tabbar button
 
 @param buttonIndex 按键 索引
 @return 返回 按键
 */
- (FJTabBarButton *)tabbarButtonWithButtonIndex:(NSUInteger)buttonIndex;
@end

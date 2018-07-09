//
//  TabBarButton.h
//  LemonLive
//
//  Created by chenzy on 16/11/18.
//  Copyright © 2016年 Qingning Science & Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJTabBarBadge;
@class FJTabbarViewStyle;
@interface FJTabBarButton : UIButton
/**
 *  TabBar item badge value
 */
@property (nonatomic, copy) NSString *badgeValue;
/**
 *  TabBar item
 */
@property (nonatomic, strong) UITabBarItem *item;
/**
 *  TabBar's item count
 */
@property (nonatomic, assign) NSInteger tabBarItemCount;
/**
 *  TabBar item's badge
 */
@property (nonatomic, strong) FJTabBarBadge *tabBarBadge;
/**
 *  tabbarViewStyle
 */
@property (nonatomic, strong) FJTabbarViewStyle *tabbarViewStyle;

@end

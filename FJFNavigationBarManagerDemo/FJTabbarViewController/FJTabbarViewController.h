//
//  FJTabbarViewController.h
//  FJTabbarController
//
//  Created by fjf on 2017/5/9.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJTabBarButton;
@class FJTabbarViewStyle;

@interface FJTabbarViewController : UITabBarController

/**
 *  tabbarViewStyle
 */
@property (nonatomic, strong) FJTabbarViewStyle *tabbarViewStyle;


/**
 根据 传入参数 设置 自定义 tabbarController
 
 @param viewControllerArray viewController 字符串 数组
 @param imageNameArray 普通 图片 数组
 @param selectedImageNameArray 选中 图片 数组
 @param titleArray tabbarItem 标题
 @return tabbarController
 */
- (instancetype)initWithViewControllerArray:(NSArray<NSString *> *)viewControllerArray
                             imageNameArray:(NSArray<NSString *> *)imageNameArray
                     selectedImageNameArray:(NSArray<NSString *> *)selectedImageNameArray
                                 titleArray:(NSArray<NSString *> *)titleArray;


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

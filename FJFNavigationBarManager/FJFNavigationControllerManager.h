//
//  LYNavigationControllerManager.h
//  LeyinIntelligence
//
//  Created by fjf on 2018/6/5.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJFNavigationControllerManager : NSObject<UINavigationControllerDelegate>

+ (instancetype)sharedInstance;

/**
 设置 navigationController 的UINavigationControllerDelegate代理 为FJFNavigationControllerManager 单例
 
 @param navigationController 遵循UINavigationControllerDelegate代理的 navigationController
 */
+ (void)setNavigationDelegateWithNavigationController:(UINavigationController *)navigationController;

/**
 生成 navigationController 并 设置 UINavigationControllerDelegate代理 为FJFNavigationControllerManager 单例
 
 @param viewControllerName 根界面名称
 @return 生成 navigationController
 */
+ (UINavigationController *)navigationControllerWithViewControllerName:(NSString *)viewControllerName;
/**
 生成 navigationController 并 设置 UINavigationControllerDelegate代理 为FJFNavigationControllerManager 单例

 @param viewController 根界面
 @return 生成 navigationController
 */
+ (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController;

@end




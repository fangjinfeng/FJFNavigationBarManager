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

+ (UINavigationController *)navigationControllerWithRootViewController:(id)viewController;
+ (UINavigationController *)navigationControllerWithViewControllerName:(NSString *)vcName;

- (void)checkNavigationBarHiddenFlagWhenWillDisapperNavigationController:(UINavigationController *)navigationController;

// 更新 导航栏 状态
- (void)updateNavigationBarStatusWithNavigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end




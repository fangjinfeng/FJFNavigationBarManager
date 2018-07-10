//
//  UINavigationController+HasCalledTheMethod.h
//  MicroShopMerchant
//
//  Created by fjf on 2018/6/5.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HasCalledTheMethod)

- (BOOL)fjf_hasCalledSetNavigationBarHidden;
- (void)fjf_resetHasCalledSetNavigationBarHiddenFlag;

@end

//
//  UINavigationController+HasCalledTheMethod.h
//  MicroShopMerchant
//
//  Created by xianjb on 2017/8/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HasCalledTheMethod)

#ifdef DEBUG

- (BOOL)hasCalledSetNavigationBarHidden;
- (void)resetHasCalledSetNavigationBarHiddenFlag;

#endif

@end

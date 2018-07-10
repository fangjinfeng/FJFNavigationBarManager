//
//  UINavigationController+HasCalledTheMethod.m
//  MicroShopMerchant
//
//  Created by fjf on 2018/6/5.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import "UINavigationController+HasCalledTheMethod.h"
#import <objc/runtime.h>


static void *hasSetNavigationBarHiddenKey = &hasSetNavigationBarHiddenKey;

@implementation UINavigationController (HasCalledTheMethod)


#pragma mark -------------------------- Life  Circle
+ (void)load {
    
#ifdef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = [self class];
        SEL originalSelector = @selector(setNavigationBarHidden:animated:);
        SEL swizzledSelector = @selector(fjf_hasCalledTheMethod_setNavigationBarHidden:animated:);
        Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
        BOOL didAddMethod = class_addMethod(selfClass,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(selfClass,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    
    });
#endif
}


#pragma mark -------------------------- Public  Methods
- (void)fjf_hasCalledTheMethod_setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    objc_setAssociatedObject(self, &hasSetNavigationBarHiddenKey, @(YES), OBJC_ASSOCIATION_ASSIGN);
    [self fjf_hasCalledTheMethod_setNavigationBarHidden:hidden animated:animated];
}

- (void)fjf_resetHasCalledSetNavigationBarHiddenFlag {
    objc_setAssociatedObject(self, &hasSetNavigationBarHiddenKey, @(NO), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)fjf_hasCalledSetNavigationBarHidden {
    return [objc_getAssociatedObject(self, hasSetNavigationBarHiddenKey) boolValue];
}



@end

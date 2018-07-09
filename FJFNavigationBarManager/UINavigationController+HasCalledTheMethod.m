//
//  UINavigationController+HasCalledTheMethod.m
//  MicroShopMerchant
//
//  Created by xianjb on 2017/8/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UINavigationController+HasCalledTheMethod.h"
#import <objc/runtime.h>


static void *hasSetNavigationBarHiddenKey = &hasSetNavigationBarHiddenKey;

@implementation UINavigationController (HasCalledTheMethod)

#ifdef DEBUG

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = [self class];
        SEL originalSelector = @selector(setNavigationBarHidden:animated:);
        SEL swizzledSelector = @selector(msHasCalledTheMethod_setNavigationBarHidden:animated:);
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
}


- (void)msHasCalledTheMethod_setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    objc_setAssociatedObject(self, &hasSetNavigationBarHiddenKey, @(YES), OBJC_ASSOCIATION_ASSIGN);
    [self msHasCalledTheMethod_setNavigationBarHidden:hidden animated:animated];
}

- (void)resetHasCalledSetNavigationBarHiddenFlag {
    objc_setAssociatedObject(self, &hasSetNavigationBarHiddenKey, @(NO), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)hasCalledSetNavigationBarHidden {
    return [objc_getAssociatedObject(self, hasSetNavigationBarHiddenKey) boolValue];
}

#endif

@end


//
//  FJTabbarViewStyle.m
//  FJTabbarViewControllerDemo
//
//  Created by fjf on 2018/1/31.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import "FJTabbarDefine.h"
#import "FJTabbarViewStyle.h"

@implementation FJTabbarViewStyle
#pragma mark --------------- Life Circle

- (instancetype)init {
    if (self = [super init]) {
        _itemTitleFont = kFJTabbarButtonFontSize;
        _badgeTitleFont = kFJTabbarBadgeFontSize;
        _normalItemTitleColor = kFJTabbarButtonNormalTitleColor;
        _selectedItemTitleColor = kFJTabbarButtonSelectTitleColor;
        _badgeTitleNomalColor = kFJTabbarBadgeTitleNormalColor;
        _badgeBackgroundColor = kFJTabbarBadgeBackgroundColor;
        _itemImageRatio = kFJTabbarItemImageRatio;
        _lineViewBackgroundColor = kFJTabbarSplitLineBackgroundColor;
        _badgeViewNormalHeight = kFJTabbarbadgeViewNormalHeight;
        _badgeViewToTabbarButtonSpacing = kFJTabbarbadgeViewToTabbarButtonSpacing;
    }
    return self;
}
@end

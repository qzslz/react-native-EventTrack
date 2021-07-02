//
//  AlertManager.m
//  GreenRecycle
//
//  Created by admin on 2020/6/28.
//  Copyright © 2020 qzslz. All rights reserved.
//

#import "AlertManager.h"

static AlertManager * manager;

@implementation AlertManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AlertManager alloc]init];
    });
    return manager;
}

- (NSMutableArray<UIView *> *)alertViews {
    if (!_alertViews) {
        _alertViews = [NSMutableArray array];
    }
    return _alertViews;
}

- (UIView *)backView {
    return self.alertViews.count > 0 ? _backView : nil;
}

@end

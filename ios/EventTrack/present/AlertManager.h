//
//  AlertManager.h
//  GreenRecycle
//
//  Created by admin on 2020/6/28.
//  Copyright © 2020 qzslz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertManager : NSObject

@property (nonatomic, strong) NSMutableArray<UIView *> * alertViews;

@property (nonatomic, strong,nullable) UIView * backView;

+(instancetype)shareInstance;



@end

NS_ASSUME_NONNULL_END

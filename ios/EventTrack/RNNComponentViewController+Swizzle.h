//
//  RNNComponentViewController+Swizzle.h
//  BooklnSaaS
//
//  Created by HFY on 2021/6/23.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "RNNComponentViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNNComponentViewController (Swizzle)

///存埋点遮罩层的数组
@property (nonatomic,strong) NSMutableArray<UIButton *> * trackViews;

///遮盖层，用于防止开启显示埋点数据时防止用户操作界面的
@property (nonatomic,strong,nullable) UIView * speratView;

///刷新界面
-(void)refresh;

///隐藏TrackViews
-(void)hideTrackViews;

@end

NS_ASSUME_NONNULL_END

//
//  EventTracker.h
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RNNComponentViewController.h>
#import "EventTrackBoard.h"

NS_ASSUME_NONNULL_BEGIN


@interface EventTracker : NSObject
///当前的controller
@property(nonatomic,strong,nullable) RNNComponentViewController * currentViewController;
///顶部的trackboard
@property(nonatomic,strong,nullable) EventTrackBoard * boardView;
///是否显示顶部的trackboard
@property(nonatomic,assign,readonly) BOOL isShowEventTrackBoard;
///是否显示每个touchable的trackview
@property(nonatomic,assign,readonly) BOOL isShowEventTrackPointView;
///当前controller的截屏图
@property(nonatomic,strong) UIImage * screenShot;

+ (EventTracker *)shareInstance;

///刷新界面遮罩层
-(void)refresh;

///显示TrackBoard
-(void)showTopEventTrackBoard;

///隐藏TrackBoard
-(void)closeTopEventTrackBoard;

///显示trackview
-(void)showPointsTrackView;

///隐藏trackview
-(void)hidePointsTrackView;

@end

NS_ASSUME_NONNULL_END

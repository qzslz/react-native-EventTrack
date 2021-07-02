//
//  EventTracker.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "EventTracker.h"
#import "RNNComponentViewController+Swizzle.h"

@interface EventTracker()

@property(nonatomic,assign) BOOL isShowEventTrackBoardValue;

@property(nonatomic,assign,readonly) BOOL isShowEventTrackPointViewValue;

@end

@implementation EventTracker

static EventTracker* _instance = nil;

+ (EventTracker *)shareInstance {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone {
    
    return [EventTracker shareInstance] ;
}

-(id)copyWithZone:(NSZone *)zone {
    
    return [EventTracker shareInstance] ;//return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone {
    
    return [EventTracker shareInstance] ;
}

- (void)refresh{
  if (self.currentViewController) {
    [self.currentViewController refresh];
  }
}

- (void)showTopEventTrackBoard{
  if (!self.boardView) {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.boardView = [EventTrackBoard initWithFrame:CGRectMake(10, 50, screenWidth-20, 230)];
    if (self.currentViewController) {
      self.boardView.pageTitle.text = self.currentViewController.navigationItem.title ? self.currentViewController.navigationItem.title : @"未设置";
    }
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self.boardView];
  }
  _isShowEventTrackBoardValue = YES;
}

- (void)closeTopEventTrackBoard {
  if (self.boardView) {
    [self.boardView removeFromSuperview];
    self.boardView = NULL;
  }
  [self hidePointsTrackView];
  _isShowEventTrackBoardValue = NO;
}

- (BOOL)isShowEventTrackBoard{
  return _isShowEventTrackBoardValue;
}

- (BOOL)isShowEventTrackPointView{
  return _isShowEventTrackPointViewValue;
}

- (void)showPointsTrackView{
  _isShowEventTrackPointViewValue = YES;
  if (self.currentViewController) {
    [self.currentViewController refresh];
  }
}

- (void)hidePointsTrackView{
  _isShowEventTrackPointViewValue = NO;
  if (self.currentViewController) {
    [self.currentViewController hideTrackViews];
  }
}

@end

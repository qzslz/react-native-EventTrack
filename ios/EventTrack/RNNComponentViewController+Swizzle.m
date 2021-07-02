//
//  RNNComponentViewController+Swizzle.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/23.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "RNNComponentViewController+Swizzle.h"
#import <objc/runtime.h>
#import <React/RCTView.h>
#import "EventTracker.h"
#import "EventTrackPointDataView.h"
#import "UIView+Present.h"
#import "EventTrackButton.h"

@implementation RNNComponentViewController (Swizzle)
-(NSMutableArray *)trackViews {
  return objc_getAssociatedObject(self, @selector(trackViews));
}

-(void)setTrackViews:(NSMutableArray *)trackViews{
  objc_setAssociatedObject(self, @selector(trackViews), trackViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setSperatView:(UIView *)speratView {
  objc_setAssociatedObject(self, @selector(speratView), speratView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)speratView {
  return objc_getAssociatedObject(self, @selector(speratView));
}



+(void)load {
  [self swizzleViewDidAppearSel];
  [self swizzleViewDidDisappearSel];
}

+(void)swizzleViewDidAppearSel{
  Class class = [super class];
  SEL originViewDidAppearSel = @selector(viewDidAppear:);
  SEL swizzleViewDidAppearSel = @selector((swizzle_viewDidAppear:));
  Method originViewDidAppearMethod = class_getInstanceMethod(class, originViewDidAppearSel);
  Method swizzleViewDidAppearMethod = class_getInstanceMethod(class, swizzleViewDidAppearSel);
  BOOL didAddMethod = class_addMethod(class, originViewDidAppearSel, method_getImplementation(swizzleViewDidAppearMethod), method_getTypeEncoding(swizzleViewDidAppearMethod));
  if (didAddMethod) {
    class_replaceMethod(class, swizzleViewDidAppearSel, method_getImplementation(originViewDidAppearMethod), method_getTypeEncoding(originViewDidAppearMethod));
  } else {
    method_exchangeImplementations(originViewDidAppearMethod, swizzleViewDidAppearMethod);
  }
}

+(void)swizzleViewDidDisappearSel{
  Class class = [super class];
  SEL originViewDidDisappearSel = @selector(viewDidDisappear:);
  SEL swizzleViewDidDisappearSel = @selector((swizzle_viewDidDisappear:));
  Method originViewDidDisappearMethod = class_getInstanceMethod(class, originViewDidDisappearSel);
  Method swizzleViewDidDisAppearMethod = class_getInstanceMethod(class, swizzleViewDidDisappearSel);
  BOOL didAddMethod = class_addMethod(class, originViewDidDisappearSel, method_getImplementation(swizzleViewDidDisAppearMethod), method_getTypeEncoding(swizzleViewDidDisAppearMethod));
  if (didAddMethod) {
    class_replaceMethod(class, swizzleViewDidDisappearSel, method_getImplementation(originViewDidDisappearMethod), method_getTypeEncoding(originViewDidDisappearMethod));
  } else {
    method_exchangeImplementations(originViewDidDisappearMethod, swizzleViewDidDisAppearMethod);
  }
}

-(void)swizzle_viewDidDisappear:(BOOL)animated {
  [self swizzle_viewDidDisappear:animated];
  [self hideTrackViews];
}
 
-(void)swizzle_viewDidAppear:(BOOL)animated {
  [self swizzle_viewDidAppear:animated];
  [EventTracker shareInstance].currentViewController = self;
  [EventTracker shareInstance].screenShot = [self makeImageWithView:self.view];
  if ([EventTracker shareInstance].boardView) {
    [EventTracker shareInstance].boardView.pageTitle.text = self.navigationItem.title ? self.navigationItem.title : @"未设置";
  }
  
  if (![EventTracker shareInstance].isShowEventTrackPointView) {
    return;
  }
  
  
  [self logView:self.view];
  
  
}

//根据view生成image
-(UIImage *)makeImageWithView:(UIView *)contentView{
    UIImage *imageRet = [[UIImage alloc]init];
    //UIGraphicsBeginImageContextWithOptions(区域大小, 是否是非透明的, 屏幕密度);
    UIGraphicsBeginImageContextWithOptions(contentView.frame.size, YES, [UIScreen mainScreen].scale);
    [contentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageRet;
}

-(void)logView:(UIView *)searchView {
  
  if (!self.speratView) {
    self.speratView = [[UIView alloc]initWithFrame:self.view.frame];
    self.speratView.backgroundColor = [UIColor colorWithRed:1.f green:1.f blue:1.f alpha:0];
    [self.view addSubview:self.speratView];
  }
  
  if (!self.trackViews) {
    self.trackViews = [NSMutableArray array];
  }
  
  for (UIView * subView in searchView.subviews) {
    if (subView.accessibilityIdentifier) {
      CGRect rect = [subView convertRect:subView.bounds toView:self.view];
      EventTrackButton * trackView = [[EventTrackButton alloc]initWithFrame:rect];
      trackView.testID = subView.accessibilityIdentifier;
      trackView.trackBtnName = subView.accessibilityLabel;
      [trackView setTitle:@"未开启" forState:UIControlStateNormal];
      [trackView addTarget:self action:@selector(trackViewClick:) forControlEvents:UIControlEventTouchUpInside];
      [self.trackViews addObject:trackView];
      trackView.backgroundColor = [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:0.5];
      [self.view addSubview:trackView];
    }
    else{
      [self logView:subView];
    }
  }
}

-(void)trackViewClick:(EventTrackButton *)sender {
  CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
  CGFloat screenHeight = UIScreen.mainScreen.bounds.size.height;
  EventTrackPointDataView * view = [EventTrackPointDataView initWithSize:CGSizeMake(screenWidth-40, screenHeight-120)];
  view.clickBackHide = YES;
  view.testID.text = sender.testID;
  view.trackPointNameValue = sender.trackBtnName;
  [view presentCenterOffset:CGPointZero inView:UIApplication.sharedApplication.delegate.window];
}

- (void)hideTrackViews{
  for (UIView * trackView in self.trackViews) {
    [trackView removeFromSuperview];
  }
  [self.trackViews removeAllObjects];
  [self.speratView removeFromSuperview];
  self.speratView = NULL;
}

///重刷界面的遮罩图层
-(void)refresh{
  for (UIView * trackView in self.trackViews) {
    [trackView removeFromSuperview];
  }
  [self.trackViews removeAllObjects];
  [self.speratView removeFromSuperview];
  self.speratView = NULL;
  [self logView:self.view];
}


@end

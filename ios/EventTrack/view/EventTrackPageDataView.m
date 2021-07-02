//
//  EventTrackPageDataView.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "EventTrackPageDataView.h"
#import "UIView+Present.h"
#import "EventTracker.h"
#import "EventTrackNameEditView.h"
#import "ShowScreenShot.h"

@interface EventTrackPageDataView()

@property (weak, nonatomic) IBOutlet UILabel *componentCode;

@property (weak, nonatomic) IBOutlet UILabel *pageTitle;

@end

@implementation EventTrackPageDataView

+ (EventTrackPageDataView *)initWithSize:(CGSize)size{
  EventTrackPageDataView * view = [[UINib nibWithNibName:@"EventTrackPageDataView" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
  view.frame = CGRectMake(0, 0, size.width, size.height);
  view.componentCode.text = [EventTracker shareInstance].currentViewController.layoutInfo.name;
  NSString * title = [EventTracker shareInstance].currentViewController.navigationItem.title;
  view.pageTitle.text = title ? title : @"未设置";
  return view;
}

- (IBAction)closeBtnClick:(UIButton *)sender {
  [self dismissCenter];
}

///显示略缩图
- (IBAction)showThumbnail:(UIButton *)sender {
  ShowScreenShot * view = [ShowScreenShot initWithImage:[EventTracker shareInstance].screenShot];
  view.clickBackHide = YES;
  [view presentCenterOffset:CGPointZero inView:UIApplication.sharedApplication.delegate.window];
}

///修改名称
- (IBAction)changePageName:(UIButton *)sender {
  NSString * title = [EventTracker shareInstance].currentViewController.navigationItem.title;
  EventTrackNameEditView * view = [EventTrackNameEditView initWithName:title];
  [view presentCenterOffset:CGPointZero inView:UIApplication.sharedApplication.delegate.window];
}


///查看更多
- (IBAction)lookMoreData:(UIButton *)sender {
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

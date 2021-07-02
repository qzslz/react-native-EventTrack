//
//  EventTrackPointDataView.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "EventTrackPointDataView.h"
#import "UIView+Present.h"
#import "EventTrackNameEditView.h"

@implementation EventTrackPointDataView

+ (EventTrackPointDataView *)initWithSize:(CGSize)size{
  EventTrackPointDataView * view = [[UINib nibWithNibName:@"EventTrackPointDataView" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
  view.frame = CGRectMake(0, 0, size.width, size.height);
  return view;
}

- (IBAction)closeBtnClick:(UIButton *)sender {
  [self dismissCenter];
}

///修改名称
- (IBAction)changePageName:(UIButton *)sender {
  EventTrackNameEditView * view = [EventTrackNameEditView initWithName:self.trackPointNameValue];
  [view presentCenterOffset:CGPointZero inView:UIApplication.sharedApplication.delegate.window];
}


///查看更多
- (IBAction)lookMoreData:(UIButton *)sender {
}

- (IBAction)switchValueChange:(UISwitch *)sender {
}


- (void)setTrackPointNameValue:(NSString *)trackPointNameValue {
  _trackPointNameValue = trackPointNameValue;
  self.trackPointName.text = trackPointNameValue;
}


@end

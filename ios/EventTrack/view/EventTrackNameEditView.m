//
//  EventTrackNameEditView.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/29.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "EventTrackNameEditView.h"
#import "UIView+Present.h"

@implementation EventTrackNameEditView

+ (EventTrackNameEditView *)initWithName:(NSString *)name{
  EventTrackNameEditView * view = [[UINib nibWithNibName:@"EventTrackNameEditView" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
  view.frame = CGRectMake(0, 0, 275, 134);
  view.testField.text = name;
  return view;
}


- (IBAction)closeBtnClick:(UIButton *)sender {
  [self dismissCenter];
}


- (IBAction)sureBtnClick:(UIButton *)sender {
  [self dismissCenter];
}


@end

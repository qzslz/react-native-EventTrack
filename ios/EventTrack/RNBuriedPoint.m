//
//  EventTrackNativeHelper.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "RNBuriedPoint.h"
#import "EventTracker.h"

@implementation RNBuriedPoint

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(showEventTrackBoard){
  dispatch_async(dispatch_get_main_queue(), ^{
    [[EventTracker shareInstance]showTopEventTrackBoard];
  });
}

@end

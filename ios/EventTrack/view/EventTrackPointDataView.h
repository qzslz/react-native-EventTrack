//
//  EventTrackPointDataView.h
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventTrackPointDataView : UIView

@property (weak, nonatomic) IBOutlet UILabel *trackPointName;

@property (weak, nonatomic) IBOutlet UILabel *testID;

@property (copy, nonatomic) NSString *trackPointNameValue;

+ (EventTrackPointDataView *)initWithSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

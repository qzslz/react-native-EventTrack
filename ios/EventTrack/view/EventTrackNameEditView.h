//
//  EventTrackNameEditView.h
//  BooklnSaaS
//
//  Created by HFY on 2021/6/29.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventTrackNameEditView : UIView

@property (weak, nonatomic) IBOutlet UITextField *testField;

+ (EventTrackNameEditView *)initWithName:(NSString *)name;


@end

NS_ASSUME_NONNULL_END

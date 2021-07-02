//
//  EventTrackBoard.h
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventTrackBoard : UIView

@property (weak, nonatomic) IBOutlet UILabel *pageTitle;

+(EventTrackBoard *)initWithFrame:(CGRect)frame;

///设置数据
-(void)setData:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END

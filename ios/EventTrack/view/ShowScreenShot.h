//
//  ShowScreenShot.h
//  BooklnSaaS
//
//  Created by HFY on 2021/6/30.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowScreenShot : UIView

@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@property (strong, nonatomic) UIImage * img;

+ (ShowScreenShot *)initWithImage:(UIImage *)img;

@end

NS_ASSUME_NONNULL_END

//
//  ShowScreenShot.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/30.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "ShowScreenShot.h"
#import "UIView+Present.h"

@implementation ShowScreenShot

+ (ShowScreenShot *)initWithImage:(UIImage *)img{
  ShowScreenShot * view = [[UINib nibWithNibName:@"ShowScreenShot" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
  view.img = img;
  view.showImage.image = img;
  CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
  CGFloat screenHeight = UIScreen.mainScreen.bounds.size.height;
  view.frame = CGRectMake(0, 0, screenWidth, screenHeight-40);
  return view;
}


- (IBAction)closeClick:(UIButton *)sender {
  [self dismissCenter];
}

- (IBAction)uploadImage:(UIButton *)sender {
  [self dismissCenter];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  EventTrackBoard.m
//  BooklnSaaS
//
//  Created by HFY on 2021/6/24.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "EventTrackBoard.h"
#import "EventTracker.h"
#import "EventTrackPageDataView.h"
#import "EventTrackPointDataView.h"
#import "UIView+Present.h"
#import "EventTrackButton.h"

@interface EventTrackBoard()

@property (weak, nonatomic) IBOutlet UIButton *sizeBtn;



@end

@implementation EventTrackBoard

+(EventTrackBoard *)initWithFrame:(CGRect)frame {
  EventTrackBoard * view = [[UINib nibWithNibName:@"EventTrackBoard" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
  view.frame = frame;
  return view;
}

///关闭当前视图
- (IBAction)closeView:(UIButton *)sender {
  [[EventTracker shareInstance]closeTopEventTrackBoard];
}

///查看当前页面的埋点数据详情
- (IBAction)showPageDetail:(UIButton *)sender {
  CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
  CGFloat screenHeight = UIScreen.mainScreen.bounds.size.height;
  EventTrackPageDataView * view = [EventTrackPageDataView initWithSize:CGSizeMake(screenWidth-40, screenHeight-120)];
  view.clickBackHide = YES;
  [view presentCenterOffset:CGPointZero inView:UIApplication.sharedApplication.delegate.window];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];

    CGPoint currentPoint = [touch locationInView:self];
    // 获取上一个点
    CGPoint prePoint = [touch previousLocationInView:self];
    CGFloat offsetX = currentPoint.x - prePoint.x;
    CGFloat offsetY = currentPoint.y - prePoint.y;
    
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

///切换switch
- (IBAction)swichValueChange:(UISwitch *)sender {
  if (sender.isOn) {
    [[EventTracker shareInstance]showPointsTrackView];
  }
  else{
    [[EventTracker shareInstance]hidePointsTrackView];
  }
}

///
- (IBAction)sizeBtnClick:(UIButton *)sender {
  CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
  sender.selected = !sender.isSelected;
  if (!sender.isSelected) {
    [UIView animateWithDuration:0.7 animations:^{
      CGRect r = CGRectMake(self.frame.origin.x-(screenWidth-60), self.frame.origin.y, screenWidth-20, 230);
      self.frame = r;
    }];
    [sender setTitle:@"缩小" forState:UIControlStateNormal];
  }
  else{
    [UIView animateWithDuration:0.7 animations:^{
      CGRect r = CGRectMake(self.frame.origin.x+self.frame.size.width-40, self.frame.origin.y, 40, 40);
      self.frame = r;
    }];
    [sender setTitle:@"放大" forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
  }
}



- (void)setData:(NSDictionary *)param{
  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

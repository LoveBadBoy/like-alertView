//
//  YCAlertView.h
//  弹框demo
//
//  Created by 刘胤辰 on 16/7/22.
//  Copyright © 2016年 it.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCAlertView : UIView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle idenfyButtonTitle:(NSString *)idenfyButtonTitle hasBtnCount:(int)num superView:(UIView *)superView;

@end

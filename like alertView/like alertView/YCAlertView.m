//
//  YCAlertView.m
//  弹框demo
//
//  Created by 刘胤辰 on 16/7/22.
//  Copyright © 2016年 it.com. All rights reserved.
//

#define ten [UIScreen mainScreen].bounds.size.height/66.7


#import "YCAlertView.h"

@interface YCAlertView()

@property(nonatomic,strong)UIView *faV;

@end

@implementation YCAlertView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle idenfyButtonTitle:(NSString *)idenfyButtonTitle hasBtnCount:(int)num superView:(UIView *)superView{
 
    //弹出的view
    self=[super init];
    
    //遮罩视图(父view)
    self.faV=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.faV.backgroundColor=[UIColor blackColor];
    self.faV.alpha=0.4;
    
    
    //MARK: 弹出alertView
    //设置frame
    CGFloat marginX = 5*ten;
    CGFloat height = 13.5*ten;
    
    self.backgroundColor=[UIColor whiteColor];
    
    self.frame=CGRectMake(marginX,([UIScreen mainScreen].bounds.size.height-height)/2 ,[UIScreen mainScreen].bounds.size.width - 2*marginX, height);
    self.layer.cornerRadius = ten;
    self.layer.masksToBounds=YES;
    
    //设置子控件
    UIButton *cancleBt=[self addBtntag:0 title:cancelButtonTitle alertView:self hasBtnCount:2];
    UIButton *idenfyBt=[self addBtntag:1 title:idenfyButtonTitle alertView:self hasBtnCount:2];
    
    //添加label
    CGFloat xM=ten;
    CGFloat yM=2*ten;
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(xM, yM, self.frame.size.width-2*xM, 4*ten)];
    titleLab.textColor=[UIColor blackColor];
    titleLab.font=[UIFont systemFontOfSize:1.6*ten];
    titleLab.numberOfLines=0;
    titleLab.text=title;
    titleLab.textAlignment=NSTextAlignmentCenter;
    
    UILabel *messageLab=[[UILabel alloc]initWithFrame:CGRectMake(xM, yM+titleLab.frame.size.height-ten, self.frame.size.width-2*xM, 4*ten)];
    messageLab.text=message;
    messageLab.textAlignment=NSTextAlignmentCenter;
    messageLab.textColor=[UIColor redColor];
    messageLab.font=[UIFont systemFontOfSize:1.6*ten];
    
    
    //添加
    [self addSubview:cancleBt];
    [self addSubview:idenfyBt];
    [self addSubview:titleLab];
    [self addSubview:messageLab];
    
    [superView addSubview:self.faV];
    
    return self;
}

-(UIButton * )addBtntag:(NSInteger)tag title:(NSString *)title alertView:(UIView *)alertView hasBtnCount:(int)num{
    
    CGFloat btnHeight = 3.5*ten;
    CGFloat x = alertView.frame.size.width/num;
    UIButton *btn;
    
    //模拟细线的生成
    if (tag==num - 1) {
        
        btn=[[UIButton alloc]initWithFrame:CGRectMake(x*tag-1, alertView.frame.size.height - btnHeight, alertView.frame.size.width/num+3, btnHeight+1)];
    }else{
        
        btn=[[UIButton alloc]initWithFrame:CGRectMake(x*tag-1, alertView.frame.size.height - btnHeight, alertView.frame.size.width/num+1, btnHeight+1)];
    }
    
    //MARK: 设置细线的颜色
    btn.layer.borderColor=[[UIColor alloc]initWithWhite:230/255.0 alpha:1.0].CGColor;
    btn.layer.borderWidth=1;
    
    btn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:1.6*ten];
    //设置基本属性
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[[UIColor alloc]initWithRed:52/255.0 green:139/255.0 blue:249/255.0 alpha:1.0] forState:UIControlStateNormal];
    //    [btn addTarget:self action:@selector(clickDown:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    btn.backgroundColor=[[UIColor alloc]initWithWhite:1 alpha:1.0];
    
    return btn;
}

-(void)clickDown:(UIButton *)btn{
    
    btn.backgroundColor=[[UIColor alloc]initWithWhite:0.2 alpha:1.0];
}

-(void)click{
    
    [self removeFromSuperview];
    
    [self.faV removeFromSuperview];
}

@end

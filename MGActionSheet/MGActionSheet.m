//
//  MGActionSheet.m
//  MGActionView
//
//  Created by Memet on 7/23/16.
//  Copyright © 2016 Memet. All rights reserved.
//

#import "MGActionSheet.h"
//屏幕宽高
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
//半透明的背景颜色
#define BackColor(a) [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:a]

//按钮背景颜色
#define BtnBackColor [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7]
//按钮的字体颜色
#define BtnTitleColor [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]
//自带按钮的文字
#define DefaultBtnTitle @"Cancel"

@interface MGActionSheet()

@property (nonatomic, strong) UIVisualEffectView *ActionView;

@end

@implementation MGActionSheet

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray*)titles{
    
    self = [super initWithFrame:frame];
    [self setBackgroundColor:BackColor(0)];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = BackColor(0.5);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(HideSheet)];
    [self addGestureRecognizer:tap];
    //创建ActionView
    [self createActionViewWithTitles:titles];
    return self;
}

//创建ActionView
-(void)createActionViewWithTitles:(NSArray*)titles{
    
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.ActionView = [[UIVisualEffectView alloc] initWithEffect:blur];
    self.ActionView.frame = CGRectMake(0, HEIGHT, WIDTH, 56+50*titles.count);
    [self addSubview:self.ActionView];
    //actionview的高度
    CGFloat actionHeight = self.ActionView.frame.size.height;
    //添加白色
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, actionHeight)];
    whiteView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
    [self.ActionView addSubview:whiteView];
    //创建Button
    [self createButtonWithTitle:DefaultBtnTitle origin_y:actionHeight-50 tag:100 action:@selector(click:)];
    
    for (int i=0; i<titles.count; i++) {
        [self createButtonWithTitle:titles[i] origin_y:i*50.5 tag:i+101 action:@selector(click:)];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect tempFrame = self.ActionView.frame;
        tempFrame.origin.y -= tempFrame.size.height;
        self.ActionView.frame = tempFrame;
    }];
}

//创建按钮
-(void)createButtonWithTitle:(NSString*)title origin_y:(CGFloat)y tag:(NSInteger)tag action:(SEL)method{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, y, WIDTH, 50);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:BtnBackColor];
    [btn setTitleColor:BtnTitleColor forState:UIControlStateNormal];
    btn.tag = tag;
    [btn addTarget:self action:method forControlEvents:UIControlEventTouchUpInside];
    [self.ActionView addSubview:btn];
}

-(void)click:(UIButton*)btn{
    
    if (self.Click) {
        self.Click(btn.tag);
    }
    [self HideSheet];
}

-(void)HideSheet{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = BackColor(0);
        CGRect tempFrame = self.ActionView.frame;
        tempFrame.origin.y += tempFrame.size.height;
        self.ActionView.frame = tempFrame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end

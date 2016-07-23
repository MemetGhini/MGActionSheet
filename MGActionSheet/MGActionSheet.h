//
//  MGActionSheet.h
//  MGActionView
//
//  Created by Memet on 7/23/16.
//  Copyright © 2016 Memet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGActionSheet : UIView

//反向传被点击btn的Tag值
@property (nonatomic, copy) void (^Click)(NSInteger BtnTag);
//实例化Action
-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray*)titles;
//隐藏actionShit
-(void)HideSheet;


@end

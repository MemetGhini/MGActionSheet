//
//  ViewController.m
//  MGActionView
//
//  Created by Memet on 7/23/16.
//  Copyright © 2016 Memet. All rights reserved.
//

#import "ViewController.h"
#import "MGActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self customNav];
}

-(void)customNav{
    
    //自定义navigationbar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.5];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //添加右边的按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(showAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
}


-(void)showAction{
    
    MGActionSheet *actionSheet = [[MGActionSheet alloc] initWithFrame:self.view.frame titles:@[@"Sight",@"Take Photo",@"Choose from Photos"]];
    [self.navigationController.view addSubview:actionSheet];
    actionSheet.Click = ^(NSInteger BtnTag){
        
        //请尽情发挥功能
        switch (BtnTag) {
            case 101:{
                NSLog(@"您点击了Sight");
                break;
            }
            case 102:{
                NSLog(@"您点击了Take Photo");
                break;
            }
            case 103:{
                NSLog(@"您点击了Choose from Photos");
                break;
            }
            default:{
                NSLog(@"您点击了Cancel");
                break;
            }
        }
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

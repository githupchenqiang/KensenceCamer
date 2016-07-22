//
//  CamerViewController.m
//  N-mix
//
//  Created by chenq@kensence.com on 16/3/25.
//  Copyright © 2016年 times. All rights reserved.
//

#import "CamerViewController.h"
#import "Masonry.h"
#define View4Width self.view.frame.size.width
#define View4Height self.view.frame.size.height
#define AViewWidth     aView.frame.size.width
#define AViewHeight     aView.frame.size.height
@interface CamerViewController ()

@end

@implementation CamerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //背景图
    UIView *BacView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    BacView.backgroundColor = [UIColor colorWithRed:111/255.0 green:206/255.0 blue:250/255.0 alpha:1];
    [self.view addSubview:BacView];
    
    
    //取消按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(View4Width - 140, 0, 40, 40);
    button.layer.cornerRadius =20;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 0.2;
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:146/255.0 green:253/255.0 blue:123/255.0 alpha:1];
    [button addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchDown];
    [BacView addSubview:button];
    
    
    
    UIView *aView = [[UIView alloc]init];
    aView.frame = CGRectMake(View4Width * 0.2, 10, View4Width*0.13, View4Width * 0.13);
    aView.layer.cornerRadius = View4Width * 0.065;

    aView.layer.masksToBounds = YES;
    aView.backgroundColor = [UIColor colorWithRed:211/255.0 green:209/255.0 blue:192/255.0 alpha:1];
    [self.view addSubview:aView];

    UIView *MidView = [[UIView alloc]init];
    MidView.frame = CGRectMake(View4Width*0.1, View4Width*0.1, 20, 20);
    MidView.layer.cornerRadius = 10;
    MidView.layer.masksToBounds = YES;
    MidView.layer.borderColor = [UIColor blackColor].CGColor;
    MidView.layer.borderWidth = 0.2;
    MidView.center = aView.center;
    [aView addSubview:MidView];
    
    
    UIButton *UPButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *image = [UIImage imageNamed:@"Up"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [UPButton setImage:image forState:UIControlStateNormal];
    [UPButton addTarget:self action:@selector(UpButtonAction:) forControlEvents:UIControlEventTouchDown];
//    UPButton.backgroundColor = [UIColor redColor];
    [aView addSubview:UPButton];
    
    [UPButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aView.mas_top).with.offset(0);
        make.left.equalTo(aView.mas_left).with.offset(AViewWidth/2 -20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    
    
    UIButton *RightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *Rightimage = [UIImage imageNamed:@"Right"];
    Rightimage = [Rightimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [RightButton setImage:Rightimage forState:UIControlStateNormal];
    [RightButton addTarget:self action:@selector(RightButtonAction:) forControlEvents:UIControlEventTouchDown];
//    RightButton.backgroundColor = [UIColor redColor];
    [aView addSubview:RightButton];
    
    [RightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aView.mas_top).with.offset(AViewHeight/2 - 20);
        make.left.equalTo(aView.mas_left).with.offset(AViewWidth -40);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *DownButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *Downimage = [UIImage imageNamed:@"Down"];
    Downimage = [Downimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [DownButton setImage:Downimage forState:UIControlStateNormal];
    [DownButton addTarget:self action:@selector(DownButtonAction:) forControlEvents:UIControlEventTouchDown];
//    DownButton.backgroundColor = [UIColor redColor];
    [aView addSubview:DownButton];
    
    [DownButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aView.mas_top).with.offset(AViewHeight - 40);
        make.left.equalTo(aView.mas_left).with.offset(AViewWidth/2 -20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    
    
    UIButton *LeftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *Leftimage = [UIImage imageNamed:@"Left"];
    Leftimage = [Leftimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [LeftButton setImage:Leftimage forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(LeftButtonAction:) forControlEvents:UIControlEventTouchDown];
//    LeftButton.backgroundColor = [UIColor redColor];
    [aView addSubview:LeftButton];
    
    [LeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aView.mas_top).with.offset(AViewHeight/2 - 20);
        make.left.equalTo(aView.mas_left).with.offset(0);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    UIView *Corner = [[UIView alloc]init];
    Corner.frame = CGRectMake(0, 0, 60, 60);
    Corner.layer.borderWidth = 0.1;
    Corner.layer.borderColor = [UIColor blackColor].CGColor;
    Corner.center = aView.center;
    [aView addSubview:Corner];
    
    UIButton *S1buttotn = [UIButton buttonWithType:UIButtonTypeSystem];
    S1buttotn.frame = CGRectMake(CGRectGetMaxX(aView.frame)+View4Width*0.1,10, View4Width*0.1,View4Height*0.05);
    S1buttotn.layer.cornerRadius = 3;
    S1buttotn.layer.masksToBounds = YES;
    S1buttotn.layer.borderWidth = 0.5;
    S1buttotn.layer.borderColor = [UIColor blackColor].CGColor;
    [S1buttotn setTitle:@"S1" forState:UIControlStateNormal];
    [S1buttotn addTarget:self action:@selector(S1ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:S1buttotn];
    
    
    UIButton *S2buttotn = [UIButton buttonWithType:UIButtonTypeSystem];
    S2buttotn.frame = CGRectMake(CGRectGetMaxX(S1buttotn.frame)+20,10, View4Width*0.1,View4Height*0.05);
    S2buttotn.layer.cornerRadius = 3;
    S2buttotn.layer.masksToBounds = YES;
    S2buttotn.layer.borderWidth = 0.5;
    S2buttotn.layer.borderColor = [UIColor blackColor].CGColor;
    [S2buttotn setTitle:@"S2" forState:UIControlStateNormal];
    [S2buttotn addTarget:self action:@selector(S2ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:S2buttotn];
    
    
    UIButton *S3buttotn = [UIButton buttonWithType:UIButtonTypeSystem];
    S3buttotn.frame = CGRectMake(CGRectGetMaxX(S2buttotn.frame)+20,10, View4Width*0.1,View4Height*0.05);
    S3buttotn.layer.cornerRadius = 3;
    S3buttotn.layer.masksToBounds = YES;
    S3buttotn.layer.borderWidth = 0.5;
    [S3buttotn setTitle:@"S3" forState:UIControlStateNormal];
    S3buttotn.layer.borderColor = [UIColor blackColor].CGColor;
    [S3buttotn addTarget:self action:@selector(S3ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:S3buttotn];
    
    
    UIButton *Addbuttotn = [UIButton buttonWithType:UIButtonTypeSystem];
    Addbuttotn.frame = CGRectMake(CGRectGetMaxX(aView.frame)+View4Width*0.1,View4Height*0.05+View4Height * 0.08, View4Width*0.1,View4Height*0.05);
    Addbuttotn.layer.cornerRadius = 3;
    Addbuttotn.layer.masksToBounds = YES;
    Addbuttotn.layer.borderWidth = 0.5;
    [Addbuttotn setTitle:@"➕" forState:UIControlStateNormal];
    Addbuttotn.layer.borderColor = [UIColor blackColor].CGColor;
    [Addbuttotn addTarget:self action:@selector(AddbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Addbuttotn];
    
    
    UIButton *midbuttotn = [UIButton buttonWithType:UIButtonTypeSystem];
    midbuttotn.frame = CGRectMake(CGRectGetMaxX(Addbuttotn.frame)+20,View4Height*0.05+View4Height * 0.08, View4Width*0.1,View4Height*0.05);
    midbuttotn.layer.cornerRadius = 3;
    midbuttotn.layer.masksToBounds = YES;
    midbuttotn.layer.borderWidth = 0.5;
    [midbuttotn setTitle:@"51" forState:UIControlStateNormal];
    midbuttotn.layer.borderColor = [UIColor blackColor].CGColor;
    [midbuttotn addTarget:self action:@selector(midbuttotnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:midbuttotn];
    
    
    
    UIButton *Removebuttotn = [UIButton buttonWithType:UIButtonTypeSystem];
    Removebuttotn.frame = CGRectMake(CGRectGetMaxX(midbuttotn.frame)+20,View4Height*0.05+View4Height * 0.08, View4Width*0.1,View4Height*0.05);
    Removebuttotn.layer.cornerRadius = 3;
    Removebuttotn.layer.masksToBounds = YES;
    Removebuttotn.layer.borderWidth = 0.5;
    [Removebuttotn setTitle:@"➖" forState:UIControlStateNormal];
    Removebuttotn.layer.borderColor = [UIColor blackColor].CGColor;
    [Removebuttotn addTarget:self action:@selector(RemovebuttotnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Removebuttotn];
    
    
    
}
//s1
- (void)S1ButtonAction:(UIButton *)sender
{
    
}

//s2
- (void)S2ButtonAction:(UIButton*)sender
{
    
}

//s3
- (void)S3ButtonAction:(UIButton *)button
{
    
}

//Add
- (void)AddbuttonAction:(UIButton *)button
{
    
}



//mid
- (void)midbuttotnAction:(UIButton *)button
{
    
}


//remove
- (void)RemovebuttotnAction:(UIButton *)button
{
    
}




- (void)UpButtonAction:(UIButton *)UpButton
{
    
}

- (void)RightButtonAction:(UIButton *)RightButton
{
    
}


- (void)DownButtonAction:(UIButton *)DownButton
{
    
}



- (void)LeftButtonAction:(UIButton *)LeftButton
{
    
}


//取消按钮事件
- (void)ButtonAction:(UIButton *)button
{
    [self.view removeFromSuperview];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

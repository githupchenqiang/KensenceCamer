//
//  LightViewController.m
//  N-mix
//
//  Created by chenq@kensence.com on 16/3/25.
//  Copyright © 2016年 times. All rights reserved.
//

#import "LightViewController.h"
#define View4Width self.view.frame.size.width
#define View4Height self.view.frame.size.height

@interface LightViewController ()
@end
@implementation LightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //背景图
    UIView *BacView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    BacView.backgroundColor = [UIColor colorWithRed:111/255.0 green:206/255.0 blue:250/255.0 alpha:1];
    [self.view addSubview:BacView];

    //取消按钮
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(View4Width - 140, 0, 40, 40);
//    button.layer.cornerRadius =20;
//    button.layer.masksToBounds = YES;
//    button.layer.borderColor = [UIColor blackColor].CGColor;
//    button.layer.borderWidth = 0.2;
//    [button setTitle:@"取消" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor colorWithRed:146/255.0 green:253/255.0 blue:123/255.0 alpha:1];
//    [button addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchDown];
//    [BacView addSubview:button];
    
    
    UIButton *WindowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    WindowButton.frame = CGRectMake(View4Width * 0.08, View4Height * 0.01, View4Width * 0.1, View4Height * 0.05);
    WindowButton.layer.cornerRadius = 3;
    WindowButton.layer.masksToBounds = YES;
    WindowButton.layer.borderColor = [UIColor blackColor].CGColor;
    WindowButton.layer.borderWidth = 0.3;
    [WindowButton addTarget:self action:@selector(windowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [WindowButton setTitle:@"窗帘打开" forState:UIControlStateNormal];
    [self.view addSubview:WindowButton];
    
    
    UIButton *CloseWindow = [UIButton buttonWithType:UIButtonTypeSystem];
    CloseWindow.frame = CGRectMake(View4Width * 0.08, View4Height * 0.02+View4Height * 0.05+10, View4Width * 0.1, View4Height * 0.05);
    CloseWindow.layer.cornerRadius = 3;
    CloseWindow.layer.masksToBounds = YES;
    CloseWindow.layer.borderColor = [UIColor blackColor].CGColor;
    CloseWindow.layer.borderWidth = 0.3;
    [CloseWindow addTarget:self action:@selector(CloseWindowAction:) forControlEvents:UIControlEventTouchUpInside];
    [CloseWindow setTitle:@"窗帘打开" forState:UIControlStateNormal];
    [self.view addSubview:CloseWindow];
    
    UISlider *selider = [[UISlider alloc]init];
    
    selider.frame = CGRectMake(CGRectGetMaxX(CloseWindow.frame),60,View4Height * 0.19, 25);
    [selider setMinimumTrackTintColor:[UIColor grayColor]];
    [selider setMaximumTrackTintColor:[UIColor whiteColor]];
    selider.value = 0.0;
//    selider.layer.cornerRadius = 12.5;
//    selider.layer.masksToBounds = YES;
    selider.continuous = YES;
    selider.userInteractionEnabled = YES;
//    selider.backgroundColor = [UIColor orangeColor];
   selider.maximumValue = 10.0;
    selider.minimumValue = 0.1;
    
    selider.transform = CGAffineTransformMakeRotation(M_PI_2);
   
    //滑动拖动后的事件
    [selider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:selider];
    
    UIImageView *image = [[UIImageView alloc]init];
    image.frame = CGRectMake(CGRectGetMaxX(selider.frame)+30, 5, View4Width*0.04, View4Height*0.04);
    image.image = [UIImage imageNamed:@"电灯上"];
    image.backgroundColor = [UIColor cyanColor];
    image.layer.borderColor = [UIColor blackColor].CGColor;
    image.layer.borderWidth = 0.2;
    [self.view addSubview:image];
    
    UIButton *UpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UpButton.frame =  CGRectMake(CGRectGetMaxX(selider.frame)+30,View4Height*0.04+10, View4Width*0.04, View4Height*0.04);
    UIImage *up = [UIImage imageNamed:@"灯光向上"];
    up = [up imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [UpButton setImage:up forState:UIControlStateNormal];
    [UpButton addTarget:self action:@selector(UpButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UpButton.backgroundColor = [UIColor cyanColor];
    UpButton.layer.borderColor = [UIColor blackColor].CGColor;
    UpButton.layer.borderWidth = 0.2;
    [self.view addSubview:UpButton];
    
    
    UIButton *DownButton = [UIButton buttonWithType:UIButtonTypeSystem];
    DownButton.frame =  CGRectMake(CGRectGetMaxX(selider.frame)+30,CGRectGetMaxY(UpButton.frame)+5, View4Width*0.04, View4Height*0.04);
    UIImage *down = [UIImage imageNamed:@"灯光向下"];
    down = [down imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [DownButton setImage:down forState:UIControlStateNormal];
    [DownButton addTarget:self action:@selector(downButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    DownButton.backgroundColor = [UIColor cyanColor];
    DownButton.layer.borderColor = [UIColor blackColor].CGColor;
    DownButton.layer.borderWidth = 0.2;
    [self.view addSubview:DownButton];
    
    
    UIImageView *downimage = [[UIImageView alloc]init];
    downimage.frame = CGRectMake(CGRectGetMaxX(selider.frame)+30,CGRectGetMaxY(DownButton.frame)+5, View4Width*0.04, View4Height*0.04);
    downimage.image = [UIImage imageNamed:@"电灯下"];
    downimage.backgroundColor = [UIColor cyanColor];
    downimage.layer.borderColor = [UIColor blackColor].CGColor;
    downimage.layer.borderWidth = 0.2;
    [self.view addSubview:downimage];
    
 
    UISlider *RightSelider = [[UISlider alloc]init];
    RightSelider.frame = CGRectMake(CGRectGetMaxX(DownButton.frame)+View4Width*0.15, 60,View4Height * 0.19, 25);
    [RightSelider setMinimumTrackTintColor:[UIColor grayColor]];
    [RightSelider setMaximumTrackTintColor:[UIColor whiteColor]];
    RightSelider.value = 0;
    RightSelider.transform = CGAffineTransformMakeRotation(M_PI_2);
//  RightSelider.backgroundColor = [UIColor orangeColor];
    RightSelider.minimumValue = 0.0;
    RightSelider.maximumValue = 10.0;

    //滑动拖动后的事件
    [RightSelider addTarget:self action:@selector(RightSeliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:RightSelider];

    
    UIImageView *Rightimage = [[UIImageView alloc]init];
    Rightimage.frame = CGRectMake(CGRectGetMaxX(RightSelider.frame)+30, 5, View4Width*0.04, View4Height*0.04);
    Rightimage.image = [UIImage imageNamed:@"电灯上"];
    Rightimage.backgroundColor = [UIColor cyanColor];
    Rightimage.layer.borderColor = [UIColor blackColor].CGColor;
    Rightimage.layer.borderWidth = 0.2;
    [self.view addSubview:Rightimage];
    
    
    UIButton *RightUpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    RightUpButton.frame =  CGRectMake(CGRectGetMaxX(RightSelider.frame)+30,View4Height*0.04+10, View4Width*0.04, View4Height*0.04);
    UIImage *Rightup = [UIImage imageNamed:@"灯光向上"];
    Rightup = [Rightup imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [RightUpButton setImage:Rightup forState:UIControlStateNormal];
    [RightUpButton addTarget:self action:@selector(RightUpButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    RightUpButton.backgroundColor = [UIColor cyanColor];
    RightUpButton.layer.borderColor = [UIColor blackColor].CGColor;
    RightUpButton.layer.borderWidth = 0.2;
    [self.view addSubview:RightUpButton];
    
    
    UIButton *RightDownButton = [UIButton buttonWithType:UIButtonTypeSystem];
    RightDownButton.frame =  CGRectMake(CGRectGetMaxX(RightSelider.frame)+30,CGRectGetMaxY(UpButton.frame)+5, View4Width*0.04, View4Height*0.04);
    UIImage *Rightdown = [UIImage imageNamed:@"灯光向下"];
    Rightdown = [Rightdown imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [RightDownButton setImage:Rightdown forState:UIControlStateNormal];
    [RightDownButton addTarget:self action:@selector(RightDownButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    RightDownButton.backgroundColor = [UIColor cyanColor];
    RightDownButton.layer.borderColor = [UIColor blackColor].CGColor;
    RightDownButton.layer.borderWidth = 0.2;
    [self.view addSubview:RightDownButton];
    
    
    
    UIImageView *Rightdownimage = [[UIImageView alloc]init];
    Rightdownimage.frame = CGRectMake(CGRectGetMaxX(RightSelider.frame)+30,CGRectGetMaxY(DownButton.frame)+5, View4Width*0.04, View4Height*0.04);
    Rightdownimage.image = [UIImage imageNamed:@"电灯下"];
    Rightdownimage.backgroundColor = [UIColor cyanColor];
    Rightdownimage.layer.borderColor = [UIColor blackColor].CGColor;
    Rightdownimage.layer.borderWidth = 0.2;
    [self.view addSubview:Rightdownimage];
    

}

//左边的改变selider
- (void)sliderValueChanged:(UISlider *)slider
{
    
}




// 右边RightSeliderValueChanged
- (void)RightSeliderValueChanged:(UISlider *)selider
{
    
    
}



//右边灯光加
- (void)RightUpButtonAction:(UIButton *)button
{
    

    
}

//右边灯光减
-(void)RightDownButtonAction:(UIButton *)button
{
    
}

//灯光加
-(void)UpButtonAction:(UIButton *)buttton
{
    
}

//灯光减
- (void)downButtonAction:(UIButton *)button
{
    
}




//关闭窗帘
- (void)CloseWindowAction:(UIButton *)button
{
    
}



//打开窗帘
- (void)windowButtonAction:(UIButton *)button
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

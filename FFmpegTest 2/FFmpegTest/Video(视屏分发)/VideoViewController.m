//
//  VideoViewController.m
//  N-mix
//
//  Created by chenq@kensence.com on 16/3/25.
//  Copyright © 2016年 times. All rights reserved.
//

#import "VideoViewController.h"
#define View4Width self.view.frame.size.width
#define View4Height self.view.frame.size.height

@interface VideoViewController ()
@property(nonatomic,strong)UIView *VideoView;
@property (nonatomic ,strong)NSMutableArray *mutArray;
@property(nonatomic,strong)NSMutableArray *DataArray;
@property (nonatomic ,assign)NSInteger inter;
@property (nonatomic ,strong)NSMutableSet *MutSetArray; //中间传值数组
@property (nonatomic ,assign)BOOL isSelect;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景图
    UIView *BacView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    BacView.backgroundColor = [UIColor colorWithRed:111/255.0 green:206/255.0 blue:250/255.0 alpha:1];
    [self.view addSubview:BacView];
    
    _mutArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
    _DataArray = [NSMutableArray array];
    
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
    
    _VideoView = [[UIView alloc]init];
    _VideoView.frame = CGRectMake(50, 10, 100, 100);
    _VideoView.layer.borderWidth = 1;
    _VideoView.layer.borderColor = [UIColor blackColor].CGColor;
    _VideoView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_VideoView];
    
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 2; j++) {
            UIButton *RButton = [UIButton buttonWithType:UIButtonTypeSystem];
            RButton.frame = CGRectMake(View4Width * 0.3+(View4Width * 0.08+20)*i, 10+(View4Height*0.04+20)*j, View4Width * 0.08,View4Height*0.04);
            RButton.tag = 500 +5*i+j;
           RButton.backgroundColor = [UIColor colorWithRed:146/255.0 green:253/255.0 blue:123/255.0 alpha:1];
            RButton.layer.borderColor = [UIColor blackColor].CGColor;
            RButton.layer.borderWidth = 0.4;
            NSString *NUmberString = [NSString stringWithFormat:@"%d",5*j+i+1];
            [RButton setTitle:NUmberString forState:UIControlStateNormal];
            [RButton addTarget:self action:@selector(UserButtonAction:) forControlEvents:UIControlEventTouchDown];
            [self.view addSubview:RButton];
            
        }
    }

}


- (void)UserButtonAction:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
        self.inter = (NSInteger)(sender.tag - 500);
        NSNumber *numStr = [NSNumber numberWithInteger:self.inter];
        [_DataArray addObject:numStr];
        
        _MutSetArray = [NSMutableSet setWithArray:_DataArray];//改了数组
        NSArray *array = [_MutSetArray allObjects];
        NSArray *sorted = [array sortedArrayUsingSelector:@selector(compare:)];
        _DataArray = [NSMutableArray arrayWithArray:sorted];
        sender.backgroundColor = [UIColor orangeColor];
        
    }else
    {
        sender.backgroundColor = [UIColor colorWithRed:146/255.0 green:253/255.0 blue:123/255.0 alpha:1];
        sender.selected = NO;
        NSInteger inter = (NSInteger)(sender.tag - 500);
        NSNumber *number = [NSNumber numberWithInteger:inter];
        [_DataArray removeObject:number];
  
    }
    
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

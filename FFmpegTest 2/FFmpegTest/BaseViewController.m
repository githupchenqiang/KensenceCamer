//
//  BaseViewController.m
//  FFmpegTest
//
//  Created by chenq@kensence.com on 16/3/15.
//  Copyright © 2016年 times. All rights reserved.
//

#import "BaseViewController.h"
#import "Masonry.h"
#import "AllCamearArray.h"
#define Width4SuperView self.view.frame.size.width
#define Height4SuperView self.view.frame.size.height

#define Width4scroller _scroller.frame.size.width
#define Height4scroller _scroller.frame.size.height

#define ViewWidth  _view.frame.size.width
#define ViewHeight _view.frame.size.height



@interface BaseViewController ()
{
    UIScrollView *_scroller;
    
    UIView *_view;
    NSMutableArray *MutArray;
    
    NSInteger index;
   
 }

@property (nonatomic ,strong)NSNumber *temp;
@property (nonatomic ,assign)NSInteger LongPressCount;
@property (nonatomic ,strong)NSMutableArray  *CountArray;


@end

@implementation BaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    index = 0;
    
    UIImage *Switch = [UIImage imageNamed:@"退出"];
    [Switch imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *Switchbutton = [[UIBarButtonItem alloc]initWithImage:Switch style:(UIBarButtonItemStylePlain) target:self action:@selector(SwitchMessage:)];
    
    UIImage *form = [UIImage imageNamed:@"显示格式"];
    [form imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *formbutton = [[UIBarButtonItem alloc]initWithImage:form style:(UIBarButtonItemStylePlain) target:self action:@selector(FormBuutonAction:)];
    
    
    UIImage *lightControl = [UIImage imageNamed:@"灯光控制"];
    [lightControl imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *LightButton = [[UIBarButtonItem alloc]initWithImage:lightControl style:(UIBarButtonItemStylePlain) target:self action:@selector(LightButtonAction:)];
    
    UIImage *camera = [UIImage imageNamed:@"摄像头"];
    [camera imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *CameraButton = [[UIBarButtonItem alloc]initWithImage:camera style:(UIBarButtonItemStylePlain) target:self action:@selector(CameraButtonAction:)];
    
    
    UIImage *video = [UIImage imageNamed:@"视屏分发"];
    [video imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *videoButton = [[UIBarButtonItem alloc]initWithImage:video style:(UIBarButtonItemStylePlain) target:self action:@selector(videoButtonAction:)];
    
    
    UIImage *volume = [UIImage imageNamed:@"音量"];
    [volume imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *volumeButton = [[UIBarButtonItem alloc]initWithImage:volume style:(UIBarButtonItemStylePlain) target:self action:@selector(volumeButtonAction:)];
    
    
    UIImage *type = [UIImage imageNamed:@"显示模式"];
    [type imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *typeeButton = [[UIBarButtonItem alloc]initWithImage:type style:(UIBarButtonItemStylePlain) target:self action:@selector(typeButtonAction:)];
    
    
    self.navigationItem.rightBarButtonItems = @[Switchbutton,formbutton,LightButton,CameraButton,videoButton,volumeButton,typeeButton];
    
    
    _CountArray = [NSMutableArray array];
    
    
     NSNumber *nuber = [NSNumber numberWithInteger:1];
    
    [_CountArray addObject:nuber];
    
    NSNumber *nextnumber = [NSNumber numberWithInteger:2];
    [_CountArray addObject:nextnumber];
    
    NSNumber *third = [NSNumber numberWithInteger:3];
    [_CountArray addObject:third];
    
    
    NSNumber *thouth = [NSNumber numberWithInteger:4];
    [_CountArray addObject:thouth];
    
    
    
    

    
  NSString *path;
    
    

    
    NSLog(@"%f===%f",self.view.frame.size.width,self.view.frame.size.height);
    
    UIView *Aview = [[UIView alloc]init];
    Aview.frame = CGRectMake(100, 100, 100, 100);
    Aview.backgroundColor = [UIColor cyanColor];
    Aview.center = self.view.center;
    [self.view addSubview:Aview];
    
    MutArray = [NSMutableArray arrayWithObjects:
                                 @"http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4",
                                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                
                                nil];
    
    
    _scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0,55, Width4SuperView/6,150)];
    _scroller.contentSize = CGSizeMake(Width4SuperView/6,1000000);
    _scroller.showsVerticalScrollIndicator = YES;
    _scroller.showsHorizontalScrollIndicator = YES;
    _scroller.backgroundColor = [UIColor grayColor];
   // _scroller.center = self.view.center;
    [self.view addSubview:_scroller];

    [_scroller mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.top.equalTo(self.view.mas_top).with.offset(65);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-100);
        make.width.mas_equalTo( Width4SuperView/6);
  
 }];
//
    NSLog(@"%ld",(long)MutArray.count);
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    // increase buffering for .wmv, it solves problem with delaying audio frames
    if ([path.pathExtension isEqualToString:@"wmv"])
        parameters[KxMovieParameterMinBufferedDuration] = @(5.0);
    
    // disable deinterlacing for iPhone, because it's complex operation can cause stuttering
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[KxMovieParameterDisableDeinterlacing] = @(YES);
    for (int i = 0 ; i< MutArray.count; i++) {
        NSString *path = MutArray[i];
        
        _view = [[UIView alloc]init];
        _view.frame = CGRectMake(2,140*i, Width4SuperView/6, 130);
        _view.tag = 100+i;
        UIButton *button= [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0,0, Width4SuperView/6, 130);
//        button.backgroundColor = [UIColor orangeColor];
        button.tag = 330 + i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
     
        kxMovie = [KxMovieViewController movieViewControllerWithContentPath:path parameters:parameters];
        kxMovie.view.backgroundColor = [UIColor orangeColor];
        kxMovie.view.frame = CGRectMake(0,0, Width4SuperView/6, 130);
       UILongPressGestureRecognizer *Long = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongAction:)];
        Long.minimumPressDuration = 0.5;
        kxMovie.view.tag = 215+i;
        
        [kxMovie.view addGestureRecognizer:Long];
        
        [_scroller addSubview:_view];
        [_view addSubview:kxMovie.view];

        [self addChildViewController:kxMovie];
        
        [kxMovie.view addSubview:button];
    }
}


//平移
-(void)panAction:(UIPanGestureRecognizer *)pan{
    
    UIView *view = (UIView *)pan.view;
    
    CGPoint p1 = [pan translationInView:view];
    
    view.backgroundColor = [UIColor cyanColor];
    view.transform  = CGAffineTransformTranslate(view.transform,p1.x,p1.y);
//    view.alpha = 0;
    index = 0;
    
  
    [pan setTranslation:CGPointZero inView:view];
    NSLog(@"adasa%f",view.frame.origin.x);
    
    if (view.frame.origin.x < Width4SuperView/6-5) {
        [view removeFromSuperview];
        
    }
    
    
    

}

- (void)LongAction:(UIButton *)sender
{

    if (index == 0) {
        index ++;
        NSString *path = MutArray[_LongPressCount];
        NSLog(@"adadad%ld",(long)_LongPressCount);
        kxMovie = [KxMovieViewController movieViewControllerWithContentPath:path parameters:nil];
        kxMovie.view.frame = CGRectMake(Width4SuperView/6+5, 67,  Width4SuperView/6, 130);
        
        kxMovie.view.backgroundColor = [UIColor grayColor];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [kxMovie.view addGestureRecognizer:pan];
        
        [self.view addSubview:kxMovie.view];
        [self addChildViewController:kxMovie];
 
    }
}


- (void)buttonAction:(UIButton *)button
{
    
    _temp = nil;
    _LongPressCount = 0;
    
    for (int i = 0; i < _CountArray.count; i++) {
        
        NSInteger inter = (NSInteger)(button.tag - 330);
        
        _temp = [NSNumber numberWithInteger:inter];
        
        if (_CountArray[i] == _temp) {
            
            _LongPressCount = inter;
            NSLog(@"Long%d",_LongPressCount);
            
      
        }
        
        
        
    }
    
    
    
}


- (void)SwitchMessage:(UIBarButtonItem *)Switch
{
    
    [UIView beginAnimations:@"exitApplication" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
//    [UIView setAnimationTransition:UIViewAnimationCurveEaseInOut forView:self.view.window cache:NO];

    
}

- (void)LightButtonAction:(UIBarButtonItem *)Light
{
    NSLog(@"light");
    
  
}


- (void)FormBuutonAction:(UIBarButtonItem *)form
{
    
}


- (void)CameraButtonAction:(UIBarButtonItem *)camer
{
    
}


- (void)videoButtonAction:(UIBarButtonItem *)video
{
    
}

- (void)volumeButtonAction:(UIBarButtonItem *)Volume
{
    
}

- (void)typeButtonAction:(UIBarButtonItem *)type
{
    
    

}



@end

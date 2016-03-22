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
@property (nonatomic ,strong)UIScrollView  *SenceSCroller;
@property (nonatomic ,strong)UIView  *Aview;
@property (nonatomic ,strong)UIScrollView *MeetingScroller;


@end

@implementation BaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:137/255.0 green:207/255.0 blue:247/255.0 alpha:0.7];
    
    
    
    index = 0;
    
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(10, 10, 40, 40);
//    [button setTitle:@"你" forState:UIControlStateNormal];
//    [self.navigationController.navigationBar addSubview:button];
//     
//    
//    
    
    
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
    
    
//
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
    MutArray = [NSMutableArray arrayWithObjects:
                                 @"http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4",
                                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                @"http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4",
                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                @"http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4",
                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                @"rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov",
                
                                nil];
    
    
    _scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0,55, Width4SuperView*0.15,Height4SuperView * 0.65)];
    _scroller.contentSize = CGSizeMake(Width4SuperView*0.15,1000000);
    _scroller.showsVerticalScrollIndicator = YES;
    _scroller.showsHorizontalScrollIndicator = YES;
    _scroller.backgroundColor = [UIColor grayColor];
   // _scroller.center = self.view.center;
    [self.view addSubview:_scroller];

//    [_scroller mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(self.view.mas_top).with.offset(10);
//        make.top.equalTo(self.view.mas_top).with.offset(65);
//        make.left.equalTo(self.view.mas_left).with.offset(0);
//        make.bottom.equalTo(self.view.mas_bottom).with.offset(-Height4SuperView*0.3);
//        make.width.mas_equalTo( Width4SuperView/6);
//  
// }];
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
        _view.frame = CGRectMake(2,140*i, Width4SuperView*0.15, 130);
        _view.tag = 100+i;
        _view.backgroundColor = [UIColor cyanColor];
        UIButton *button= [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0,0, Width4SuperView*0.15, 130);
//        button.backgroundColor = [UIColor orangeColor];
        button.tag = 330 + i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
     
        kxMovie = [KxMovieViewController movieViewControllerWithContentPath:path parameters:parameters];
        kxMovie.view.backgroundColor = [UIColor orangeColor];
        kxMovie.view.frame = CGRectMake(0,0, Width4SuperView*0.15, 105);
       UILongPressGestureRecognizer *Long = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongAction:)];
        Long.minimumPressDuration = 0.5;
        kxMovie.view.tag = 215+i;
        
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0,CGRectGetMaxY(kxMovie.view.frame),Width4SuperView*0.15, 25);
        NSString *text = [NSString stringWithFormat:@"摄像头%d",i];
        label.text = text;
        label.textAlignment = NSTextAlignmentCenter;
        
        [_view addSubview:label];
        
        [kxMovie.view addGestureRecognizer:Long];
        
        [_scroller addSubview:_view];
        [_view addSubview:kxMovie.view];

        [self addChildViewController:kxMovie];
        
        [kxMovie.view addSubview:button];
    }
    
    [self drawView4Sence];
    [self SetUpview];
    [self DreawMeeting];
    
    
    
}

//场景列表
- (void)drawView4Sence
{
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(2,CGRectGetMaxY(_scroller.frame)+2, 20,Width4SuperView*0.1);
    label.text = @"场\n景\n列\n表";
    label.numberOfLines = [label.text length];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    _SenceSCroller = [[UIScrollView alloc]init];
    _SenceSCroller.frame = CGRectMake(CGRectGetWidth(label.frame)+3, CGRectGetMaxY(_scroller.frame)+2, Width4SuperView - 24, Width4SuperView * 0.1);
    _SenceSCroller.contentSize = CGSizeMake((Width4SuperView - 22)*2, Width4SuperView * 0.1);
    _SenceSCroller.layer.borderWidth = 0.2;
    _SenceSCroller.layer.borderColor = [UIColor blackColor].CGColor;
    _SenceSCroller.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_SenceSCroller];
  
}



//模式界面
- (void)SetUpview
{
    _Aview = [[UIView alloc]init];
    _Aview.frame = CGRectMake(2, CGRectGetMaxY(_SenceSCroller.frame)+2, Width4SuperView - 4,Height4SuperView * 0.137);
    _Aview.layer.borderColor = [UIColor blackColor].CGColor;
    _Aview.backgroundColor = [UIColor colorWithRed:123/255.0 green:197/255.0 blue:224/255.0 alpha:1];
    _Aview.layer.borderColor = [UIColor whiteColor].CGColor;
    _Aview.layer.borderWidth = 0.4;
    [self.view addSubview:_Aview];
    
    [_Aview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_SenceSCroller.mas_bottom).with.offset(2);
        make.left.equalTo(self.view.mas_left).with.offset(2);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-2);
        make.right.equalTo(self.view.mas_right).with.offset(-2);
        
    }];
    
    //应急模式
    UIButton *Emergencybutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Emergencybutton.frame = CGRectMake(Width4SuperView*0.14,Height4SuperView * 0.01,Width4SuperView * 0.09,Height4SuperView * 0.12);
    

    Emergencybutton.backgroundColor = [UIColor redColor];
    [Emergencybutton setImage:[UIImage imageNamed:@"应急"] forState:UIControlStateNormal];
    Emergencybutton.imageEdgeInsets = UIEdgeInsetsMake(5, 25,40,25);
    [Emergencybutton setTitle:@"应急模式" forState:UIControlStateNormal];
    Emergencybutton.titleLabel.font = [UIFont systemFontOfSize:19];
    
    Emergencybutton.titleEdgeInsets = UIEdgeInsetsMake(30,Emergencybutton.titleLabel.frame.size.width - 50, 0, 0);
    [Emergencybutton addTarget:self action:@selector(EmergencyAction:) forControlEvents:UIControlEventTouchDown];
    [_Aview addSubview:Emergencybutton];

//    [Emergencybutton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_Aview.mas_top).with.offset(25);
//        make.left.equalTo(_Aview.mas_left).with.offset(100);
//        make.height.mas_equalTo(35);
//        make.width.mas_equalTo(35);
//    }];
//    
    
    //
    UIButton *commandbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    commandbutton.frame = CGRectMake(Width4SuperView*0.29,Height4SuperView * 0.01,Width4SuperView * 0.09,Height4SuperView * 0.12);
    
    commandbutton.backgroundColor = [UIColor cyanColor];
    [commandbutton setImage:[UIImage imageNamed:@"指挥模式"] forState:UIControlStateNormal];
    commandbutton.imageEdgeInsets = UIEdgeInsetsMake(5, 25,40,25);
    [commandbutton setTitle:@"指挥模式" forState:UIControlStateNormal];
    commandbutton.titleLabel.font = [UIFont systemFontOfSize:19];
    
    commandbutton.titleEdgeInsets = UIEdgeInsetsMake(30,commandbutton.titleLabel.frame.size.width - 50, 0, 0);
    [commandbutton addTarget:self action:@selector(CommandAction:) forControlEvents:UIControlEventTouchDown];
    [_Aview addSubview:commandbutton];
    
    
    //
    UIButton *Roundbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Roundbutton.frame = CGRectMake(Width4SuperView * 0.43,Height4SuperView * 0.01,Width4SuperView * 0.09,Height4SuperView * 0.12);
    
    Roundbutton.backgroundColor = [UIColor orangeColor];
    [Roundbutton setImage:[UIImage imageNamed:@"循环模式"] forState:UIControlStateNormal];
    Roundbutton.imageEdgeInsets = UIEdgeInsetsMake(5, 25,40,25);
    [Roundbutton setTitle:@"循环模式" forState:UIControlStateNormal];
    Roundbutton.titleLabel.font = [UIFont systemFontOfSize:19];
    
    Roundbutton.titleEdgeInsets = UIEdgeInsetsMake(30,Roundbutton.titleLabel.frame.size.width - 50, 0, 0);
    [Roundbutton addTarget:self action:@selector(RoundAction:) forControlEvents:UIControlEventTouchDown];
    [_Aview addSubview:Roundbutton];
   
    //
    UIButton *Controlbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Controlbutton.frame = CGRectMake(Width4SuperView * 0.57,Height4SuperView * 0.01,Width4SuperView * 0.09,Height4SuperView * 0.12);
    
    Controlbutton.backgroundColor = [UIColor redColor];
    [Controlbutton setImage:[UIImage imageNamed:@"监控模式"] forState:UIControlStateNormal];
    Controlbutton.imageEdgeInsets = UIEdgeInsetsMake(5, 25,40,25);
    [Controlbutton setTitle:@"监控模式" forState:UIControlStateNormal];
    Controlbutton.titleLabel.font = [UIFont systemFontOfSize:19];
    
    Controlbutton.titleEdgeInsets = UIEdgeInsetsMake(30,Controlbutton.titleLabel.frame.size.width - 50, 0, 0);
    [Controlbutton addTarget:self action:@selector(ControlAction:) forControlEvents:UIControlEventTouchDown];
    [_Aview addSubview:Controlbutton];
    
    
    //
    UIButton *Meetingbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Meetingbutton.frame = CGRectMake(Width4SuperView * 0.71,Height4SuperView * 0.01,Width4SuperView * 0.09,Height4SuperView * 0.12);
    Meetingbutton.backgroundColor = [UIColor redColor];
    [Meetingbutton setImage:[UIImage imageNamed:@"会议模式"] forState:UIControlStateNormal];
    Meetingbutton.imageEdgeInsets = UIEdgeInsetsMake(5, 25,40,25);
    [Meetingbutton setTitle:@"会议模式" forState:UIControlStateNormal];
    Meetingbutton.titleLabel.font = [UIFont systemFontOfSize:19];
    
    Meetingbutton.titleEdgeInsets = UIEdgeInsetsMake(30,Meetingbutton.titleLabel.frame.size.width - 50, 0, 0);
    [Roundbutton addTarget:self action:@selector(MeetingAction:) forControlEvents:UIControlEventTouchDown];
    [_Aview addSubview:Meetingbutton];
  

}

//会场列表
- (void)DreawMeeting
{
    UILabel *meetingLabel = [[UILabel alloc]init];
    meetingLabel.frame = CGRectMake(300, 100, 100,100);
    meetingLabel.text = @"会场列表";
    meetingLabel.textAlignment = NSTextAlignmentCenter;
    meetingLabel.backgroundColor = [UIColor redColor];
    
    meetingLabel.font = [UIFont systemFontOfSize:27];
    [self.view addSubview:meetingLabel];
    [meetingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(65);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.width.mas_equalTo(Width4SuperView*0.17);
        make.height.mas_equalTo(Height4SuperView *0.05);

    }];

    
    _MeetingScroller = [[UIScrollView alloc]init];
    _MeetingScroller.frame = CGRectMake(100, 100, 100, 100);
    _MeetingScroller.contentSize = CGSizeMake(Width4SuperView*0.17, 100000);
    _MeetingScroller.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:_MeetingScroller];
    [_MeetingScroller mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(meetingLabel.mas_bottom).with.offset(2);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.width.mas_equalTo(Width4SuperView*0.17);
        make.bottom.equalTo(_SenceSCroller.mas_top).with.offset(-30);
        
    }];
    
    UIView *view = [[UIView alloc]init];
    view. backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_MeetingScroller.mas_bottom).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.width.mas_equalTo(Width4SuperView*0.17);
        make.bottom.equalTo(_SenceSCroller.mas_top).with.offset(-2);
        
    }];
    
    UIButton *MeetingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [MeetingButton addTarget:self action:@selector(MeetingButtonAction:) forControlEvents:UIControlEventTouchDown];
    UIImage *image = [UIImage imageNamed:@"向下"];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [MeetingButton setImage:image forState:UIControlStateNormal];
    MeetingButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:MeetingButton];
    
    [MeetingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_MeetingScroller.mas_bottom).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-Width4SuperView*0.03);
        make.width.mas_equalTo(Width4SuperView*0.1);
        make.bottom.equalTo(_SenceSCroller.mas_top).with.offset(-0);
//        make.center.mas_equalTo(view.center);
//        
    }];
 
}








//分屏按钮
- (void)DreawSplitScreen
{
    
    UIView *BackView = [[UIView alloc]init];
    BackView.frame = CGRectMake(CGRectGetMaxX(_scroller.frame),10, 100, 100);
    BackView.backgroundColor = [UIColor colorWithRed:123/255.0 green:197/255.0 blue:224/255.0 alpha:1];
    [self.view addSubview:BackView];
    
    [BackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scroller.mas_right).with.offset(2);
        make.bottom.equalTo(_SenceSCroller.mas_top).with.offset(2);
//        make.right.equalTo()
//        
        
    }];
    
    
    
}

//会场列表下一页
- (void)MeetingButtonAction:(UIButton *)MeetiongButton
{
    
    
    
}


//会议
- (void)MeetingAction:(UIButton *)Meeting

{
    NSLog(@"这是会议模式");
    
}



//监控模式
- (void)ControlAction:(UIButton *)Control

{
    NSLog(@"这是监控模式");
}





//轮巡
- (void)RoundAction:(UIButton *)Round
{
    NSLog(@"这是轮巡模式");
}



//指挥
- (void)CommandAction:(UIButton *)Command
{
    NSLog(@"这是指挥模式");
}



//应急
- (void)EmergencyAction:(UIButton *)sender
{
    NSLog(@"这是应急模式");
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
    
    if (view.frame.origin.x < Width4SuperView/6/3) {
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
            NSLog(@"Long%ld",(long)_LongPressCount);

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

//灯光控制
- (void)LightButtonAction:(UIBarButtonItem *)Light
{
    NSLog(@"light");
    
  
}

//显示格式
- (void)FormBuutonAction:(UIBarButtonItem *)form
{
    NSLog(@"这是会议模式");
}


//摄像头
- (void)CameraButtonAction:(UIBarButtonItem *)camer
{
            NSLog(@"这是摄像头模式");
}


//视屏分发
- (void)videoButtonAction:(UIBarButtonItem *)video
{
        NSLog(@"这是视频分发");
}

//音量控制
- (void)volumeButtonAction:(UIBarButtonItem *)Volume
{
        NSLog(@"这是音量控制");
}


//显示模式
- (void)typeButtonAction:(UIBarButtonItem *)type
{
        NSLog(@"这是显示模式");
    

}



@end

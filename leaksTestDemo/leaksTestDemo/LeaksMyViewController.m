//
//  LeaksViewController.m
//  leaksTestDemo
//
//  Created by 快邦 on 2018/6/26.
//  Copyright © 2018年 快邦. All rights reserved.
//

#import "LeaksMyViewController.h"
#import "WeakProxy.h"
@interface LeaksMyViewController ()
@property (nonatomic,strong)NSTimer * timer;
@property (nonatomic,strong)WeakProxy * proxy;
@end

@implementation LeaksMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor greenColor];
    
    self.proxy = [WeakProxy alloc];
    self.proxy.obj = self;
    
    _timer = [NSTimer timerWithTimeInterval:1 target:self.proxy selector:@selector(timerEvent) userInfo:nil repeats:YES];
     [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(200,200, 100, 100)];button.backgroundColor = [UIColor yellowColor];
    
    [button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}
-(void)goback{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    
}
-(void)timerEvent
{
    NSLog(@"寂寞沙洲冷");
}
-(void)dealloc
{
    NSLog(@"---dealloc----");
    [_timer invalidate];
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

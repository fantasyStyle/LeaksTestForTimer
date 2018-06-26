//
//  LwaksBlockViewController.m
//  leaksTestDemo
//
//  Created by 快邦 on 2018/6/26.
//  Copyright © 2018年 快邦. All rights reserved.
//

#import "LwaksBlockViewController.h"

@interface LwaksBlockViewController ()
@property (nonatomic,copy)dispatch_block_t block;
@property (nonatomic,strong)NSString *str;
@end

@implementation LwaksBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(200,200, 100, 100)];button.backgroundColor = [UIColor yellowColor];
    
    [button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.str = @"hello world";
    __weak typeof(self) weakSelf = self;//
    
    self.block = ^{
  
        __strong typeof(self) strongSelf = weakSelf;//栈中的一个局部变量，执行完会销毁
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@",strongSelf.str);
        });

    };
    
    NSLog(@"%@",self.block);
    // Do any additional setup after loading the view.
}
-(void)goback{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    
}
-(void)dealloc{
    NSLog(@"-------dealloc------------");
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

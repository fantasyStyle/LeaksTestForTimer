//
//  ViewController.m
//  leaksTestDemo
//
//  Created by 快邦 on 2018/6/26.
//  Copyright © 2018年 快邦. All rights reserved.
//

#import "ViewController.h"
#import "LeaksMyViewController.h"

#import "LwaksBlockViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(onclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)onclick{
//    LeaksMyViewController * vc = [LeaksMyViewController new];
//    [self presentViewController:vc animated:YES completion:^{
//
//    }];
    
    LwaksBlockViewController * vc = [LwaksBlockViewController new];
        [self presentViewController:vc animated:YES completion:^{
    
        }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

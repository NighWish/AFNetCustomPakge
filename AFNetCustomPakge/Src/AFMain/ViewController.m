//
//  ViewController.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworkManager.h"

@interface ViewController ()<AFNetworkRequestDelegate>

@property (nonatomic, strong) AFNetworkManager *netManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.netManager = [[AFNetworkManager alloc] init];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [but1 setTitle:@"Block" forState:UIControlStateNormal];
    but1.frame = CGRectMake(self.view.bounds.size.width/2 - 50, 100, 100, 30);
    [but1 addTarget:self action:@selector(actionClick1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [but2 setTitle:@"Delegate" forState:UIControlStateNormal];
    but2.frame = CGRectMake(self.view.bounds.size.width/2 - 50, 200, 100, 30);
    [but2 addTarget:self action:@selector(actionClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    UIButton *but3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [but3 setTitle:@"SEL" forState:UIControlStateNormal];
    but3.frame = CGRectMake(self.view.bounds.size.width/2 - 50, 300, 100, 30);
    [but3 addTarget:self action:@selector(actionClick3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionClick1:(id)sender
{
    NSDictionary *params = @{
                             @"userName":@"18538320461",
                             @"password":@"123456"
                             };
    [self.netManager postRequestWithURL:USER_LOGIN params:params identiry:@"login" isCache:NO successBlock:^(id respondeData) {
        NSLog(@"blockRespondeData: %@",respondeData);
        
    } failureBlock:^(id respondeData) {
        
        NSLog(@"blockRespondeDataError: %@",respondeData);
    }];
}

- (void)actionClick2:(id)sender
{
    NSDictionary *params = @{
                             @"userName":@"18538320461",
                             @"password":@"123456"
                             };
    [self.netManager postRequestWithURL:USER_LOGIN params:params identiry:@"login" isCache:NO delegate:self];
}

- (void)actionClick3:(id)sender
{
    NSDictionary *params = @{
                             @"userName":@"18538320461",
                             @"password":@"123456"
                             };
    [self.netManager postRequestWithURL:USER_LOGIN params:params identiry:@"login" isCache:NO target:self action:@selector(requestBackWithOperation:)];
}

- (void)requestBackWithOperation:(AFResponseOperation *)operation
{
    
}

#pragma mark -AFNetworkRequestDelegate
- (void)requestSuccessDidFinishWithData:(AFResponseOperation *)operation
{
    
}

- (void)requestFailureDidWithErrorData:(AFResponseOperation *)operation
{
    
}

@end

//
//  SubViewController.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "SubViewController.h"
#import "UserLoginModel.h"

@interface SubViewController ()<AFModelDelegate>

@property (nonatomic, strong) UserLoginModel *loginModel;

@end

@implementation SubViewController

- (void)viewDidLoad
{
    self.loginModel = [[UserLoginModel alloc] init];
    self.loginModel.delegate = self;
    [self.loginModel userLoginWithName:@"18538320461" password:@"123456"];
//    [self.loginModel userLoginDelegateWithName:@"18538320461" password:@"123456"];
//    [self.loginModel userLOginWithTargetWithName:@"18538320461" password:@"123456"];
}

#pragma mark -AFModelDelegate
- (void)requestSuccessWithResponseOperation:(AFResponseOperation *)operation
{
    self.adressLabel.text = self.loginModel.loginVO.address;
    self.emailLabel.text = self.loginModel.loginVO.email;
    self.name.text = self.loginModel.loginVO.nickName;
    self.sexLabe.text = (self.loginModel.loginVO.sex == 1) ? (@"男"): (@"女");
}

- (void)requestFailureWithResponseOperation:(AFResponseOperation *)operation
{
    
}

@end

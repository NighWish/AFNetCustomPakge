//
//  UserLoginModel.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "UserLoginModel.h"
#import "AFResponseOperation.h"

@interface UserLoginModel ()<AFNetworkRequestDelegate>

@end

@implementation UserLoginModel

- (void)userLoginWithName:(NSString *)name password:(NSString *)password
{
    if (name.length <= 0 || password.length <= 0) {
        return;
    }
    
    NSDictionary *param = @{@"userName": name,
                            @"password": password};
    
    __weak typeof(self) weakSelf = self;
    [self postRequestWithUrl:USER_LOGIN params:param identity:USER_LOGIN isCache:NO successBlock:^(id respondeData) {
        
        //在此处可进行具体的数据解析，封装成自己的VO
        AFResponseOperation *aOperation = (AFResponseOperation *)respondeData;
        if (aOperation.reponseError == nil) {
            NSDictionary *dict = aOperation.responseData[@"res"];
            weakSelf.loginVO = [[UserLoginVO alloc] initWithDictinary:dict];
        }
        
        [weakSelf.delegate requestSuccessWithResponseOperation:respondeData];
    } failBlock:^(id respondeData) {
        
        [weakSelf.delegate requestFailureWithResponseOperation:respondeData];
    }];
}

- (void)userLoginDelegateWithName:(NSString *)name password:(NSString *)password
{
    if (name.length <= 0 || password.length <= 0) {
        return;
    }
    
    NSDictionary *param = @{@"userName": name,
                            @"password": password};
    
    [self postRequestWithUrl:USER_LOGIN params:param identity:USER_LOGIN isCache:NO delegate:self];
}

- (void)userLOginWithTargetWithName:(NSString *)name password:(NSString *)password
{
    if (name.length <= 0 || password.length <= 0) {
        return;
    }
    
    NSDictionary *param = @{@"userName": name,
                            @"password": password};
    
    [self postRequestWithUrl:USER_LOGIN params:param identity:USER_LOGIN isCache:NO target:self action:@selector(requestLoginBackWithData:)];
}

#pragma mark -privateMethod
- (void)requestLoginBackWithData:(AFResponseOperation *)resOperation
{
    /**
     *  在此处可进行具体的数据解析，封装成自己的VO
     */
    if (resOperation.reponseError == nil) {
        NSDictionary *dict = resOperation.responseData[@"res"];
        self.loginVO = [[UserLoginVO alloc] initWithDictinary:dict];
        
        [self.delegate requestSuccessWithResponseOperation:resOperation];
    }else {
        
        [self.delegate requestFailureWithResponseOperation:resOperation];
    }
}

#pragma mark -AFNetworkRequestDelegate
- (void)requestSuccessDidFinishWithData:(AFResponseOperation *)operation
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(requestSuccessWithResponseOperation:)]) {
        
        /**
         *  在此处可进行具体的数据解析，封装成自己的VO
         */
        if (operation.reponseError == nil) {
            NSDictionary *dict = operation.responseData[@"res"];
            self.loginVO = [[UserLoginVO alloc] initWithDictinary:dict];
        }
        
        [self.delegate requestSuccessWithResponseOperation:operation];
    }
}

- (void)requestFailureDidWithErrorData:(AFResponseOperation *)operation
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(requestFailureWithResponseOperation:)]) {
        
        [self.delegate requestFailureWithResponseOperation:operation];
    }
}

@end

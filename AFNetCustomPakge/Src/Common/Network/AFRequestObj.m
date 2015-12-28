//
//  AFRequestObj.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "AFRequestObj.h"
#import "AFNetworking.h"
#import "AFResponseOperation.h"

@interface AFRequestObj ()

@property (nonatomic, weak) id<AFNetworkRequestDelegate> delegate;
@property (nonatomic, strong) id target;

@end

@implementation AFRequestObj
- (id)initWithType:(AFNetRequestType)type url:(NSString *)url params:(NSDictionary *)param requestIdentity:(NSString *)identity isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failBlock:(AFNetRequestFailureBlock)failBlock delegate:(id<AFNetworkRequestDelegate>)delegate target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        
        self.delegate = delegate;
        self.target = target;
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", nil];
        
        if (type == AFNetRequestGET) {
        
            __weak typeof(self) weakSelf = self;
            [manager GET:url parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                
                NSLog(@"---responseObject---: %@",responseObject);
                int code = 0;
                NSString *msg = nil;
                if (responseObject) {
                    NSString *success = responseObject[@"success"];
                    code = [success intValue];
                    msg = responseObject[@"msg"];
                }
                
                AFResponseOperation *responseOperation = [[AFResponseOperation alloc] init];
                responseOperation.identity = identity;
                responseOperation.responseData = responseObject;
                responseOperation.code = code;
                responseOperation.msg = msg;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (successBlock) {
                        successBlock(responseOperation);
                    }
                    
                    if (weakSelf.delegate != nil && [weakSelf.delegate respondsToSelector:@selector(requestSuccessDidFinishWithData:)]) {
                        [weakSelf.delegate requestSuccessDidFinishWithData:responseOperation];
                    }
                    
                    if ([weakSelf.target respondsToSelector:action]) {
                        [weakSelf.target performSelector:action withObject:responseOperation];
                    }
                });
                
                [weakSelf removeRequestItem];
            } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                NSLog(@"--errorResponseObject--: %@",operation);
                
                AFResponseOperation *responseOperation = [[AFResponseOperation alloc] init];
                responseOperation.identity = identity;
                responseOperation.responseData = operation.responseData;
                responseOperation.reponseError = error;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (failBlock) {
                        failBlock(responseOperation);
                    }
                    
                    if (weakSelf.delegate != nil && [weakSelf.delegate respondsToSelector:@selector(requestFailureDidWithErrorData:)]) {
                        [weakSelf.delegate requestFailureDidWithErrorData:responseOperation];
                    }
                    
                    if ([weakSelf.target respondsToSelector:action]) {
                        [weakSelf.target performSelector:action withObject:responseOperation];
                    }
                });

                [weakSelf removeRequestItem];
            }];
            
        }else if (type == AFNetRequestPOST) {
            
            __weak typeof(self) weakSelf = self;
            [manager POST:url parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                
                NSLog(@"---responseObject---: %@",responseObject);
                int code = 0;
                NSString *msg = nil;
                if (responseObject) {
                    NSString *success = responseObject[@"success"];
                    code = [success intValue];
                    msg = responseObject[@"msg"];
                }
                
                AFResponseOperation *responseOperation = [[AFResponseOperation alloc] init];
                responseOperation.identity = identity;
                responseOperation.responseData = responseObject;
                responseOperation.code = code;
                responseOperation.msg = msg;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (successBlock) {
                        successBlock(responseOperation);
                    }
                    
                    if (weakSelf.delegate != nil && [weakSelf.delegate respondsToSelector:@selector(requestSuccessDidFinishWithData:)]) {
                        [weakSelf.delegate requestSuccessDidFinishWithData:responseOperation];
                    }
                    
                    if ([weakSelf.target respondsToSelector:action]) {
                        [weakSelf.target performSelector:action withObject:responseOperation];
                    }
                });
                
                [weakSelf removeRequestItem];
            } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                NSLog(@"--errorResponseObject--: %@",operation);
                AFResponseOperation *responseOperation = [[AFResponseOperation alloc] init];
                responseOperation.identity = identity;
                responseOperation.responseData = operation.responseData;
                responseOperation.reponseError = error;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (failBlock) {
                        failBlock(responseOperation);
                    }
                    
                    if (weakSelf.delegate != nil && [weakSelf.delegate respondsToSelector:@selector(requestFailureDidWithErrorData:)]) {
                        [weakSelf.delegate requestFailureDidWithErrorData:responseOperation];
                    }
                    
                    if ([weakSelf.target respondsToSelector:action]) {
                        [weakSelf.target performSelector:action withObject:responseOperation];
                    }
                });

                [weakSelf removeRequestItem];
            }];
        }
    }
    
    return self;
}

#pragma makr -privateMethod
- (void)removeRequestItem
{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.deleteDelegate != nil && [weakSelf.deleteDelegate respondsToSelector:@selector(deleteRequestWithItem:)]) {
            [weakSelf.deleteDelegate deleteRequestWithItem:self];
        }
    });
}



@end

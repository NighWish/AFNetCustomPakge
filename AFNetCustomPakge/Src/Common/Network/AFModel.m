//
//  AFModel.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "AFModel.h"
#import "AFNetworkManager.h"

@interface AFModel ()

@property (nonatomic, strong) AFNetworkManager *networkManager;

@end

@implementation AFModel

- (void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failBlock:(AFNetRequestFailureBlock)failBlock
{
    [self.networkManager getRequestWithURL:url params:param identity:identityStr isCache:cache successBlock:successBlock failureBlock:failBlock];
}

- (void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delegate
{
    [self.networkManager getRequestWithURL:url params:param identity:identityStr isCache:cache  delegate:delegate];
}

- (void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache target:(id)target action:(SEL)action
{
    [self.networkManager getRequestWithURL:url params:param identity:identityStr isCache:cache target:target action:action];
}


- (void)postRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failBlock:(AFNetRequestFailureBlock)failBlock
{
    [self.networkManager postRequestWithURL:url params:param identiry:identityStr isCache:cache  successBlock:successBlock failureBlock:failBlock];
}

- (void)postRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delegate
{
    [self.networkManager postRequestWithURL:url params:param identiry:identityStr isCache:cache delegate:delegate];
}

- (void)postRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache target:(id)target action:(SEL)action
{
    [self.networkManager postRequestWithURL:url params:param identiry:identityStr isCache:cache target:target action:action];
}


#pragma mark - privateMethod
- (AFNetworkManager *)networkManager
{
    if (!_networkManager) {
        _networkManager = [[AFNetworkManager alloc] init];
    }
    
    return _networkManager;
}

@end

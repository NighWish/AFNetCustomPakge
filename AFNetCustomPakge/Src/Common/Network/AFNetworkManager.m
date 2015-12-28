//
//  AFNetworkManager.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "AFNetworkManager.h"
#import "AFNetworkHandler.h"

@interface AFNetworkManager ()

@property (nonatomic, strong) AFNetworkHandler *hander;

@end

@implementation AFNetworkManager

#pragma mark -publicMethod

- (void)getRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failureBlock:(AFNetRequestFailureBlock)failBlock
{
    [self getAllRequestWithURL:url params:paramDict identity:identity isCache:cache successBlock:successBlock failureBlock:failBlock delegate:nil target:nil action:nil];
}

- (void)getRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delegate
{
    [self getAllRequestWithURL:url params:paramDict identity:identity isCache:cache successBlock:nil failureBlock:nil delegate:delegate target:nil action:nil];
}

- (void)getRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)cache target:(id)target action:(SEL)action
{
    [self getAllRequestWithURL:url params:paramDict identity:identity isCache:cache successBlock:nil failureBlock:nil delegate:nil target:target action:action];
}

- (void)postRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identiry:(NSString *)identity isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failureBlock:(AFNetRequestFailureBlock)failureBlock
{
    [self postAllRequestWithURL:url params:paramDict identity:identity isCache:cache successBlock:successBlock failureBlock:failureBlock delegate:nil target:nil action:nil];
}

- (void)postRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identiry:(NSString *)identity isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delgate
{
    [self postAllRequestWithURL:url params:paramDict identity:identity isCache:cache successBlock:nil failureBlock:nil delegate:delgate target:nil action:nil];
}

- (void)postRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identiry:(NSString *)identity isCache:(BOOL)cache target:(id)target action:(SEL)action
{
    [self postAllRequestWithURL:url params:paramDict identity:identity isCache:cache successBlock:nil failureBlock:nil delegate:nil target:target action:action];
}


#pragma mark -privateMethod
- (void)getAllRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)isCache successBlock:(AFNetRequestSuccessBlock)successBlock failureBlock:(AFNetRequestFailureBlock)failureBlock delegate:(id<AFNetworkRequestDelegate>)delegate target:(id)target action:(SEL)action
{
    [self.hander requestURL:url MethodType:AFNetRequestGET params:paramDict identity:identity isCache:isCache successBlock:successBlock failBlock:failureBlock delegate:delegate target:target action:action];
}

- (void)postAllRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)isCache successBlock:(AFNetRequestSuccessBlock)successBlock failureBlock:(AFNetRequestFailureBlock)failureBlock delegate:(id<AFNetworkRequestDelegate>)delegate target:(id)target action:(SEL)action
{
    [self.hander requestURL:url MethodType:AFNetRequestPOST params:paramDict identity:identity isCache:isCache successBlock:successBlock failBlock:failureBlock delegate:delegate target:target action:action];
}

- (AFNetworkHandler *)hander {
    if (!_hander) {
        _hander = [[AFNetworkHandler alloc] init];
    }
    
    return _hander;
}

@end

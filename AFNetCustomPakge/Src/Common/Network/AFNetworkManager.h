//
//  AFNetworkManager.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkDefine.h"
#import "AFNetworkRequestDelegate.h"

@interface AFNetworkManager : NSObject
/**
 *  发送get请求使用block回调
 *
 *  @param url          请求url
 *  @param paramDict    请求参数
 *  @param identity     请求唯一标识
 *  @param isCache      是否读取缓存
 *  @param successBlock 请求成功block回调
 *  @param failBlock    请求成功block回调
 */
- (void)getRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failureBlock:(AFNetRequestFailureBlock)failBlock;


/**
 *  发送get请求使用Delegate回调
 *
 *  @param url       请求url
 *  @param paramDict 请求参数
 *  @param identity  请求唯一标识
 *  @param isCache   是否读取缓存
 *  @param successDelegate  请求成功delegate回调
 *  @param failDelegate  请求成功delegate回调
 */
- (void)getRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delegate;


/**
 *  发送get请求使用单个SEL方法回调
 *
 *  @param url       请求url
 *  @param paramDict 请求参数
 *  @param identity  请求唯一标识
 *  @param isCache   是否读取缓存
 *  @param target    回调方法的目标地
 *  @param action    回调方法
 */
- (void)getRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identity:(NSString *)identity isCache:(BOOL)cache target:(id)target action:(SEL)action;



/**
 *  发送post请求使用block回调
 *
 *  @param url          请求url
 *  @param paramDict    请求参数
 *  @param identity     请求唯一标识
 *  @param isCache      是否读取缓存
 *  @param successBlock 请求成功block回调
 *  @param failureBlock 请求失败block回调
 */
- (void)postRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identiry:(NSString *)identity isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failureBlock:(AFNetRequestFailureBlock)failureBlock;

/**
 *  发送get请求使用Delegate回调
 *
 *  @param url            请求url
 *  @param paramDict      请求参数
 *  @param identity       请求唯一标识
 *  @param isCache        是否读取缓存
 *  @param successDelgate 请求成功delgate回调
 *  @param failDelegate   请求成功delgate回调
 */
- (void)postRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identiry:(NSString *)identity isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delgate;

/**
 *  发送get请求使用单个SEL方法回调
 *
 *  @param url       请求url
 *  @param paramDict 请求参数
 *  @param identity  请求唯一标识
 *  @param isCache   是否读取缓存
 *  @param target    回调方法的目标地
 *  @param action    回调方法
 */
- (void)postRequestWithURL:(NSString *)url params:(NSDictionary *)paramDict identiry:(NSString *)identity isCache:(BOOL)cache target:(id)target action:(SEL)action;

@end

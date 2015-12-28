//
//  AFModel.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkDefine.h"
#import "AFNetworkRequestDelegate.h"
#import "AFModelDelegate.h"
#import "NetworkDefine.h"

@interface AFModel : NSObject

@property (nonatomic, weak) id<AFModelDelegate> delegate;

/**
 *  发送GET类型请求使用Block进行回调
 *
 *  @param url          请求路径
 *  @param param        请求参数
 *  @param identityStr  请求唯一标识符
 *  @param cache        是否读取缓存
 *  @param successBlock 请求成功回调Block
 *  @param failBlock    请求失败回调Block
 */
- (void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failBlock:(AFNetRequestFailureBlock)failBlock;


/**
 *  发送GET类型请求使用Delegate进行回调
 *
 *  @param url         请求路径
 *  @param param       请求参数
 *  @param identityStr 请求唯一标识符
 *  @param cache       是否读取缓存
 *  @param delegate    请求回调代理
 */
- (void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delegate;


/**
 *  发送GET类型请求使用SEL方法进行回调
 *
 *  @param url         请求路径
 *  @param param       请求参数
 *  @param identityStr 请求唯一标识符
 *  @param cache       是否读取缓存
 *  @param target      目标方法回调对象
 *  @param action      回调方法
 */
- (void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache target:(id)target action:(SEL)action;


/**
 *  发送POST类型请求使用Block进行回调
 *
 *  @param url          请求路径
 *  @param param        请求参数
 *  @param identityStr  请求唯一标识符
 *  @param cache        是否读取缓存
 *  @param successBlock 请求成功回调Block
 *  @param failBlock    请求失败回调Block
 */
- (void)postRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failBlock:(AFNetRequestFailureBlock)failBlock;


/**
 *  发送POST类型请求使用Delegate进行回调
 *
 *  @param url         请求路径
 *  @param param       请求参数
 *  @param identityStr 请求唯一标识符
 *  @param cache       是否读取缓存
 *  @param delegate    请求回调代理
 */
- (void)postRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache delegate:(id<AFNetworkRequestDelegate>)delegate;


/**
 *  发送POST类型请求使用SEL方法进行回调
 *
 *  @param url         请求路径
 *  @param param       请求参数
 *  @param identityStr 请求唯一标识符
 *  @param cache       是否读取缓存
 *  @param target      目标方法回调对象
 *  @param action      回调方法
 */
- (void)postRequestWithUrl:(NSString *)url params:(NSDictionary *)param identity:(NSString *)identityStr isCache:(BOOL)cache target:(id)target action:(SEL)action;


@end

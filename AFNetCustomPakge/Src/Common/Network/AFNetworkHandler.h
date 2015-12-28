//
//  AFNetworkHandler.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkDefine.h"
#import "AFNetworkRequestDelegate.h"

@interface AFNetworkHandler : NSObject

/**
 *  统一的数据请求方法
 *
 *  @param url          请求url
 *  @param type         请求类型 分GET，POST
 *  @param dict         请求参数字典
 *  @param identity     请求唯一标示
 *  @param cache        是否读取缓存
 *  @param successBlock 请求成功Block回调
 *  @param failBlock    请求失败Block回调
 *  @param delegate     请求代理回调
 *  @param target       请求回调目的地回调
 *  @param action       请求回调指定方法
 */
- (void)requestURL:(NSString *)url MethodType:(AFNetRequestType)type params:(NSDictionary *)dict identity:(NSString *)identity isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failBlock:(AFNetRequestFailureBlock)failBlock delegate:(id<AFNetworkRequestDelegate>)delegate target:(id)target action:(SEL)action;

@end

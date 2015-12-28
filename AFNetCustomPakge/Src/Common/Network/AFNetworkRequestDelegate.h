//
//  AFNetworkRequestDelegate.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFRequestObj;
@class AFResponseOperation;
@protocol AFNetworkRequestDelegate <NSObject>

@optional
/**
 *  数据请求成功的代理回调
 *
 *  @param operation 请求成功数据
 */
- (void)requestSuccessDidFinishWithData:(AFResponseOperation *)operation;

/**
 *  数据请求失败的代理回调
 *
 *  @param operation 请求失败，带错误信息数据
 */
- (void)requestFailureDidWithErrorData:(AFResponseOperation *)operation;


/**
 *  请求完数据释放掉请求
 *
 *  @param item 被释放的请求对象
 */
- (void)deleteRequestWithItem:(AFRequestObj *)item;

@end

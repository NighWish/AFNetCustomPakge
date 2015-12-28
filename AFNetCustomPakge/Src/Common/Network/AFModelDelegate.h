//
//  AFModelDelegate.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AFModelDelegate <NSObject>

/**
 *  Model数据请求成功回调
 *
 *  @param operation 成功返回的数据
 */
- (void)requestSuccessWithResponseOperation:(AFResponseOperation *)operation;

/**
 *  Model数据请求失败回调
 *
 *  @param operation 失败返回的数据
 */
- (void)requestFailureWithResponseOperation:(AFResponseOperation *)operation;

@end

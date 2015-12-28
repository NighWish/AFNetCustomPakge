//
//  AFResponseOperation.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFResponseOperation : NSObject

@property (nonatomic, strong) id responseData;          //请求回调数据
@property (nonatomic, strong) NSString *identity;       //请求唯一标识符
@property (nonatomic, strong) NSError *reponseError;    //请求失败错误信息
@property (nonatomic, strong) NSString *msg;            //请求回调信息（有时为失败提示）
@property (nonatomic, assign) int code;                 //请求回调编码，一般为0表示成功（具体看情况）

@end

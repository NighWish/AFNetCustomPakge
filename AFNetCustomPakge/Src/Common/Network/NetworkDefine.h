//
//  NetworkDefine.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#ifndef NetworkDefine_h
#define NetworkDefine_h

typedef enum  {
    AFNetRequestGET = 1,   /*get网络请求*/
    AFNetRequestPOST        /*post网络请求*/
} AFNetRequestType;

/**
 *  网络请求成功回调Block
 *
 *  @param respondeData 请求返回数据
 *  @param code         返回的编码
 *  @param msg          返回的信息
 */
typedef void(^AFNetRequestSuccessBlock)(id respondeData);


/**
 *  网络请求失败回调Block
 *
 *  @param error 错误信息类
 */
typedef void(^AFNetRequestFailureBlock)(id respondeData);




#define HOSTURL @"http://www.perasst.com:8081"  //服务器主机地址
#define PATH(_path) [NSString stringWithFormat:@"%@%@",HOSTURL,_path]

#define USER_LOGIN PATH(@"/perasst_v2/user/login.pa")   //用户登录
#define SENDER_MSG PATH(@"/perasst_v2/user/sendRegisterVerifyCode.pa")  //发送验证码
#define USER_REGISTER PATH(@"/perasst_v2/user/sendRegisterVerifyCode.pa")  //用户注册


#endif /* NetworkDefine_h */

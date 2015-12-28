//
//  UserLoginModel.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "AFModel.h"
#import "UserLoginVO.h"

@interface UserLoginModel : AFModel

@property (nonatomic, strong) UserLoginVO *loginVO;

- (void)userLoginWithName:(NSString *)name password:(NSString *)password;
- (void)userLoginDelegateWithName:(NSString *)name password:(NSString *)password;
- (void)userLOginWithTargetWithName:(NSString *)name password:(NSString *)password;

@end

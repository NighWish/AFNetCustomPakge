//
//  UserLoginVO.h
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "AFObjectVO.h"

@interface UserLoginVO : AFObjectVO

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) NSInteger sex;

@end

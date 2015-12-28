//
//  UserLoginVO.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/14.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "UserLoginVO.h"

@implementation UserLoginVO

- (id)initWithDictinary:(NSDictionary *)dict
{
    if ([super initWithDictinary:dict]) {
        
        self.address = dict[@"address"];
        self.email = dict[@"email"];
        self.nickName = dict[@"nickName"];
        self.phone = dict[@"phone"];
        self.sex = [dict[@"sex"] integerValue];
    }
    
    return self;
}

@end

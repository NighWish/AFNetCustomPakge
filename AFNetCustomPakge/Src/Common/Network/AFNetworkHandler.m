//
//  AFNetworkHandler.m
//  AFNetCustomPakge
//
//  Created by jt on 15/12/11.
//  Copyright © 2015年 com.jtjr.www. All rights reserved.
//

#import "AFNetworkHandler.h"
#import "AFRequestObj.h"

@interface AFNetworkHandler ()<AFNetworkRequestDelegate>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) AFRequestObj *requestItem;

@end


@implementation AFNetworkHandler

#pragma mark -publicMethod
- (void)requestURL:(NSString *)url MethodType:(AFNetRequestType)type params:(NSDictionary *)dict identity:(NSString *)identity isCache:(BOOL)cache successBlock:(AFNetRequestSuccessBlock)successBlock failBlock:(AFNetRequestFailureBlock)failBlock delegate:(id<AFNetworkRequestDelegate>)delegate target:(id)target action:(SEL)action
{
    self.requestItem = [[AFRequestObj alloc] initWithType:type url:url params:dict requestIdentity:identity isCache:cache successBlock:successBlock failBlock:failBlock delegate:delegate target:target action:action];
    self.requestItem.deleteDelegate = self;
    [self.items addObject:self.requestItem];
}

#pragma mark -privateMethod
- (NSMutableArray *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }

    return _items;
}

#pragma mark -AFNetworkRequestDelegate
- (void)deleteRequestWithItem:(AFRequestObj *)item
{
    [self.items removeAllObjects];
    self.requestItem = nil;
    NSLog(@"removeReuqeestOBjec");
}

@end

//
//  WeakProxy.m
//  leaksTestDemo
//
//  Created by 快邦 on 2018/6/26.
//  Copyright © 2018年 快邦. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.obj methodSignatureForSelector:sel];
}
- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.obj];
}
@end

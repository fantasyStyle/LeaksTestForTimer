//
//  WeakProxy.h
//  leaksTestDemo
//
//  Created by 快邦 on 2018/6/26.
//  Copyright © 2018年 快邦. All rights reserved.
//
/*
 NSProxy是一个为对象定义接口的抽象父类，并且为其它对象或者一些不存在的对象扮演了替身角色。通常，给proxy的消息被转发给实际对象或者导致proxy加载（转化它为）实际对象。NSProxy的子类能被用来实现透明的分布式消息(例如:NSDistantObject)或者延缓要花费昂贵代价创建的对象的实现。
 
 NSProxy实现被根类要求的基础方法，包括定义NSObject协议。然而，作为抽象类，他不实现初始化方法，并且会在收到任何他不响应的消息时引发异常。因此具体子类必须提供一个初始化或者创建方法并且重写forwardInvocation:和methodSignatureForSelector:方法来操纵它本身不执行的消息。不管怎样，一个子类的forwardInvocation:的实现应该需要处理invocation,例如通过网络转发invocation或者加载实际的对象并且把它传递给invocation.methodSignatureForSelector:被要求提供被给消息的参数类型信息；子类的实现应该考虑消息中参数类型，它需要据此促进和创建NSMethodSignature对象。参看NSDistantObject,NSInvocation和NSMethodSignature类指定的更多信息。
 
 
 */

#import <Foundation/Foundation.h>

@interface WeakProxy : NSProxy
@property (nonatomic,weak)NSObject * obj;
@end

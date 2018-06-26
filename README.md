# LeaksTestForTimer
针对NSTimer造成的循环引用处理
NSProxy

NSProxy是一个抽象类，必须继承实例化其子类才能使用。NSproxy具体使用参考官方示例，在上面示例中通过消息转发实现了同时对NSProxy发送NSMutableString和NSMutableArray类型的消息间接的实现了多重继承。
关于消息转发
当程序运行时调用一个没有实现的方法，会采用三个消息转发步骤如果这三个步骤都不能成功那么此时程序会抛出一个异常。

添加方法到类对象，对于实例方法调用respondsToSelector:，对于类方法调用resolveClassMethod:。

1
2
+(BOOL)resolveClassMethod:(SEL)sel;
-(BOOL)respondsToSelector:(SEL)aSelector;
查找forwardingTargetForSelector:方法，该方法返回一个新对象，如果返回nil那么将跳转到下一步骤。

1
-(id)forwardingTargetForSelector:(SEL)aSelector;
通过methodSignatureForSelector:方法获取一个NSMethodSignature类型的对象，调用forwardInvocation:方法。改方法传入一个封装了NSMethodSignature的NSInvocation对象。然后该对象通过invakeWithTarget:方法将消息转发给其它对象。

1
2
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector;
- (void)forwardInvocation:(NSInvocation *)invocation;

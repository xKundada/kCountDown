//
//  UIViewController+_kCa.m
//  KCountDown
//
//  Created by xkun on 16/7/6.
//  Copyright © 2016年 xkun. All rights reserved.
//

#import "UIViewController+_kCa.h"
#import <objc/runtime.h>
@implementation UIViewController (_kCa)

+(void)load{
    
    Method originalMethod = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method newMethod = class_getInstanceMethod(self, @selector(kViewDidLoad));
    method_exchangeImplementations(originalMethod, newMethod);
}

- (void)kViewDidLoad{
    NSLog(@"哈哈哈哈哈哈");
}

@end

//
//  main.m
//  runtimeDemo
//
//  Created by lordpan on 2020/6/21.
//  Copyright © 2020 lordpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

void method(){
    
}
void Demo1(){
    //创建类
    Class Book = objc_allocateClassPair([NSObject class], "Book", 0);
     //    添加成员变量
    class_addIvar(Book, "_title", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
    class_addIvar(Book, "_price", sizeof(int), sizeof(int),@encode(int) );
    
    SEL sel = sel_registerName("publish:");
    
    class_addMethod(Book, sel, (IMP)method, "v@:@");
    
    objc_registerClassPair(Book);
    
    id book = [[Book alloc]init];
    
    [book setValue:@"孔乙己" forKey:@"tiele"];
    
    Ivar pirce = class_getInstanceVariable(book, "_pirce");
    
    object_setIvar(book, pirce, @99);
    
    book = nil;
    objc_disposeClassPair(book);
    
    
    
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

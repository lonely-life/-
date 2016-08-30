//
//  ViewController.m
//  01、沙盒目录
//
//  Created by kinglinfu on 16/8/30.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "ViewController.h"
/***
 沙目录是数据持久化中最常用的用来寻找我们需要的目录文件的一种方法，同时我们在使用数据之前应该需要先弄明白相互局的储存方式和目录路径，而沙盒目录就是解决这个问题的最好的一个办法！
 用沙盒目录来管理文件的最大的好处在于每个APP都有其独立的一个沙河目录，彼此不共用，而且在iOS8以后每次我们在使用APP时都会改变APP的沙盒目录的路径，更好的提高了安全性
 **/

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     这两种方式是独立的去获取需要的文件路径的方法，第一步是现获取到大体的目录文件，然后在进一步获取我们需要的文件路径
     */
    // 沙盒目录路径
    NSString *homePath =  NSHomeDirectory();
    
    // Documents 目录
    NSString *documentsPath = [homePath stringByAppendingPathComponent:@"Documents"];
    
    NSLog(@"%@",documentsPath);
    NSLog(@"%@",[self docPath]);
    NSLog(@"%@",[self libPath]);
    NSLog(@"%@",[self cachesPath]);
    NSLog(@"%@",[self temPath]);
}

/**
 获取Documents目录
 这种方法是比较全面的直接获取路径的方法，通过这中方法我们可以直接获取到我们需要的目录文件的整体路径
 **/
- (NSString *)docPath {
    /** 
     NSSearchPathForDirectoriesInDomains: 获取文件目录路径
     参数一： 要获取的目录名称
     参数二： 要查找的目录的主目录(沙盒目录)
     参数三： 是否返回完整的路径
     **/
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


// 获取 Library目录
- (NSString *)libPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 获取缓存目录路径
 这里需要解释下的是缓存目录，所谓的缓存目录其实是放在Library目录文件下的一个子目录，这个目录主要是用来存储APP的缓存文件的
 */
- (NSString *)cachesPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

// 获取Tem目录
- (NSString *)temPath {
    
    return NSTemporaryDirectory();
}

/***
 注意：
 每一个APP都包含了三个主要的目录文件
 Documents：用于存放本地文件，像本地的数据，个人信息等等
 Library：存储APP的默认设置活其他信息
    Library/Caches(Library文件的子文件)：存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除
 Tem：用于存放临时文件，这个文件其实就是用来暂时存放的，就比如说我们在使用一个软件时开着这个软件就会产生一些临时的文件，而当我们关闭这个软件时就会删除这个临时文件里面的文件
 
 **/


@end

//
//  ViewController.m
//  04、数据归档
//
//  Created by kinglinfu on 16/8/30.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     创建文件，需要注意的是，我们所创建的文件，一开始创建出来的都是只有文件夹是我们所能看见的
     其他的文件，最开始创建出来的文件只有一个虚列的文件放在缓存区的，只有当我们给这个文件开始添加内容了，这个文件才会转到本地文件中来，并且显示
     */
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"info.archiv"];
    
    
    //添加内容
    NSArray *infos = @[@"1",@"2",@"3"];
    
    // 归档自定义的对象的前提是要实现 <NSCoding> 协议，对对象的属性进行编码和解码
    User *user = [[User alloc] init];
    user.userName = @"qwertyu";
    user.password = @"1234567";
    
    // 1、归档(编码保存)：将数据以二进制的形式保存，常用的NSString、NSArray、NSDictionary.... 可以直接归档保存，因为它们都实现了 <NSCoding> 协议 ： NSKeyedArchiver
    BOOL isSuccess = [NSKeyedArchiver archiveRootObject:user toFile:filePath];
    
    if (isSuccess) {
        
        NSLog(@"成功");
    } else {
        
        NSLog(@"失败");
    }
    
    NSLog(@"%@",docPath);
    
    
    // 2、解归档(读取解码)： NSKeyedUnarchiver
    id object = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    /***
     每一归档或者解码之后，都需要时实更新
    将这边的属性类型传值到User类中
     **/
    User *user_ = (User *)object;
    NSLog(@"%@  %@",user_.userName, user_.password);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  02、文件管理
//
//  Created by kinglinfu on 16/8/30.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [self createDirectory];
    // [self createFile];
    // [self removeFile];
    
    [self moveFile];
    
}

/**
 创建目录，我们在创建目录之前需要先弄明白我们创建的目录是放在哪个总体的路径之下的
 **/
- (void)createDirectory {
    
    // 文件管理类：用于管理（增、删、改、查）沙盒目录文件
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //创建文件夹并将其添加放到对应的文件路径下
    NSString *dataPath = [[self docPath] stringByAppendingPathComponent:@"Datas"];
    
    NSError *error = nil;
    
    /**
     使用NSFileManager创建目录，需要注意的是，用NSFileManager出那个键目录其返回值是一个BOOL型，这个返回值可以让我们做很多事
     就比如说像下边这个一样的，用来判断我们建立的文件是否建立成功
     */
    BOOL isCreated = [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error];
    
    if (isCreated) {
        NSLog(@"创建目录成功");
    } else {
        
        NSLog(@"创建目录失败");
    }
    
    NSLog(@"%@",dataPath);
}

/**
 创建文件并写入数据
 **/
- (void)createFile {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self docPath] stringByAppendingPathComponent:@"Datas/info.png"];
    
    //给创建的文件添加内容，这个内容利用text控件来添加的
    // NSString *text = @"这是保存的数据";
    //data带有一个添加的方式dataUsingEncoding:
    // NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    
    //给创建好的文件夹中添加图片文件
    UIImage *image = [UIImage imageNamed:@"足球"];
    NSData *imageData = UIImagePNGRepresentation(image);
    
    // 创建文件
    BOOL isCreated = [fileManager createFileAtPath:filePath contents:imageData attributes:nil];
    if (isCreated) {
        NSLog(@"创建成功");
        
        NSLog(@"%@",[self docPath]);
    } else {
        
        NSLog(@"创建失败");
    }
}

/**
 根据指导的路径移除文件、目录

 **/
- (void)removeFile {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self docPath] stringByAppendingPathComponent:@"Datas/info.png"];
    
    /**
    移除文件，移除当前文件夹中的某一个文件
     fileManager：文件夹名
     removeItemAtPath:需要移除的文件名
    **/
    BOOL isRemoved = [fileManager removeItemAtPath:filePath error:nil];
    
    
    if (isRemoved) {
        NSLog(@"文件移除成功");
        
    } else {
        NSLog(@"文件移除失败");
    }
    
    NSLog(@"%@",[self docPath]);
}


/**
 移动文件
 **/
- (void)moveFile {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self docPath] stringByAppendingPathComponent:@"Datas/info.png"];
    
    //创建一个新的文件用于移动使用
    NSString *toPath = [[self libPath] stringByAppendingPathComponent:@"足球.png"];
    
    /**
     移动文件，将需要移动的文件移动到某一个文件夹中
     fileManager：总体路径
     moveItemAtPath：接收文件的文件夹
     toPath:需要移动的文件
     */
    BOOL isMoved = [fileManager moveItemAtPath:filePath toPath:toPath error:nil];
    
    if (isMoved) {
        NSLog(@"移动完成");
        NSLog(@"%@",[self docPath]);
    } else {
        
        NSLog(@"移动失败");
    }
}


/***
 创建文件存放的总体目录路径也就是所谓的大体目录路径
 **/
- (NSString *)libPath {
    
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)docPath {

    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}




@end

//
//  User.h
//  04、数据归档
//
//  Created by kinglinfu on 16/8/30.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>
/**
 创建一个类，这个类只做两件事，一件事是将从ViewController文件中传递过来的属性进行转码，转为机器语言的十六进制
 第二件事，就是将转码后的文件内容转换成电脑能识别的二进制并用于储存
 **/
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@end

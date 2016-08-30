//
//  User.m
//  04、数据归档
//
//  Created by kinglinfu on 16/8/30.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "User.h"

@implementation User

#pragma mark - <NSCoing> 对属性编码和解码
// 编码，转换成十六进制
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeObject:_password forKey:@"password"];
}


// 解码，将内容转换成二进制用于计算机识别
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self ) {
        
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
    }
    
    return self;
}



@end

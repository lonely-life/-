//
//  User+CoreDataProperties.h
//  06、cocoDate
//
//  Created by tens04 on 16/9/8.
//  Copyright © 2016年 tens. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *userID;
@property (nullable, nonatomic, retain) NSString *suerName;
@property (nullable, nonatomic, retain) NSNumber *userAge;

@end

NS_ASSUME_NONNULL_END

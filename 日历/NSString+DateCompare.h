//
//  NSString+DateCompare.h
//  日历
//
//  Created by 于恩聪 on 16/4/5.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateCompare)
//date1 《= date2 返回ture
+ (BOOL)compare:(NSString *)date1 SmallEqualThan:(NSString *)date2;
//date1 < date2 ture
+ (BOOL)compare:(NSString *)date1 SmallThan:(NSString *)date2;


@end

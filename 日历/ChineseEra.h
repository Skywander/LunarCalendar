//
//  ChineseEra.h
//  日历
//
//  Created by 于恩聪 on 16/4/4.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChineseEra : NSObject

+ (NSArray *)getArrayWithString:(NSString *)paramter;

+ (NSInteger)getMonthDaysWithYear:(NSInteger)year Month:(NSInteger)month;

@end

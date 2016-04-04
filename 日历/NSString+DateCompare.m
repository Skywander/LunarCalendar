//
//  NSString+DateCompare.m
//  日历
//
//  Created by 于恩聪 on 16/4/5.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "NSString+DateCompare.h"

@implementation NSString (DateCompare)

+ (BOOL)compare:(NSString *)date1 SmallEqualThan:(NSString *)date2{
    NSArray *firstArray = [date1 componentsSeparatedByString:@"-"];
    
    NSArray *secondArray = [date2 componentsSeparatedByString:@"-"];
    
    NSInteger firstMonth = [[firstArray objectAtIndex:1] integerValue];
    
    NSInteger secondMonth = [[secondArray objectAtIndex:1] integerValue];
    
    NSInteger firstDay = [[firstArray objectAtIndex:2] integerValue];
    
    NSInteger secondDay = [[secondArray objectAtIndex:2] integerValue];
    
    if (firstMonth > secondMonth) {
        return false;
    }
    
    if (firstMonth == secondMonth && firstDay > secondDay) {
        return false;
    }
    return true;
}

+ (BOOL)compare:(NSString *)date1 SmallThan:(NSString *)date2{
    NSArray *firstArray = [date1 componentsSeparatedByString:@"-"];
    
    NSArray *secondArray = [date2 componentsSeparatedByString:@"-"];
    
    NSInteger firstMonth = [[firstArray objectAtIndex:1] integerValue];
    
    NSInteger secondMonth = [[secondArray objectAtIndex:1] integerValue];
    
    NSInteger firstDay = [[firstArray objectAtIndex:2] integerValue];
    
    NSInteger secondDay = [[secondArray objectAtIndex:2] integerValue];

    if (firstMonth > secondMonth) {
        return false;
    }
    if (firstMonth == secondMonth && firstDay >= secondDay) {
        return false;
    }
    
    return true;
}

@end

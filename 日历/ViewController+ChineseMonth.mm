//
//  ViewController+ChineseMonth.m
//  日历
//
//  Created by 于恩聪 on 16/4/5.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "ViewController+ChineseMonth.h"

#import "CalendarUtil.h"
#import "ChineseEra.h"
#import "NSString+DateCompare.h"
#import "ChineseCalendarDB.h"

@implementation ViewController (ChineseMonth)

- (NSString *)getChineseMonthWithYear:(NSInteger)year LunarDate:(NSString *)lunarDate{
    
    
    NSString *returnString = [NSString new];
    
    int tianganCount = (7 +  (year - 1900) % 10) % 10;
    
    NSArray *lunarYearArray = [NSArray arrayWithObjects:@"甲寅",@"丙寅",@"戊寅",@"庚寅",@"壬寅",@"甲寅",@"丙寅",@"戊寅",@"庚寅",@"壬寅",nil];
    //正月的天干
    NSString *ChineseYear = [lunarYearArray objectAtIndex:tianganCount];
    
    NSInteger _ChineseYear = [[ChineseEra getArrayWithString:@"ChineseYear"] indexOfObject:ChineseYear];
    
    
    NSArray *array = [CalendarUtil jieqiWithYear:year];
    
    NSInteger getLocation = 0;
    
    for (int i = 2; i < 22; i = i+2) {
        NSString *left = [array objectAtIndex:i];
        
        NSString *right = [array objectAtIndex:(i + 2)];
        
        if ([NSString compare:left SmallEqualThan:lunarDate] || [NSString compare:lunarDate SmallThan:right]) {
            getLocation = i / 2;
        }
        
        returnString = [[ChineseEra getArrayWithString:@"ChineseYear"] objectAtIndex:getLocation + _ChineseYear];
    }
    
    return returnString;
}

@end

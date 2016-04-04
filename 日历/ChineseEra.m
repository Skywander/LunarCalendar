//
//  ChineseEra.m
//  日历
//
//  Created by 于恩聪 on 16/4/4.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "ChineseEra.h"

@implementation ChineseEra

+ (NSArray *)getArrayWithString:(NSString *)paramter{
    
    NSArray *returnArray = [NSArray new];
    
    if ([paramter isEqualToString:@"ChineseYear"]) {
        returnArray = [NSArray arrayWithObjects:
                                 @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                                 @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                                 @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                                 @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                                 @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                                 @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    }
    if ([paramter isEqualToString:@"ChineseMonth"]) {
         returnArray =[NSArray arrayWithObjects:
                                @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                                @"九月", @"十月", @"冬月", @"腊月", nil];
    }
    if ([paramter isEqualToString:@"ChineseDay"]) {
        returnArray =[NSArray arrayWithObjects:
                              @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                              @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                              @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    }
    if ([paramter isEqualToString:@"weekday"]) {
        returnArray = [NSArray arrayWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日",nil];
    }
    
    return returnArray;

}

+ (NSInteger)getMonthDaysWithYear:(NSInteger)year Month:(NSInteger)month{
    
    NSInteger monthDays = 0;
    
    if (((year % 400 == 0) || (year %100 !=0 && year % 4 == 0)) && month == 2) {
        monthDays = 29;
    }else{
        if (month == 2) {
            monthDays = 28;
        }
        
        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
            monthDays = 31;
        }else{
            monthDays = 30;
        }
    }
    return monthDays;
}

@end

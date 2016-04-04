//
//  ViewController+ChineseDay.m
//  日历
//
//  Created by 于恩聪 on 16/4/4.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "ViewController+ChineseDay.h"

@implementation ViewController (ChineseDay)

- (NSString *)getChinesedayWithString:(NSString *)dateStr{
    
    NSLog(@"dateStr : %@",dateStr);
    
    NSArray *mbaseArray = [NSArray arrayWithObjects:@"0",@"31",@"-1",@"30",@"0",@"31",@"1",@"32",@"3",@"33",@"4",@"34",nil];
    
    NSArray *chineseDays = [ChineseEra getArrayWithString:@"ChineseYear"];
    
    NSArray *_dateArray = [dateStr componentsSeparatedByString:@"-"];
    
    NSString *_year = [_dateArray objectAtIndex:0];
    
    NSString *_month = [_dateArray objectAtIndex:1];
    
    NSString *_day = [_dateArray objectAtIndex:2];
    
    NSInteger year = [_year integerValue];
    
    NSInteger month = [_month integerValue];
    
    NSInteger day = [_day integerValue];
    
    if (month == 1 || month == 2) {
        month = month + 12;
        
        year --;
    }
    
    NSInteger C = year / 100;
    
    NSInteger i = 0;
    
    if (month % 2 == 0) {
        i = 6;
    }
    
    NSInteger y = year % 100;
    
    NSInteger m = month;
    
    NSInteger d = day;
    
    NSInteger g=4*C+C/4+5*y+y/4+3*(m+1)/5+d-3;
    NSInteger z=8*C+C/4+5*y+y/4+3*(m+1)/5+d+7+i;
    
    NSString *tiangan = @"癸,甲,乙,丙,丁,戊,己,庚,辛,壬";
    
    NSArray *tianganArray = [tiangan componentsSeparatedByString:@","];
    
    NSString *dizhi = @"亥,子,丑,寅,卯,辰,巳,午,未,申,酉,戌";
    
    NSArray *dizhiArray = [dizhi componentsSeparatedByString:@","];
    
    NSString *returnString = [NSString stringWithFormat:@"%@%@",[tianganArray objectAtIndex:(g % 10)],[dizhiArray objectAtIndex:z%12]];

    
    return returnString;
    
}
@end

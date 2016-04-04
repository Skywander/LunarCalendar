//
//  ViewController+ChineseMonth.h
//  日历
//
//  Created by 于恩聪 on 16/4/5.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (ChineseMonth)

- (NSString *)getChineseMonthWithYear:(NSInteger)year LunarDate:(NSString *)lunarDate;

@end

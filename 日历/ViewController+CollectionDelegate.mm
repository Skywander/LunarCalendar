//
//  ViewController+CollectionDelegate.m
//  日历
//
//  Created by 于恩聪 on 16/4/4.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "ViewController+CollectionDelegate.h"

#import "ViewController+ChineseDay.h"

#import "ViewController+SystemLunar.h"

#import "ViewController+ChineseMonth.h"

#import "ChineseCalendarDB.h"

#import "ChineseEra.h"

@implementation ViewController (CollectionDelegate)


#pragma collectionView callback

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.cellWidth, self.cellHeight);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 3.6, 2, 2);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *dateString = self.navigation.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSString *_year = [_dateArray objectAtIndex:0];
    
    NSString *_month = [_dateArray objectAtIndex:1];
    
    static NSString * CellIdentifier = @"collectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] init];
    }

    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }

    cell.backgroundColor = [UIColor whiteColor];

    [cell.layer setBorderWidth:0.3];
    [cell.layer setCornerRadius:5.f];
    [cell.layer setBorderColor:[UIColor clearColor].CGColor];

    if (self.weekday == 0) {
        self.weekday = 7;
    }
    
    NSInteger monthDays = [ChineseEra getMonthDaysWithYear:[_year integerValue] Month:[_month integerValue]];

    if ([indexPath row] * 7 + [indexPath section] >= self.weekday - 1 && [indexPath row] * 7 + [indexPath section] <= self.weekday + monthDays - 2) {

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, self.cellWidth, self.cellHeight / 2)];

        [label setText:[NSString stringWithFormat:@"%ld",[indexPath row]*7 + [indexPath section] - self.weekday + 2]];

        NSInteger _count = [indexPath row]*7 + [indexPath section] - self.weekday + 2;


        [label setTextColor:[UIColor grayColor]];

        [label setTextAlignment:NSTextAlignmentCenter];

        [label setFont:[UIFont systemFontOfSize:14]];

        [label setTextColor:DEFAULT_PINK];

        [cell addSubview:label];


        NSDateComponents *dateComponents = [CalendarUtil toChineseDateWithYear:[_year integerValue] month:_month day:_count];

        NSInteger _day = dateComponents.day;

        UILabel *lunarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.cellWidth / 2, self.cellWidth, self.cellWidth / 2)];

        [lunarLabel setText:[[ChineseEra getArrayWithString:@"ChineseDay"] objectAtIndex:_day - 1]];

        [lunarLabel setTextAlignment:NSTextAlignmentCenter];

        [lunarLabel setFont:[UIFont systemFontOfSize:14]];

        [lunarLabel setTextColor:DEFAULT_PINK];

        if (_count == _day) {
            [cell setBackgroundColor:DEFAULT_PINK];

            [label setTextColor:[UIColor whiteColor]];

            [lunarLabel setTextColor:[UIColor whiteColor]];

            self.currentCell = cell;

            self.selectedDate = [CalendarUtil toChineseDateWithYear:[_year integerValue] month:_month day:_count];

        }

        [cell addSubview:lunarLabel];
    }


    return cell;
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger _count = [indexPath row]*7 + [indexPath section] - self.weekday + 2;
    
    NSString *dateString = self.navigation.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSString *_year = [_dateArray objectAtIndex:0];
    
    NSString *_month = [_dateArray objectAtIndex:1];
    
    NSString *_dateString = [NSString stringWithFormat:@"%@-%@-%ld",_year,_month,_count];
    
    [self.navigation.timeLabel setText:_dateString];
    
    if (self.selectedCell != self.currentCell) {
        [self.selectedCell setBackgroundColor:[UIColor whiteColor]];
    }
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (self.currentCell != cell) {
        cell.backgroundColor = [UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:100 / 255.0 alpha:0.1];
        
        NSInteger _count = [indexPath row]*7 + [indexPath section] - self.weekday + 2;
        
        self.selectedDate = [CalendarUtil toChineseDateWithYear:[_year integerValue] month:_month day:_count];
        
        NSInteger lunarMonth = self.selectedDate.month;
        
        NSInteger lunarDay = self.selectedDate.day;
        
        NSInteger lunarYear = (self.selectedDate.year - 1900) % 60;
        
        int tianganCount = (7 +  ([_year integerValue] - 1900) % 10) % 10;
        
        NSString *ChineseYear;
        
        NSInteger _ChineseYear = 0;
        
        NSString *month_ = [CalendarUtil monthFromCppToMineWithYear:self.selectedDate.year month:lunarMonth];
        
        NSRange range = {2,month_.length - 2};
        
        NSInteger _month = [[month_ substringWithRange:range] integerValue];
        
        NSLog(@"month : %ld lunarMonth : %ld",_month,lunarMonth);
        
        NSString *_lunarMonth;
        
        NSInteger runMonth=ChineseCalendarDB::GetLeapMonth((int)self.selectedDate.year);
        
        if(runMonth != 0){
            if(runMonth == lunarMonth - 1) {
                _lunarMonth = [NSString stringWithFormat:@"闰%@",[[ChineseEra getArrayWithString:@"ChineseMonth"] objectAtIndex:lunarMonth - 2]];
            }else if(runMonth > lunarMonth - 1){
                _lunarMonth = [NSString stringWithFormat:@"%@",[[ChineseEra getArrayWithString:@"ChineseMonth"] objectAtIndex:lunarMonth - 1]];
            }else if(runMonth < lunarMonth - 1){
                _lunarMonth = [NSString stringWithFormat:@"%@",[[ChineseEra getArrayWithString:@"ChineseMonth"] objectAtIndex:lunarMonth - 2]];
            }
        }
        
        if (runMonth == 0) {
            _lunarMonth = [NSString stringWithFormat:@"%@",[[ChineseEra getArrayWithString:@"ChineseMonth"] objectAtIndex:lunarMonth - 1]];
        }
        
        NSArray *lunarYearArray = [NSArray arrayWithObjects:@"甲寅",@"丙寅",@"戊寅",@"庚寅",@"壬寅",@"甲寅",@"丙寅",@"戊寅",@"庚寅",@"壬寅",nil];
        
        ChineseYear = [lunarYearArray objectAtIndex:tianganCount];
        
        _ChineseYear = [[ChineseEra getArrayWithString:@"ChineseYear"] indexOfObject:ChineseYear];
        
        NSString *showText = [NSString stringWithFormat:@"%ld%@%@ | %@年%@月%@日",self.selectedDate.year,_lunarMonth,[[ChineseEra getArrayWithString:@"ChineseDay"] objectAtIndex:lunarDay - 1],[[ChineseEra getArrayWithString:@"ChineseYear"] objectAtIndex:(lunarYear + 37 - 1) % 60],[self getChineseMonthWithYear:[_year integerValue] LunarDate:[NSString stringWithFormat:@"%ld-%ld-%ld",self.selectedDate.year,lunarMonth,lunarDay]],[self getChinesedayWithString:self.navigation.timeLabel.text]];
        NSLog(@"showText : %@",showText);
        
        [self.showLabel setText:showText];
        
        NSString *timeLabelString = self.navigation.timeLabel.text;
        
        NSDateFormatter *formatter = [NSDateFormatter new];
        
        [formatter setDateFormat:@"YYYY-MM-dd"];
        
        NSDate *date = [formatter dateFromString:timeLabelString];
        
        NSString *systemStr = [self getSystemLunarWithDate:date];
        
        [self.systemLabel setText:[NSString stringWithFormat:@"系统获得 : %@",systemStr ]];
    }
    self.selectedCell = cell;
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end

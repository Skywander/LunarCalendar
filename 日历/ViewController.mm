//
//  ViewController.m
//  日历
//
//  Created by 于恩聪 on 16/3/31.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "ViewController.h"

#import "ChineseCalendarDB.h"

#import "ViewController+ChineseDay.h"
#import "ViewController+SystemLunar.h"
#import "ViewController+CollectionDelegate.h"

@interface ViewController ()<NavigationProtocol>
{
    CGFloat viewWidth;
    
    CGFloat viewHeight;
    
    CGFloat spaceH;
    CGFloat spaceW;
    
    CGFloat labelWidth;
    
    IBOutlet UICollectionView * collection;
    
    IBOutlet UIView *dateView;

}

@end

@implementation ViewController
@synthesize cellHeight,cellWidth;
@synthesize navigation;
@synthesize weekday;
@synthesize showLabel,systemLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:DEFAULT_COLOR];

    [self initData];
    
    [self initNavigation];
    
    [self initCollectionView];
    
    [self initShowLabel];
    
}

- (void)initData{
    
    spaceH = 2;
    
    spaceW = 5;
    
    cellWidth = (SCREEN_WIDTH - 8 * spaceW) / 7;
    
    cellHeight = cellWidth;
    
    viewHeight = cellHeight * 7;
    
    viewWidth = cellWidth * 8;
    
    NSArray *dict = [CalendarUtil jieqiWithYear:2000];
    
    for (NSString *key in dict) {
        NSLog(@"key : %@",key);
    }
}

- (void)initShowLabel{
    showLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 50)];
    
    [showLabel setTextAlignment:NSTextAlignmentCenter];
    
    [showLabel setFont:[UIFont systemFontOfSize:15]];
    
    [showLabel setTextColor:DEFAULT_PINK];
    
    [self.view addSubview:showLabel];
    
    systemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
    
    [systemLabel setTextAlignment:NSTextAlignmentCenter];
    
    [systemLabel setFont:[UIFont systemFontOfSize:15]];
    
    [systemLabel setTextColor:DEFAULT_PINK];
    
    [self.view addSubview:systemLabel];
}

- (void)initNavigation{
    navigation = [Navigation new];
    
    [navigation setDelegate:self];
    
    [self.view addSubview:navigation];

    NSString *dateString = navigation.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSInteger _year = [[_dateArray objectAtIndex:0] intValue];
    
    weekday = [CalendarUtil weekDayWithSolarYear:_year month:[_dateArray objectAtIndex:1] day:1];
    
}

- (void)update{
    NSString *dateString = navigation.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSInteger _year = [[_dateArray objectAtIndex:0] intValue];
    
    weekday = [CalendarUtil weekDayWithSolarYear:_year month:[_dateArray objectAtIndex:1] day:1];
    
    [collection reloadData];


}


- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置对齐方式
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //cell间距
    layout.minimumInteritemSpacing = 8;
    
    //cell行距
    layout.minimumLineSpacing = 10;
    
    [collection setDataSource:self];
    [collection setDelegate:self];
    

    collection.pagingEnabled = YES;
    collection.backgroundColor = DEFAULT_COLOR;
    
    [collection setFrame:CGRectMake(5, 64, viewWidth, viewHeight)];
    
    
    [collection setCollectionViewLayout:layout];
    
    [self.view addSubview:collection];
    
    for (int i = 0;i<7;i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * (SCREEN_WIDTH / 7), 0, SCREEN_WIDTH / 7, 81)];
        
        [label setText:[[ChineseEra getArrayWithString:@"weekday"] objectAtIndex:i]];
        
        [label setTextAlignment:NSTextAlignmentCenter];
        
        [label setTextColor:DEFAULT_PINK];
        
        [label setFont:[UIFont systemFontOfSize:14]];
        
        [dateView addSubview:label];
        
    }
    
}

@end

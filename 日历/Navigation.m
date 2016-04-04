//
//  Navigation.m
//  loveOfHearts
//
//  Created by 于恩聪 on 16/3/18.
//  Copyright © 2016年 于恩聪. All rights reserved.
//
#import "Constant.h"
#import "Navigation.h"

@implementation Navigation

- (id)init{
    self = [super init];
    
    if(self){
        [self setFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
        
        [self setBackgroundColor:DEFAULT_PINK];
        
        NSDate *date = [NSDate new];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"YYYY-MM-dd"];
        
        NSString *dateString = [formatter stringFromDate:date];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        
        [self.timeLabel setText:dateString];
        
        [self.timeLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.timeLabel setTextColor:[UIColor whiteColor]];
        
        [self.timeLabel setFont:[UIFont systemFontOfSize:15]];
        
        [self addSubview:self.timeLabel];
        
        UIButton *month1 = [[UIButton alloc] initWithFrame:CGRectMake(5, 0,NAVIGATION_HEIGHT, NAVIGATION_HEIGHT)];
        
        [month1 setTitle:@"<" forState:UIControlStateNormal];
        
        [month1.titleLabel setFont:[UIFont systemFontOfSize:20]];
        
        [month1 addTarget:self action:@selector(monthjianshao) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:month1];
        
        UIButton *year1 = [[UIButton alloc] initWithFrame:CGRectMake(5 + NAVIGATION_HEIGHT, 0, NAVIGATION_HEIGHT, NAVIGATION_HEIGHT)];
        [year1 setTitle:@"<" forState:UIControlStateNormal];

        
        [year1.titleLabel setFont:[UIFont systemFontOfSize:20]];
        
        [year1 addTarget:self action:@selector(yearjianshao) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:year1];
        
        UIButton *year2 = [UIButton new];
        
        [year2 setFrame:CGRectMake(SCREEN_WIDTH - 2 * NAVIGATION_HEIGHT, 0, NAVIGATION_HEIGHT, NAVIGATION_HEIGHT)];
        
        [year2 addTarget:self action:@selector(yearzengjia) forControlEvents:UIControlEventTouchUpInside];
        
        [year2 setTitle:@">" forState:UIControlStateNormal];
        
        [year2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [year2.titleLabel setFont:[UIFont systemFontOfSize: 20]];
        
        [self addSubview:year2];
        
        UIButton *month2 = [UIButton new];
        
        [month2 setFrame:CGRectMake(SCREEN_WIDTH - NAVIGATION_HEIGHT, 0, NAVIGATION_HEIGHT, NAVIGATION_HEIGHT)];
        
        [month2 addTarget:self action:@selector(monthzengjia) forControlEvents:UIControlEventTouchUpInside];
        
        [month2 setTitle:@">" forState:UIControlStateNormal];
        
        [month2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [month2.titleLabel setFont:[UIFont systemFontOfSize: 20]];

        [self addSubview:month2];

    }
    return self;
}

- (void)monthjianshao{
    
    NSString *dateString = self.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSString *_year = [_dateArray objectAtIndex:0];
    
    NSString *_month = [_dateArray objectAtIndex:1];
    
    NSInteger month = [_month integerValue];
    
    NSInteger year = [_year integerValue];
    
    if (month - 1 == 0 && year != 1900) {
        year--;
        month = 12;
    }else{
        month -- ;
    }
    
    NSString *_dateString = [NSString stringWithFormat:@"%ld-%ld-%@",year,month,@"01"];
  
    [self.timeLabel setText:_dateString];

    [self.delegate update];
}

- (void)monthzengjia{
    NSString *dateString = self.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSString *_year = [_dateArray objectAtIndex:0];
    
    NSString *_month = [_dateArray objectAtIndex:1];
    
    NSInteger month = [_month integerValue];
    
    NSInteger year = [_year integerValue];
    
    if (month + 1 == 13 && year != 2050) {
        year++;
        month = 1;
    }else{
        month ++;
    }
    
    NSString *_dateString = [NSString stringWithFormat:@"%ld-%ld-%@",year,month,@"01"];
    
    [self.timeLabel setText:_dateString];
    
    [self.delegate update];
}

- (void)yearjianshao{
    NSString *dateString = self.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSString *_year = [_dateArray objectAtIndex:0];
    
    NSString *_month = [_dateArray objectAtIndex:1];
    
    NSInteger month = [_month integerValue];
    
    NSInteger year = [_year integerValue];
    
    if (year != 1900) {
        year--;
    }
    
    NSString *_dateString = [NSString stringWithFormat:@"%ld-%ld-%@",year,month,@"01"];
    
    [self.timeLabel setText:_dateString];
    
    [self.delegate update];

}

- (void)yearzengjia{
    NSString *dateString = self.timeLabel.text;
    
    NSArray *_dateArray = [dateString componentsSeparatedByString:@"-"];
    
    NSString *_year = [_dateArray objectAtIndex:0];
    
    NSString *_month = [_dateArray objectAtIndex:1];
    
    NSInteger month = [_month integerValue];
    
    NSInteger year = [_year integerValue];
    
    if (year != 2050) {
        year++;
    }
    
    NSString *_dateString = [NSString stringWithFormat:@"%ld-%ld-%@",year,month,@"01"];
    
    [self.timeLabel setText:_dateString];
    
    [self.delegate update];

}


@end

//
//  ViewController.h
//  日历
//
//  Created by 于恩聪 on 16/3/31.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarUtil.h"
#import "Navigation.h"
#import "Constant.h"
#import "NavigationProtocol.h"
#import "ChineseEra.h"

@interface ViewController : UIViewController

@property (nonatomic) CGFloat cellWidth;
@property (nonatomic) CGFloat cellHeight;

@property (nonatomic) NSInteger weekday;

@property (nonatomic,strong) UILabel *showLabel;
@property (nonatomic,strong) UILabel *systemLabel;

@property (nonatomic,strong) Navigation *navigation;

@property (nonatomic,strong) UICollectionViewCell *selectedCell;

@property (nonatomic,strong) UICollectionViewCell *currentCell;

@property (nonatomic,strong) NSDateComponents *selectedDate;


@end


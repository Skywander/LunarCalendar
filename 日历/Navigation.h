//
//  Navigation.h
//  loveOfHearts
//
//  Created by 于恩聪 on 16/3/18.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NavigationProtocol.h"

@interface Navigation : UIView

@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,weak) id<NavigationProtocol> delegate;

@end

//
//  ViewController+CollectionDelegate.h
//  日历
//
//  Created by 于恩聪 on 16/4/4.
//  Copyright © 2016年 于恩聪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (CollectionDelegate)<UICollectionViewDataSource,UICollectionViewDelegate>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

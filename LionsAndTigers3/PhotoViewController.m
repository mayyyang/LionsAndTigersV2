//
//  PhotoViewController.m
//  LionsAndTigers3
//
//  Created by May Yang on 11/1/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "PhotoViewController.h"
#import "CustomCollectionViewCell.h"

@interface PhotoViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *currentPhotosArray;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPhotosArray = [NSMutableArray array];
    [self.currentPhotosArray addObjectsFromArray:@[[UIImage imageNamed:@"tiger1"],
                                                  [UIImage imageNamed:@"tiger2"],
                                                  [UIImage imageNamed:@"tiger3"]
                                                  ]];
}

- (IBAction)onMenuButtonTapped:(UIBarButtonItem *)sender
{
    [self.delegate menuButtonTapped];
}

- (void)showTigerImages;
{
    self.currentPhotosArray = [NSMutableArray array];
    [self.currentPhotosArray addObjectsFromArray:@[[UIImage imageNamed:@"tiger1"],
                                                   [UIImage imageNamed:@"tiger2"],
                                                   [UIImage imageNamed:@"tiger3"]
                                                   ]];
    [self.collectionView reloadData];
    [self.delegate menuButtonTapped]; // Closes the "Sidebar" after the button is tapped
}

- (void)showLionImages;
{
    self.currentPhotosArray = [NSMutableArray array];
    [self.currentPhotosArray addObjectsFromArray:@[[UIImage imageNamed:@"lion1"],
                                                   [UIImage imageNamed:@"lion2"],
                                                   [UIImage imageNamed:@"lion3"]
                                                   ]];
    [self.collectionView reloadData];
    [self.delegate menuButtonTapped];
}


- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCollectionViewCell" forIndexPath:indexPath];
    cell.imageView.image = self.currentPhotosArray[indexPath.item];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.currentPhotosArray.count;
}
@end

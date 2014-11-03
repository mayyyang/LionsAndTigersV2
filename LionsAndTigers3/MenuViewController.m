//
//  MenuViewController.m
//  LionsAndTigers3
//
//  Created by May Yang on 11/1/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTigerButtonTapped:(UIButton *)sender
{
    [self.delegate tigerButtonTapped];
}


- (IBAction)onLionButtonTapped:(UIButton *)sender
{
    [self.delegate lionButtonTapped];
}


@end

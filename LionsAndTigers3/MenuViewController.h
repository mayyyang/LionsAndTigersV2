//
//  MenuViewController.h
//  LionsAndTigers3
//
//  Created by May Yang on 11/1/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MenuViewControllerDelegate <NSObject>
- (void) tigerButtonTapped;
- (void) lionButtonTapped;
@end


@interface MenuViewController : UIViewController
@property (weak, nonatomic) id<MenuViewControllerDelegate>delegate;

@end

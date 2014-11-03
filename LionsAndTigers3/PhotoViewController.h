//
//  PhotoViewController.h
//  LionsAndTigers3
//
//  Created by May Yang on 11/1/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PhotoViewControllerDelegate <NSObject>
- (void) menuButtonTapped;

@end


@interface PhotoViewController : UIViewController
@property (weak, nonatomic) id<PhotoViewControllerDelegate> delegate;

-(void)showTigerImages;
-(void)showLionImages;

@end

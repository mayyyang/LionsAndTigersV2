//
//  ViewController.m
//  LionsAndTigers3
//
//  Created by May Yang on 11/1/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "RootViewController.h"
#import "PhotoViewController.h"
#import "MenuViewController.h"
#import "CustomCollectionViewCell.h"

@interface RootViewController () <PhotoViewControllerDelegate, MenuViewControllerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightPVCConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftPVCConstraint;

@property PhotoViewController *photoVC;
@property MenuViewController *menuVC;
@property UINavigationController *navigationVC;


@property (nonatomic)  BOOL isOpen;

//@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
//@property (nonatomic, strong) UIDynamicItemBehavior *dynamicItemBehavior;
//@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
//@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;
//@property (nonatomic, strong) UIPushBehavior *pushBehavior;
//

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

//    self.dynamicAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
//
//    self.collisionBehavior = [[UICollisionBehavior alloc]initWithItems:@[self.navigationController.view]];
//
//    self.collisionBehavior.collisionDelegate = self;
//
//    self.gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[self.navigationController]];
//
//    self.dynamicItemBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[self.navigationController]];
//
//    self.pushBehavior = [[UIPushBehavior alloc]initWithItems:@[self.navigationController] mode:UIPushBehaviorModeContinuous];
//
//    [self.collisionBehavior addBoundaryWithIdentifier:@"right" fromPoint:CGPointMake(self.view.frame.size.width + 76, -10) toPoint:CGPointMake(self.view.frame.size.height + 70, self.view.frame.size.height +10)];
//
//    [self.gravityBehavior setGravityDirection:CGVectorMake(0, 0)];
//
//    [self.dynamicItemBehavior setElasticity:.1];
//
//    [self.dynamicAnimator addBehavior:self.collisionBehavior];
//    [self.dynamicAnimator addBehavior:self.gravityBehavior];
//    [self.dynamicAnimator addBehavior:self.dynamicItemBehavior];
//    [self.dynamicAnimator addBehavior:self.dynamicItemBehavior];
}


- (BOOL)isOpen
{
    // "Sidebar" is considered "open" when constraints are not at -16
    BOOL result = self.leftPVCConstraint.constant != -16;
    return result;
}

- (void)menuButtonTapped
{
    if (!self.isOpen)
    {
        [self.leftPVCConstraint setConstant:self.view.bounds.size.width * 0.15];
        // Displays 15% of MenuVC

    }
    else
        [self.leftPVCConstraint setConstant:-16];

    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded]; // Create animation effect
    } completion:nil];
}

- (void)tigerButtonTapped
{
    [self.photoVC showTigerImages];
}

- (void) lionButtonTapped
{
    [self.photoVC showLionImages];
}
//- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture
//{
//    CGPoint translation = [gesture translationInView:gesture.view];
//    self.leftPVCConstraint.constant = self.leftPVCConstraint.constant + translation.x;
//    self.rightPVCConstraint.constant = self.rightPVCConstraint.constant - translation.x;
//    [gesture setTranslation:CGPointMake(0, 0)inView:gesture.view];
//
//    CGFloat xVelocity = [gesture velocityInView:gesture.view].x;
//    if (gesture.state == UIGestureRecognizerStateEnded)
//    {
//        [self.dynamicAnimator updateItemUsingCurrentState:self.navigationController.view];
//
//        if (xVelocity < -500.00)
//        {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(-1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.5];
//            [self.pushBehavior setPushDirection:CGVectorMake([gesture velocityInView:gesture.view].x, 0)];
//
//        }
//        else if (xVelocity >= -500.0 && xVelocity < 0)
//        {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(-1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.25];
//            [self.pushBehavior setPushDirection:CGVectorMake(-500.0, 0.0)];
//        }
//        else if (xVelocity >= 0 && xVelocity < 500.0)
//        {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.25];
//            [self.pushBehavior setPushDirection:CGVectorMake(500.0, 0.0)];
//        }
//        else
//        {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.5];
//            [self.pushBehavior setPushDirection:CGVectorMake([gesture velocityInView:gesture.view].x, 0)];
//        }
//
//    }
////
//}

- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture
{
    CGPoint xtranslation = [gesture translationInView:gesture.view];
    self.leftPVCConstraint.constant = self.leftPVCConstraint.constant + xtranslation.x;
    self.rightPVCConstraint.constant = self.rightPVCConstraint.constant - xtranslation.x;
    [gesture setTranslation:CGPointMake(0, 0) inView:gesture.view];
}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

    // Set the RootVC as the delegate... So that the ChildViewControllers can speak to it.
{
    if ([segue.identifier isEqualToString:@"photoVCSegue"])
    {
        UINavigationController *navigationVC = segue.destinationViewController;
        self.photoVC = navigationVC.childViewControllers[0];
        self.photoVC.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"menuVCSegue"])
    {
        self.menuVC = segue.destinationViewController;
        self.menuVC.delegate = self;
    }
}

@end

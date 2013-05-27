//
//  PathViewController.m
//  NormalTest
//
//  Created by Shane.Wu on 13/5/23.
//  Copyright (c) 2013年 Shane.Wu. All rights reserved.
//

#import "PathViewController.h"
#import "PathView.h"

@interface PathViewController ()
@property (weak, nonatomic) IBOutlet PathView *pathView;
@end

@implementation PathViewController

- (IBAction)refrash:(UIBarButtonItem *)sender
{
    [self.pathView cleanPath];
}

- (IBAction)done:(UIBarButtonItem *)sender
{
    [self.pathView closePathAndCropInside:YES];
}

@end

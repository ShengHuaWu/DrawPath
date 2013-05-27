//
//  PathView.h
//  NormalTest
//
//  Created by Shane.Wu on 13/5/23.
//  Copyright (c) 2013年 Shane.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PathView : UIView
/* --- Public API --- */
- (void)cleanPath;
- (void)closePathAndCropInside:(BOOL)inside;
@end

//
//  PathView.m
//  NormalTest
//
//  Created by Shane.Wu on 13/5/23.
//  Copyright (c) 2013年 Shane.Wu. All rights reserved.
//

#import "PathView.h"
#import <QuartzCore/QuartzCore.h>

@interface PathView ()
@property (strong, nonatomic) UIBezierPath *path;
@property (assign, nonatomic) CGPoint initialPoint;
@end

/* --- Bezier path constant --- */
static const CGFloat LineWidth = 3.0f;
static const CGFloat LineSegement = 10.0f;
static const CGFloat LineDash = 15.0f;
/* --- Common constant --- */
static const CGFloat EdgeTolerance = 20.0f;
static const CGFloat PointTolerance = 20.0f;

@implementation PathView

- (UIBezierPath *)path
{
    if (!_path) {
        _path = [UIBezierPath bezierPath];
        _path.lineWidth = LineWidth;
        _path.lineCapStyle = kCGLineCapRound;
        _path.lineJoinStyle = kCGLineJoinRound;
        
        CGFloat pattern1[2] = {LineSegement, LineDash};
        [_path setLineDash:pattern1 count:2 phase:0];
    }
    return _path;
}

#pragma mark - Public method
- (void)cleanPath
{
    [self undo];
    [self.path removeAllPoints];
    [self setNeedsDisplay];
}

- (void)closePathAndCropInside:(BOOL)inside
{    
    [self completePath]; // Complete path by adding line.
    [self setNeedsDisplay];
    
    if (inside) {
        [self cropInside];
    } else {
        [self cropOutside];
    }
}

#pragma mark - Private method
- (CGFloat)calculateDistanceBetweenFirstPoint:(CGPoint)fPoint andSecondPoint:(CGPoint)sPoint
{
    CGFloat dx = fPoint.x - sPoint.x;
    CGFloat dy = fPoint.y - sPoint.y;
    return sqrt(dx*dx + dy*dy);
}

- (void)cropInside
{
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
//    imageView.backgroundColor = [UIColor redColor];
//    if (!imageView.layer.mask) {
//        imageView.layer.mask = [CAShapeLayer layer];
//    }
//    ((CAShapeLayer *)imageView.layer.mask).path = self.path.CGPath;
//    [self addSubview:imageView];
    
    
    if (!self.layer.mask) {
        self.layer.mask = [CAShapeLayer layer];
    }
    
    ((CAShapeLayer *)self.layer.mask).path = self.path.CGPath;
}

- (void)cropOutside
{
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = self.path.CGPath;
    [self.layer addSublayer:shape];
}

- (void)undo
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    self.layer.mask = nil;
    self.layer.sublayers = nil;
}

- (void)completePath
{
    // Complete path if initial point and path current path are near edge.
    if (self.initialPoint.x - self.bounds.origin.x < EdgeTolerance) {
        if (self.bounds.size.width - self.path.currentPoint.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.initialPoint.y)];
        } else if (self.bounds.size.height - self.path.currentPoint.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.initialPoint.y)];
        } else if (self.path.currentPoint.y - self.bounds.origin.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.initialPoint.y)];
        } else if (self.path.currentPoint.x - self.bounds.origin.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.initialPoint.y)];
        }
    } else if (self.bounds.size.width - self.initialPoint.x < EdgeTolerance) {
        if (self.path.currentPoint.x - self.bounds.origin.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.initialPoint.y)];
        } else if (self.bounds.size.height - self.path.currentPoint.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.initialPoint.y)];
        } else if (self.path.currentPoint.y - self.bounds.origin.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.initialPoint.y)];
        } else if (self.bounds.size.width - self.path.currentPoint.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.initialPoint.y)];
        }
    } else if (self.initialPoint.y - self.bounds.origin.y < EdgeTolerance) {
        if (self.bounds.size.height - self.path.currentPoint.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.origin.y)];
        } else if (self.bounds.size.width - self.path.currentPoint.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.origin.y)];
        } else if (self.path.currentPoint.x - self.bounds.origin.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.origin.y)];
        } else if (self.path.currentPoint.y - self.bounds.origin.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.origin.y)];
        }
    } else if (self.bounds.size.height - self.initialPoint.y < EdgeTolerance) {
        if (self.path.currentPoint.y - self.bounds.origin.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.origin.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.size.height)];
        } else if (self.bounds.size.width - self.path.currentPoint.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.size.height)];
        } else if (self.path.currentPoint.x - self.bounds.origin.x < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.path.currentPoint.y)];
            [self.path addLineToPoint:CGPointMake(self.bounds.origin.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.size.height)];
        } else if (self.bounds.size.height - self.path.currentPoint.y < EdgeTolerance) {
            [self.path addLineToPoint:CGPointMake(self.path.currentPoint.x, self.bounds.size.height)];
            [self.path addLineToPoint:CGPointMake(self.initialPoint.x, self.bounds.size.height)];
        }
    }
    [self.path closePath]; // Close path.
}

#pragma mark - Draw method
- (void)drawRect:(CGRect)rect
{
    // Draw path.
    if (!self.path.isEmpty) {
        [[UIColor blueColor] setStroke];
        [self.path stroke];
    }
}

#pragma mark - Touch event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    self.initialPoint = point;
    [self.path moveToPoint:self.initialPoint]; // Set initial point.
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    if ([self calculateDistanceBetweenFirstPoint:self.path.currentPoint andSecondPoint:point] > PointTolerance) {
        [self.path addLineToPoint:point];
        [self setNeedsDisplay];
    }
}

@end

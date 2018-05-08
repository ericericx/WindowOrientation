//
//  CustomWindow.m
//  WindowOrientation
//
//  Created by EricChien on 2018/5/8.
//  Copyright © 2018年 Soul. All rights reserved.
//

#import "CustomWindow.h"

#define DegreesToRadians(degrees) (degrees * M_PI / 180)

@implementation CustomWindow

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.btnRed = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRed.frame = CGRectMake( 0, 0, frame.size.width, frame.size.height);
        self.btnRed.backgroundColor = [UIColor redColor];
        [self.btnRed addTarget:self action:@selector(redAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnRed];
        
        self.btnWhite = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.btnWhite.frame = CGRectMake( 0, frame.size.height - (frame.size.height - frame.size.width), frame.size.width, frame.size.height - frame.size.width);
        self.btnWhite.frame = CGRectMake( 0, frame.size.height - (frame.size.height - frame.size.width - 1), frame.size.width, frame.size.height - frame.size.width - 1);
        self.btnWhite.backgroundColor = [UIColor whiteColor];
        [self.btnWhite addTarget:self action:@selector(whitAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnWhite];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    }
    return self;
}

- (void) redAction:(UIButton *)btn {
    NSLog(@"redAction");
}

- (void) whitAction:(UIButton *)btn {
    NSLog(@"whitAction");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            NSLog(@"%@", hitTestView);
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

//- (void)handleOrientationChange:(NSNotification *)note
//{
//    [self bringSubviewToFront:self.btnRed];
//    [self bringSubviewToFront:self.btnWhite];
//
//    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
//    //    [self setTransform:[self transformForOrientation:orientation]];
//
//    CGRect orientationFrame = [UIScreen mainScreen].bounds;
//    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
//
//    if(UIInterfaceOrientationIsLandscape(orientation)) {
//        float temp = orientationFrame.size.width;
//        orientationFrame.size.width = orientationFrame.size.height;
//        orientationFrame.size.height = temp;
//
//        temp = statusBarFrame.size.width;
//        statusBarFrame.size.width = statusBarFrame.size.height;
//        statusBarFrame.size.height = temp;
//    }
//
//    self.frame = orientationFrame;
//}
//
//- (CGAffineTransform) transformForOrientation:(UIInterfaceOrientation)orientation {
//    switch (orientation) {
//        case UIInterfaceOrientationLandscapeLeft:
//            return CGAffineTransformMakeRotation(-DegreesToRadians(90));
//        case UIInterfaceOrientationLandscapeRight:
//            return CGAffineTransformMakeRotation(DegreesToRadians(90));
//        case UIInterfaceOrientationPortraitUpsideDown:
//            return CGAffineTransformMakeRotation(DegreesToRadians(180));
//        case UIInterfaceOrientationPortrait:
//        default:
//            return CGAffineTransformMakeRotation(DegreesToRadians(0));
//    }
//}



@end

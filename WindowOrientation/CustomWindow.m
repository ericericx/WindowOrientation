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
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
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
    
    if (CGRectContainsPoint(_btnWhite.frame, point))
    {
        return _btnWhite;
    }
    
    if (CGRectContainsPoint(_btnRed.frame, point))
    {
        return _btnRed;
    }
    
    return nil;
}

- (void)handleOrientationChange:(NSNotification *)note
{
    self.frame = [[UIScreen mainScreen]bounds];
    [self __setupRedButtonFrame];
    [self __setupWhiteButtonFrame];
}

- (void)__setupRedButtonFrame
{
    CGRect frame = self.bounds;
    self.btnRed.frame = CGRectMake( 0, 0, frame.size.width, frame.size.height);
}

- (void)__setupWhiteButtonFrame
{
    CGRect frame = self.bounds;
    self.btnWhite.frame = CGRectMake( 0, frame.size.height - (frame.size.height - frame.size.width - 1), frame.size.width, frame.size.height - frame.size.width - 1);
}

@end

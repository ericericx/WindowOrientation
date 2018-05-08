//
//  CustomObject.m
//  WindowOrientation
//
//  Created by EricChien on 2018/5/8.
//  Copyright © 2018年 Soul. All rights reserved.
//

#import "CustomObject.h"
#import "CustomWindow.h"

@interface CustomObject () {
    CustomWindow *tempWindow;
}

@end

@implementation CustomObject

#pragma mark Life Cycle
-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - 顯示插屏廣告

- (void) show {
    tempWindow = [[CustomWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [tempWindow setWindowLevel:UIWindowLevelStatusBar + 1];
    [tempWindow makeKeyAndVisible];
}

@end

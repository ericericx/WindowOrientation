//
//  ViewController.m
//  WindowOrientation
//
//  Created by EricChien on 2018/5/8.
//  Copyright © 2018年 Soul. All rights reserved.
//

#import "ViewController.h"
#import "CustomWindow.h"
#import "CustomObject.h"

@interface ViewController () {
    CustomWindow *customWindow;
    CustomObject *customObject;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    customObject = [[CustomObject alloc] init];
}

- (IBAction) changeWindow :(id)sender {
    /* 1 */
//    customWindow = [[CustomWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [customWindow setWindowLevel:UIWindowLevelStatusBar + 1];
//    [customWindow makeKeyAndVisible];
    
    /* 2 */
//    [customObject show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

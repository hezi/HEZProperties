//
//  HEZAppDelegate.h
//  HEZDynamicPropertiesDemo
//
//  Created by Hezi Cohen on 4/9/14.
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HEZProperties.h"

@interface HEZAppDelegate : UIResponder <UIApplicationDelegate, HEZPropertyObserver>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, readwrite) NSString *name;

@end

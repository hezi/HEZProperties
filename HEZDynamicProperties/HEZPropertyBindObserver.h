//
//  HEZPropertyBindObserver.h
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//  Copyright (c) 2014-present, Facebook, Inc.
//

#import <Foundation/Foundation.h>
#import "HEZProperty.h"

typedef void (^HEZPropertyBindObserverBlock)(id object);

@interface HEZPropertyBindObserver : NSObject <HEZPropertyObserver>

- (instancetype)initWithProperty:(HEZProperty *)property block:(HEZPropertyBindObserverBlock)block;
- (void)attachToObject:(id)object;

@end

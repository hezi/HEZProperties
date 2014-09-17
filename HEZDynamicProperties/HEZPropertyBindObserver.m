//
//  HEZPropertyBindObserver.m
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//  Copyright (c) 2014-present, Facebook, Inc.
//

#import <objc/runtime.h>

#import "HEZPropertyBindObserver.h"

@implementation HEZPropertyBindObserver {
    HEZProperty *_property;
    HEZPropertyBindObserverBlock _block;
    __weak id _object;
}

- (instancetype)initWithProperty:(HEZProperty *)property block:(HEZPropertyBindObserverBlock)block
{
    self = [super init];
    if (self) {
        if(!property)
            return nil;
        
        _property = property;
        _block = block;
        
        [property addObserver:self];
    }
    
    return self;
}

- (void)propertyDidChange:(HEZProperty *)property
{
    __attribute__((objc_precise_lifetime)) id strongObject = _object;

    if (strongObject != nil) {
        _block(strongObject);
    }
}

- (void)attachToObject:(id)object
{
    NSAssert(_object == nil, @"can only attach to an object once");
    NSAssert(object != nil, @"object is required");
    
    _object = object;
    objc_setAssociatedObject(object, (__bridge void *)self, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

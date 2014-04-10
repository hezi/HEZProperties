//
//  HEZProperty.m
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import "HEZProperty.h"

@implementation HEZProperty {
    NSHashTable *_observers;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        [self setName:name];
    }
    return self;
}

- (void)setCurrentValue:(HEZPropertyValue)currentValue
{
    if (_minimumValue != nil && currentValue != nil && [_minimumValue compare:currentValue] == NSOrderedDescending) {
        currentValue = _minimumValue;
    }
    
    if (_maximumValue != nil && currentValue != nil && [_maximumValue compare:currentValue] == NSOrderedAscending) {
        currentValue = _maximumValue;
    }
    
    if (_currentValue != currentValue) {
        _currentValue = currentValue;
        
        for (id<HEZPropertyObserver> observer in [_observers setRepresentation]) {
            [observer propertyDidChange:self];
        }
    }
}

- (void)addObserver:(id<HEZPropertyObserver>)observer
{
    if (_observers == nil) {
        _observers = [NSHashTable weakObjectsHashTable];
    }
    
    NSAssert(observer != nil, @"observer is required");
    [_observers addObject:observer];
}

- (void)removeObserver:(id<HEZPropertyObserver>)observer
{
    NSAssert(observer != nil, @"observer is required");
    [_observers removeObject:observer];
}

@end

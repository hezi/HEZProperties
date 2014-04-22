//
//  HEZProperty.h
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HEZPropertyObserver;

typedef id HEZPropertyValue;

@interface HEZProperty : NSObject
- (instancetype)initWithName:(NSString*)name;

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) HEZPropertyValue currentValue;
@property (nonatomic, strong, readwrite) HEZPropertyValue minimumValue;
@property (nonatomic, strong, readwrite) HEZPropertyValue maximumValue;

- (void)addObserver:(id<HEZPropertyObserver>)observer;
- (void)removeObserver:(id<HEZPropertyObserver>)observer;

@end

@protocol HEZPropertyObserver <NSObject>
- (void)propertyDidChange:(HEZProperty *)property;
@end

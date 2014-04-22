//
//  HEZPropertiesCollection.h
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HEZProperty;

@interface HEZPropertiesCollection : NSObject
+ (instancetype)collectionFromDictionary:(NSDictionary*)aDictionary;
- (instancetype)initWithDictionary:(NSDictionary*)aDictionary;

@property (nonatomic, copy, readwrite) NSString *name;

- (void)loadFromDictionary:(NSDictionary*)aDictionary;
- (HEZProperty*)propertyWithName:(NSString*)name;

@end

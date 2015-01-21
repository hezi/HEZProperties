//
//  HEZPropertiesCategory.h
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HEZPropertiesCollection;

@interface HEZPropertiesCategory : NSObject
+ (instancetype)categoryFromDictionary:(NSDictionary *)aDictionary;
- (instancetype)initWithDictionary:(NSDictionary *)aDictionary;

@property (nonatomic, copy, readwrite) NSString *name;

- (HEZPropertiesCollection *)collectionWithName:(NSString *)name;
- (void)loadFromDictionary:(NSDictionary *)aDictionary;
- (NSArray *)allCollectionNames;

@end

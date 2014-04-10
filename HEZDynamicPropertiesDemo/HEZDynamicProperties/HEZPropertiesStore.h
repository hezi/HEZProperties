//
//  HEZPropertiesStore.h
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HEZPropertiesCategory;

@interface HEZPropertiesStore : NSObject

+ (HEZPropertiesStore *)defaultStore;
- (HEZPropertiesCategory*)categoryWithName:(NSString*)name;
- (void)addEntriesFromDictionary:(NSDictionary*)aDictionary;

@end

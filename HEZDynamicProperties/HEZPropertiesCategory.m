//
//  HEZPropertiesCategory.m
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import "HEZPropertiesCategory.h"
#import "HEZPropertiesCollection.h"

@implementation HEZPropertiesCategory
{
    NSMutableDictionary *_collections;
}

+ (instancetype)categoryFromDictionary:(NSDictionary *)aDictionary
{
    return [[self alloc] initWithDictionary:aDictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)aDictionary
{
    self = [super init];
    if(self)
    {
        _collections = [[NSMutableDictionary alloc] init];
        [self loadFromDictionary:aDictionary];
    }
    return self;
}

- (void)loadFromDictionary:(NSDictionary *)aDictionary
{
    for(NSString *collectionName in [aDictionary allKeys])
    {
        HEZPropertiesCollection *collection = _collections[collectionName] ?: [HEZPropertiesCollection collectionFromDictionary:aDictionary[collectionName]];

        if(!_collections[collectionName])
        {
            if(collection)
            {
                [collection setName:collectionName];
                [_collections setObject:collection forKey:collectionName];
            }
        }
        else
            [collection loadFromDictionary:aDictionary[collectionName]];
    }
}

- (NSArray *)allCollectionNames
{
    return [_collections allKeys];
}

- (HEZPropertiesCollection *)collectionWithName:(NSString *)name
{
    return _collections[name];
}

@end

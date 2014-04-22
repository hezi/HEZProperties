//
//  HEZPropertiesStore.m
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import "HEZPropertiesStore.h"
#import "HEZPropertiesCategory.h"

@implementation HEZPropertiesStore {
    NSMutableDictionary *_categories;
}

+ (HEZPropertiesStore *)defaultStore
{
    static dispatch_once_t once;
    static HEZPropertiesStore *store;
    dispatch_once(&once, ^ {
        store = [[HEZPropertiesStore alloc] init];
        
        NSString *infoPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"defaultProperties" ofType:@"plist"];
        NSDictionary *defaultProperties = [NSDictionary dictionaryWithContentsOfFile:infoPath][@"defaultProperties"] ?: [NSDictionary dictionaryWithContentsOfFile:defaultPath];
        
        [store addEntriesFromDictionary:defaultProperties];
        
    });
    return store;
}

- (instancetype)init
{
    if ((self = [super init])) {
        _categories = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)addEntriesFromDictionary:(NSDictionary*)aDictionary
{
    for(NSString *categoryName in [aDictionary allKeys])
    {
        HEZPropertiesCategory *category = _categories[categoryName] ?: [HEZPropertiesCategory categoryFromDictionary:aDictionary[categoryName]];
        
        if(!_categories[categoryName]) {
            [category setName:categoryName];
            [_categories setObject:category forKey:categoryName];
        }
        else
            [category loadFromDictionary:aDictionary[categoryName]];
    }
}

- (HEZPropertiesCategory*)categoryWithName:(NSString*)name
{
    return _categories[name];
}

@end

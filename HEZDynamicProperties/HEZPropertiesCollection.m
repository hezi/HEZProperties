//
//  HEZPropertiesCollection.m
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import "HEZPropertiesCollection.h"
#import "HEZProperty.h"

@implementation HEZPropertiesCollection {
    NSMutableDictionary *_values;
}

+ (instancetype)collectionFromDictionary:(NSDictionary*)aDictionary
{
    return [[self alloc] initWithDictionary:aDictionary];
}

- (instancetype)initWithDictionary:(NSDictionary*)aDictionary
{
    self = [super init];
    if (self) {
        _values = [[NSMutableDictionary alloc] init];
        [self loadFromDictionary:aDictionary];
    }
    return self;
}

- (void)loadFromDictionary:(NSDictionary*)aDictionary
{
    for(NSString *propertyName in [aDictionary allKeys])
    {
        id propertyValue = aDictionary[propertyName];
        HEZProperty *property = _values[propertyName] ?: [[HEZProperty alloc] initWithName:propertyName];

        if(![propertyValue isMemberOfClass:[NSDictionary class]])
        {
            [property setCurrentValue:propertyValue];
        }
        else
        {
            [property setCurrentValue:[propertyValue objectForKey:@"current"]];
            [property setMinimumValue:[propertyValue objectForKey:@"minimum"]];
            [property setMaximumValue:[propertyValue objectForKey:@"maximum"]];
        }
        
        if(!_values[propertyName])
            [_values setObject:property forKey:propertyName];
    }
}

- (HEZProperty*)propertyWithName:(NSString*)name
{
    return _values[name];
}

@end

//
//  HEZProperties.h
//
//  Copyright (c) 2014 Hezi Cohen. All rights reserved.
//

#import "HEZProperty.h"
#import "HEZPropertiesStore.h"
#import "HEZPropertiesCategory.h"
#import "HEZPropertiesCollection.h"
#import "HEZPropertyBindObserver.h"

#define HEZPropertyObject(category, collection, name) ([[[[HEZPropertiesStore defaultStore] categoryWithName:category] collectionWithName:collection] propertyWithName:name])

#define HEZPropertyValue(category, collection, name) ([HEZPropertyObject(category, collection, name) currentValue])

#define HEZPropertyBind(object, property, category, collection, name) \
((^{ \
HEZProperty *__bind_property = HEZPropertyObject(category, collection, name);\
object.property = HEZPropertyValue(category, collection, name); \
\
HEZPropertyBindObserver *observer__ = [[HEZPropertyBindObserver alloc] initWithProperty:__bind_property block:^(id object__) { \
__typeof__(object) object___ = object__; \
object___.property = HEZPropertyValue(category, collection, name); \
}]; \
[observer__ attachToObject:object]; \
})())

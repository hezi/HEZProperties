HEZProperties
=============

"Easily adjust parameters for iOS apps ~~in development~~."

Partialy based on and similar to [FBTweaks](https://github.com/facebook/Tweaks/) but:

1. Simpler implementation. (no inline stuff or long macros)
2. Is to be used for runtime configuration.
3. Doesn't have editing GUI yet.


##Why?

1. I wanted something simpler.
2. I wanted to be able to download new configurations from a server.

##How?

###Loading Data
Loading data is done via `HEZPropertiesStore` the `defaultStore` reads a Dictionary

Very similar to FBTweaks.

We have `HEZProperty` and three macros:

###`HEZPropertyValue`

Get value and use it

    NSNumber *aValue = HEZPropertyValue(@"Category 1", @"Collection 1", @"Value 1");

###`HEZPropertyObject`

Get actual HEZProperty object to manipulate.

    HEZProperty *value1 = HEZPropertyObject(@"Category 1", @"Collection 1", @"Value 1");
    [value1 addObserver:self];
    [value1 setCurrentValue:@(456.2)];

###`HEZPropertyBind`

Bind value to an objects property

    HEZPropertyBind(self, name, @"Category 1", @"Collection 2", @"Name");

any changes made to the `HEZProperty` will reflect on `self.name`

/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

#import <Foundation/Foundation.h>

static NSString *const kPirateWeatherAPIKey = @"YOUR_API_KEY_HERE";

%hook NSURLSession

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    NSMutableURLRequest *mutableRequest = [request mutableCopy];

    // Modify the URL here
    NSString *originalURLString = request.URL.absoluteString;
    NSString *modifiedURLString = [originalURLString stringByReplacingOccurrencesOfString:@"api.darksky.net/forecast/643af55c58de49f52f840de8066d4b0b/" withString:[NSString stringWithFormat:@"api.pirateweather.net/forecast/%@/", kPirateWeatherAPIKey]];
    mutableRequest.URL = [NSURL URLWithString:modifiedURLString];

    NSLog(@"Original URL: %@", originalURLString);
    NSLog(@"Modified URL: %@", modifiedURLString);

    return %orig(mutableRequest, completionHandler);
}

%end
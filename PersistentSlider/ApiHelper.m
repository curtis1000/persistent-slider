//
//  ApiHelper.m
//  PersistentSlider
//
//  Created by Curtis Branum on 12/19/13.
//  Copyright (c) 2013 Curtis Branum. All rights reserved.
//

#import "ApiHelper.h"

@implementation ApiHelper
+ (int)getPersistentSliderValue
{

    // you can test posting like this:
    // curl --verbose -d value=54 http://curtisbranum.com/persistent-slider/api.php
    
    // Send a synchronous request
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.curtisbranum.com/persistent-slider/api.php"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    NSString *valueString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    int valueInt = [valueString intValue];
    
    return valueInt;
}
@end



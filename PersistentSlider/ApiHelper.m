//
//  ApiHelper.m
//  PersistentSlider
//
//  Created by Curtis Branum on 12/19/13.
//  Copyright (c) 2013 Curtis Branum. All rights reserved.
//
// you can test posting like this:
// curl --verbose -d value=54 http://curtisbranum.com/persistent-slider/api.php

#import "ApiHelper.h"

@implementation ApiHelper

+ (NSString *)getApiUrl
{
    NSString *apiUrl = @"http://curtisbranum.com/persistent-slider/api.php";
    return apiUrl;
}

+ (int)getPersistentSliderValue
{
    // NSLog(@"%@", [self getApiUrl]);
    
    // Send a synchronous request
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[self getApiUrl]]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    NSString *valueString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    int valueInt = [valueString intValue];
    
    return valueInt;
}

//+ (void)setPersistentSliderValue:(int)valueInteger
+ (void)setPersistentSliderValue:(int)valueInteger
{
    // gleaned from: http://stackoverflow.com/questions/15749486/sending-http-post-ios
    
    NSString *valueString = [NSString stringWithFormat:@"%d", valueInteger];
    
    NSString *post = [NSString stringWithFormat:@"&value=%@",valueString];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:[self getApiUrl]]];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    
    [request setHTTPBody:postData];
    
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if(conn){
        //NSLog(@"Connection Successful");
    } else {
        //NSLog(@"Connection could not be made");
    }
}


@end



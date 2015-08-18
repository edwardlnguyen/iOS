//
//  UserAgent.m
//  ConnectSdk
//
//  Created by Rockie Morgan on 10/17/14.
//  Copyright (c) 2014 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UserAgent.h"

#define CONNECTSDK_USERAGENT_TEMPLATE   @"ConnectSDK/1.0.2 (%@ %@)"

@implementation UserAgent
{
    NSString  *userAgent;
}

-(id) init
{
    if ((self = [super init]) == nil)
    {
        return nil;
    }
    
    userAgent = nil;
    
    return self;
}

-(NSString *) getValueForEnvironment: (NSString*)key
{
    return [[[NSProcessInfo processInfo] environment] objectForKey: key];
}

-(NSString *) getUserAgent
{
    if (userAgent == nil) {
        NSString *agent         = CONNECTSDK_USERAGENT_TEMPLATE;
        NSString *systemName    = [UIDevice currentDevice].systemName;
        NSString *systemVersion = [UIDevice currentDevice].systemVersion;
        userAgent = [NSString stringWithFormat:agent, systemName, systemVersion];
    }
    return userAgent;
}

@end
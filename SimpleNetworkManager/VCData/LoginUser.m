//
//  LoginUser.m
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import "LoginUser.h"

@implementation LoginUser

- (id)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) {
        return nil;
    }
    self = [[LoginUser alloc] init];
    if (self) {
        [self parse:dict];
    }
    return self;
}

- (BOOL)parse:(NSDictionary *)dict {
    if (![super parse:dict]) {
        NSDictionary *exception = [dict objectForKey:EXCEPTION];
        if ([exception valueForKey:@"name"]) {
            self.error = [exception valueForKey:@"name"];
        }
        return NO;
    }
    return YES;
}

@end

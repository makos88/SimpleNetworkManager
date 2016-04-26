//
//  DataManager.m
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (DataManager *)sharedInstance
{
    static DataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)setLoginUserParams:(NSDictionary *)params networkStatus:(NetCommunicationState)netCommunicationState {
    if (self.loginUser == nil)
    {
        self.loginUser = [[LoginUser alloc] init];
    }
    [self setNetworkState:netCommunicationState object:self.loginUser data:params];
}

- (VCData *)setNetworkState:(NetCommunicationState)networkStatus object:(VCData *)object data:(NSDictionary *)data {
    switch (networkStatus)
    {
        case NetCommunicationStateDownloading:
            object.status = VCDataStateDownloading;
            break;
        case NetCommunicationStateSending:
            object.status = VCDataStateSending;
            break;
        case NetCommunicationStateOK:
            if ([object parse:data]) {
                object.status = VCDataStateOK;
            }
            else {
                object.status = VCDataStateDataError;
            }
            break;
        case NetCommunicationStateError:
            [object parse:data];
            object.status = VCDataStateDataError;
            break;
    }
    return object;
}


@end

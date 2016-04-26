//
//  VCData.m
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import "VCData.h"

@implementation VCData

@synthesize status;

- (BOOL)parse:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ([dict valueForKey:DTO]) {
        return YES;
    }
    return NO;
}

- (void)setStatus:(VCDataState)_status {
    status = _status;
    switch (status) {
        case VCDataStateNew:
        case VCDataStateDownloading:
        case VCDataStateSending:
        case VCDataStateOK:
        case VCDataStateConnectionError:
        case VCDataStateDataError:
            break;
    }
}

@end

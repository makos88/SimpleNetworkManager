//
//  NetworkManager.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define kParamEmail @"email"
#define kParamPassword @"password"

@protocol NetworkManagerDelegate;

@interface NetworkManager : AFHTTPRequestOperationManager

+ (NetworkManager *)sharedClient;

@property (weak, nonatomic) id<NetworkManagerDelegate> delegate;

- (void)loginUser:(NSString *)email andPassword:(NSString *)password;

- (NSDictionary *)paramForLoginUserWithEmail:(NSString *)email andPassword:(NSString *)password;

@end

@protocol NetworkManagerDelegate <NSObject>

- (void)didInternetConnection:(NetworkManager *)controller didFinish:(BOOL)value;

@end

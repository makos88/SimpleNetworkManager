//
//  NetworkManager.m
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import "NetworkManager.h"
#import "JSONResponseSerializerWithData.h"
#import "DataManager.h"

static NSString *const BASE_URL = @"http://192.168.1.107:9093/";

static NSString * const LoginUserUrl = @"invoker/AccountService/loginUser";

@implementation NetworkManager

+ (instancetype)sharedClient
{
    static NetworkManager *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[NetworkManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
    });
    return sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self)
    {
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        self.responseSerializer = [JSONResponseSerializerWithData serializer];
        
        typeof(self) __weak weakSelf = self;
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
         {
             typeof(weakSelf) __strong strongSelf = weakSelf;
             if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
                 if ([strongSelf.delegate respondsToSelector:@selector(didInternetConnection:didFinish:)])
                 {
                     [strongSelf.delegate didInternetConnection:strongSelf didFinish:YES];
                 }
             }
             if (status == AFNetworkReachabilityStatusNotReachable) {
                 if ([strongSelf.delegate respondsToSelector:@selector(didInternetConnection:didFinish:)])
                 {
                     [strongSelf.delegate didInternetConnection:strongSelf didFinish:NO];
                 }
             }
         }];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
    return self;
}

- (void)loginUser:(NSString *)email andPassword:(NSString *)password
{
    NSDictionary *params = [self paramForLoginUserWithEmail:email andPassword:password];
    
    [[DataManager sharedInstance] setLoginUserParams:nil networkStatus:NetCommunicationStateDownloading];
    [self POST:LoginUserUrl parameters:params success:^(AFHTTPRequestOperation *task, id responseObject) {
        [[DataManager sharedInstance] setLoginUserParams:responseObject networkStatus:NetCommunicationStateOK];
    } failure:^(AFHTTPRequestOperation *task, NSError *error) {
        id responseError = error.userInfo[JSONResponseSerializerWithDataKey];
        [[DataManager sharedInstance] setLoginUserParams:responseError networkStatus:NetCommunicationStateError];
    }];
}

#pragma mark - params method

- (NSDictionary *)paramForLoginUserWithEmail:(NSString *)email andPassword:(NSString *)password
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:email forKey:kParamEmail];
    [params setObject:password forKey:kParamPassword];
    return params;
}

@end


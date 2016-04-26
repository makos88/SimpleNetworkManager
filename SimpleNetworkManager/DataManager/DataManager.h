//
//  DataManager.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "LoginUser.h"

@interface DataManager : NSObject

@property (strong, nonatomic) LoginUser *loginUser;

+ (DataManager *)sharedInstance;
- (void)setLoginUserParams:(NSDictionary *)params networkStatus:(NetCommunicationState)netCommunicationState;

@end

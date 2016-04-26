//
//  LoginUser.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCData.h"

@interface LoginUser : VCData

- (id)initWithDictionary:(NSDictionary *)dict;

@property (copy, nonatomic) NSString *responseClass;

@end

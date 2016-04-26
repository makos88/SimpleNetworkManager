//
//  VCData.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

#define DTO @"dto"
#define EXCEPTION @"exception"
#define RESPONSE_OBJECT = @"responseObject"

@interface VCData : NSObject

@property (assign, nonatomic) VCDataState status;
@property (copy, nonatomic) NSString *error;

- (BOOL)parse:(NSDictionary *)dict;


@end

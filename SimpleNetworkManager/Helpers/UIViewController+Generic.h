//
//  UIViewController+Generic.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCData.h"
#import "Constants.h"
#import "DataManager.h"

#define kLoginUserKeyPath @"loginUser.status"

@interface UIViewController (Generic)

- (void)addObserverWithType:(VCType)type;
- (void)removeObserverWithType:(VCType)type;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context type:(VCType)type;

@end

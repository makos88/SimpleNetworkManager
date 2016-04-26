//
//  UIViewController+Generic.m
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import "UIViewController+Generic.h"

@implementation UIViewController (Generic)

- (void)addObserverWithType:(VCType)type {
    switch (type) {
        case VCTypeLogin:
            [[DataManager sharedInstance] addObserver:self forKeyPath:kLoginUserKeyPath options:NSKeyValueObservingOptionNew context:NULL];
            break;
        default:
            break;
    }
}

- (void)removeObserverWithType:(VCType)type {
    switch (type) {
        case VCTypeLogin:
            [[DataManager sharedInstance] removeObserver:self forKeyPath:kLoginUserKeyPath];
            break;
        default:
            break;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context type:(VCType)type {
    [self updateDataWithKeyPath:keyPath];
}

#pragma mark - Abstract methods

- (void)updateDataWithKeyPath:(NSString *)keyPath
{
    [NSException raise:@"Invoked abstract method" format:@"Invoked abstract method"];
}

- (void)updateGUIWithKeyPath:(NSString *)keyPath
{
    [NSException raise:@"Invoked abstract method" format:@"Invoked abstract method"];
}

- (void)initializeGUI
{
    [NSException raise:@"Invoked abstract method" format:@"Invoked abstract method"];
}


@end

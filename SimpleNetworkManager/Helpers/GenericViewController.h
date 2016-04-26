//
//  GenericViewController.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Generic.h"

@interface GenericViewController : UIViewController

@property(assign, nonatomic) VCType type;

- (void)updateDataWithKeyPath:(NSString *)keyPath;
- (void)updateGUIWithKeyPath:(NSString *)keyPath;
- (void)initializeGUI;

@end

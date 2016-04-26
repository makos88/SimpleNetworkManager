//
//  ViewController.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import "GenericViewController.h"
#import "NetworkManager.h"

@interface ViewController : GenericViewController <NetworkManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginAction:(id)sender;

@end

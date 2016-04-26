//
//  ViewController.m
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController() {
    LoginUser *loginUser;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetworkManager sharedClient].delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.type = VCTypeLogin;
}

#pragma mark - KVO

- (void)updateDataWithKeyPath:(NSString *)keyPath {
    loginUser = [DataManager sharedInstance].loginUser;
    [self updateGUIWithKeyPath:keyPath];
}

- (void)updateGUIWithKeyPath:(NSString *)keyPath {
    switch (loginUser.status) {
        case VCDataStateNew:
            break;
        case VCDataStateSending:
            break;
        case VCDataStateDownloading:
            break;
        case VCDataStateOK:
            break;
        case VCDataStateDataError:
            if ([loginUser.error isEqualToString:@"com.devservices.account.exceptions.WrongPasswordException: Wrong Password"]) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Błąd" message:@"Wrowadziłeś złe hasło" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
            }
            break;
        case VCDataStateConnectionError:
            break;
            
        default:
            break;
    }
}

- (void)didInternetConnection:(NetworkManager *)controller didFinish:(BOOL)value {
    if (!value) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Brak Internetu" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)loginAction:(id)sender {
    NSString *email = self.loginTextField.text;
    NSString *password = self.passwordTextField.text;
    [[NetworkManager sharedClient] loginUser:email andPassword:password];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end

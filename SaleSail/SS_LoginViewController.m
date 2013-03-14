//
//  SS_LoginViewController.m
//  SaleSail
//
//  Created by e on 3/7/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_LoginViewController.h"
#import "SS_LoginView.h"

@interface SS_LoginViewController ()

@end

@implementation SS_LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)login:(id)sender {
    
    
    
    NSLog(@"ajunge in login");
    NSLog(@"email: %@", self.emailField.text);
    NSLog(@"password: %@", self.passwordField.text);
    if ([self.emailField.text length] != 0 &&
        [self.passwordField.text length] != 0) {
//        NSLog(@"do login that is");
//        [MY_APP_DELEGATE showLoading];
//        
//        NSString *serverType = [[NSUserDefaults standardUserDefaults] stringForKey:@"server_preference"];
//        NSString *params = @"";
//        if (!serverType || [serverType isEqualToString:@"2"]) {
//            params = [NSString stringWithFormat:@"https://hq.nextlot.com/api/v1/auction/login?format=json&email=%@&pass=%@",
//                      txtUsername.text,txtPass.text];
//        }
//        if ([serverType isEqualToString:@"0"]) {
//            params = [NSString stringWithFormat:@"http://integration.nextlot.com/api/v1/auction/login?format=json&email=%@&pass=%@",
//                      txtUsername.text,txtPass.text];
//        }
//        if ([serverType isEqualToString:@"1"]) {
//            params = [NSString stringWithFormat:@"http://staging.nextlot.com/api/v1/auction/login?format=json&email=%@&pass=%@",
//                      txtUsername.text,txtPass.text];
//        }
//        
//        NSLog(@"server type: %@", params);
//        NSURL *url = [NSURL URLWithString:params];
//        
//        //production server (2) https://hq.nextlot.com/api/v1/auction/login
//        //user: nextlotmobile@nextlot.com
//        //pass: 90qtpagl12
//        
//        //integration and staging server (0 || 1) user and pass
//        //testingapi@nextlot.com
//        //testing
//        
//        
//        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
//        NSLog(@"server type: %@", serverType);
//        [urlRequest setHTTPMethod:@"POST"];
//        
//        
//        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest
//                                                                                            success:^(NSURLRequest *urlRequest, NSHTTPURLResponse *response, id JSON) {
//                                                                                                
//                                                                                                //          NSLog(@"%@",JSON);
//                                                                                                [MY_APP_DELEGATE hideLoading];
//                                                                                                [MY_APP_DELEGATE setAppkey:[JSON valueForKeyPath:@"api_key"]];
//                                                                                                [MY_APP_DELEGATE setDomain:[JSON valueForKeyPath:@"domain"]];
//                                                                                                [self saveAuth];
//                                                                                                [[NSNotificationCenter defaultCenter] postNotificationName:@"UserLoggedIn" object:nil userInfo:nil];
//                                                                                                [MKInfoPanel showPanelInWindow:[MY_APP_DELEGATE window]
//                                                                                                                          type:MKInfoPanelTypeInfo 
//                                                                                                                         title:@"You have logged in successfully!"
//                                                                                                                      subtitle:nil
//                                                                                                                     hideAfter:1];
//                                                                                                [self closeLogin:self];
//                                                                                                
//                                                                                                
//                                                                                            } 
//                                                                                            failure:^ (NSURLRequest *urlRequest, NSURLResponse *response, NSError *error, id json) {
//                                                                                                NSLog(@"%@", error);
//                                                                                                NSString *tempSubtitle = [error description];
//                                                                                                self.lblServerType.text = tempSubtitle;
//                                                                                                [MY_APP_DELEGATE hideLoading];
//                                                                                                [MKInfoPanel showPanelInView:self.view 
//                                                                                                                        type:MKInfoPanelTypeError 
//                                                                                                                       title:@"Login error!" 
//                                                                                                                    subtitle:@"There was a problem logging in!"
//                                                                                                                   hideAfter:2];
//                                                                                                
//                                                                                                
//                                                                                            }];
//        
//        
//        [operation start];
    
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Login Error"
                              message: @"Valid email and password required!"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void) saveAuth {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setValue:txtUsername.text forKey:@"username"];
//    [defaults setValue:txtPass.text forKey:@"pass"];
//    [defaults synchronize];
    
}

-(void) loadAuth {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    txtUsername.text = [defaults stringForKey:@"username"];
//    txtPass.text = [defaults stringForKey:@"pass"];
    
}

- (BOOL) isUserAuthentificated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* username = [defaults stringForKey:@"username"];
    if (username.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (void)displayLoginView {
    SS_LoginView *loginView = [[SS_LoginView alloc] init];
    [loginView show];
}

@end

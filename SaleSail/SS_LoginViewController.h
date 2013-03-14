//
//  SS_LoginViewController.h
//  SaleSail
//
//  Created by e on 3/7/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SS_LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;
- (BOOL) isUserAuthentificated;
- (void)displayLoginView;
@end

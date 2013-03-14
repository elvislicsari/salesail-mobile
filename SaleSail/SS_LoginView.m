//
//  SS_LoginView.m
//  SaleSail
//
//  Created by e on 3/11/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_LoginView.h"

@implementation SS_LoginView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // add as many newlines as you need to fit
        // the controls (buttons, labels, etc...)
        [self setMessage: @"\n\n\n\n\n"];
        
        CGRect frame = CGRectMake(10.0f, 10.0f, 200.0f, 30.0f);
        UILabel *label= [[UILabel alloc] initWithFrame:frame];
        [label setTextColor:[UIColor whiteColor]];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:@"You need to login first"];
        
        CGRect emailFrame = CGRectMake(10.0f, 50.0f, 200.0f, 30.0f);
        UILabel *emailLabel = [[UILabel alloc] initWithFrame:emailFrame];
        [emailLabel setTextColor:[UIColor whiteColor]];
        [emailLabel setBackgroundColor:[UIColor clearColor]];
        [emailLabel setText:@"Username:"];
        
        CGRect emailTFFrame = CGRectMake(100.0f, 50.0f, 150.0f, 30.0f);
        UITextField *emailTextField = [[UITextField alloc] initWithFrame:emailTFFrame];
        [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
        [emailTextField setBackgroundColor:[UIColor whiteColor]];
        
        CGRect passFrame = CGRectMake(10.0f, 90.0f, 200.0f, 30.0f);
        UILabel *passLabel = [[UILabel alloc] initWithFrame:passFrame];
        [passLabel setTextColor:[UIColor whiteColor]];
        [passLabel setBackgroundColor:[UIColor clearColor]];
        [passLabel setText:@"Password:"];
        
        CGRect passTFFrame = CGRectMake(100.0f, 90.0f, 150.0f, 30.0f);
        UITextField *passTextField = [[UITextField alloc] initWithFrame:passTFFrame];
        [passTextField setKeyboardType:UIKeyboardTypeEmailAddress];
        [passTextField setBackgroundColor:[UIColor whiteColor]];
        
        
        [self addSubview:label];
        [self addSubview:emailLabel];
        [self addSubview:emailTextField];
        [self addSubview:passLabel];
        [self addSubview:passTextField];
    }
    return self;
}


@end

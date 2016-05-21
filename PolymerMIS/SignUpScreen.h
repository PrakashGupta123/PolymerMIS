//
//  SignUpScreen.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 26/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HudView.h"
#import "ASIFormDataRequest.h"
#import "MenuView.h"

@interface SignUpScreen : UIViewController <UITextFieldDelegate, ASIHTTPRequestDelegate, UIAlertViewDelegate, MenuViewDelegate>
{
    UILabel *headerLabel;
    UIButton *backButton;
    UIScrollView *scrollView;
    UITextField *textFieldFullName;
    UITextField *textFieldCompanyName;
    UITextField *textFieldMobileNumber;
    UITextField *textFieldState;
    UITextField *textFieldCity;
    UITextField *textFieldCountry;
    UITextField *textFieldEmail;
    UIButton *buttonSignUp;
    UIButton *buttonReset;
    HudView *aHUD;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
    UITextField *tempTextField;
}

@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UITextField *textFieldFullName;
@property(nonatomic,strong)IBOutlet UITextField *textFieldCompanyName;
@property(nonatomic,strong)IBOutlet UITextField *textFieldMobileNumber;
@property(nonatomic,strong)IBOutlet UITextField *textFieldState;
@property(nonatomic,strong)IBOutlet UITextField *textFieldCity;
@property(nonatomic,strong)IBOutlet UITextField *textFieldCountry;
@property(nonatomic,strong)IBOutlet UITextField *textFieldEmail;
@property(nonatomic,strong)IBOutlet UIButton *buttonSignUp;
@property(nonatomic,strong)IBOutlet UIButton *buttonReset;
@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
-(IBAction)btnContactus:(id)sender;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnResetButton:(id)sender;
-(IBAction)actionOnSignUpButton:(id)sender;
- (BOOL)validateEmailWithString:(NSString*)email1;
- (BOOL)validatePhoneNumberWithString:(NSString*)num;
-(IBAction)showMenu:(id)sender;

@end

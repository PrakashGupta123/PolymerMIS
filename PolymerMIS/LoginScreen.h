//
//  LoginScreen.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 26/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "HudView.h"
#import "MenuView.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolymerMISAppDelegate.h"
@protocol MenuViewDelegate <NSObject>
@end
@interface LoginScreen : UIViewController <UITextFieldDelegate,ASIHTTPRequestDelegate,MenuViewDelegate>
{
    UILabel *headerLabel;
    UIButton *backButton;
    UITextField *textFieldForUsername;
    UITextField *textFieldForPassword;
    UIButton *buttonLogin;
    UIButton *buttonReset;
    HudView *aHUD;
    UILabel *username;
    UILabel *password;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
  
}
- (IBAction)btnBack:(id)sender;
- (IBAction)btnContactus:(id)sender;
- (IBAction)btnNewUser:(id)sender;
- (IBAction)btnVisit:(id)sender;
- (IBAction)btnKillSession:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *viewKill1;

@property (weak, nonatomic) IBOutlet UIView *viewKill;
@property (weak, nonatomic) IBOutlet UITextField *txtKillPwd;

@property (strong, nonatomic) IBOutlet UIView *viewWeb;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIButton *btnVisitWEbsit;
@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UITextField *textFieldForUsername;
@property(nonatomic,strong)IBOutlet UITextField *textFieldForPassword;
@property(nonatomic,strong)IBOutlet UIButton *buttonLogin;
@property(nonatomic,strong)IBOutlet UIButton *buttonReset;
@property(nonatomic,strong)IBOutlet UILabel *username;
@property(nonatomic,strong)IBOutlet UILabel *password;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
- (IBAction)RemembermeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Chekedbtn;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnLoginButton:(id)sender;
-(IBAction)actionOnResetButton:(id)sender;
- (BOOL)validateEmailWithString:(NSString*)email1;
-(IBAction)showMenu:(id)sender;

@end

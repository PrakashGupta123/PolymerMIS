//
//  SignUpOrLogin.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 25/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolymerMISAppDelegate.h"
#import "MenuView.h"

@interface SignUpOrLogin : UIViewController <MenuViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIButton *buttonSignUp;
    UIButton *buttonSignIn;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;

@property(nonatomic,strong)IBOutlet UIButton *buttonSignUp;
@property(nonatomic,strong)IBOutlet UIButton *buttonSignIn;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
- (IBAction)MenuAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;

-(IBAction)actionOnSignUp:(id)sender;
-(IBAction)actionOnSignIn:(id)sender;
-(IBAction)showMenu:(id)sender;
@end

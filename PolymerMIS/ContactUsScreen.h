//
//  ContactUsScreen.h
//  PolymerMIS
//
//  Created by sanchay on 3/1/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@interface ContactUsScreen : UIViewController <MenuViewDelegate>
{
    UILabel *headerLabel;
    UIButton *backButton;
    UIWebView *webView;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}
@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UIWebView *webView;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;

- (IBAction)MenuBtnAction:(id)sender;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

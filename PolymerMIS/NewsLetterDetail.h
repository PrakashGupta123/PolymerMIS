//
//  NewsLetterDetail.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 07/03/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HudView.h"
#import "MenuView.h"

@interface NewsLetterDetail : UIViewController <UIWebViewDelegate, MenuViewDelegate>
{
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *homeButton;
    UIWebView *webView;
    NSString *newsletterName;
    NSString *newsletterURL;
    HudView *aHUD;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}

@property(nonatomic,strong) IBOutlet UILabel *headerLabel;
@property(nonatomic,strong) IBOutlet UIButton *backButton;
@property(nonatomic,strong) IBOutlet UIButton *homeButton;
@property(nonatomic,strong) IBOutlet UIWebView *webView;
@property(nonatomic,strong) NSString *newsletterName;
@property(nonatomic,strong) NSString *newsDate;

@property(nonatomic,strong) NSString *newsletterURL;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;

- (IBAction)MenuBtnAction:(id)sender;
-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnHomeButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

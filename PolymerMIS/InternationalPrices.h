//
//  InternationalPrices.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 06/03/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@interface InternationalPrices : UIViewController <MenuViewDelegate>
{
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *homeButton;
    UIButton *buttonIndia;
    UIButton *buttonSouthEastAsia;
    UIButton *buttonMiddleEast;
    UIButton *buttonUSA;
    UIButton *buttonChina;
    UIButton *buttonEurope;
    UIScrollView *scrlView;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}

@property(nonatomic,strong)IBOutlet UIButton *btnBack;

@property (strong, nonatomic) IBOutlet UIView *viewWeb;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIButton *btnVisitWEbsit;

@property(nonatomic,strong) IBOutlet UILabel *headerLabel;
@property(nonatomic,strong) IBOutlet UIButton *backButton;
@property(nonatomic,strong) IBOutlet UIButton *homeButton;
@property(nonatomic,strong) IBOutlet UIButton *buttonIndia;
@property(nonatomic,strong) IBOutlet UIButton *buttonSouthEastAsia;
@property(nonatomic,strong) IBOutlet UIButton *buttonMiddleEast;
@property(nonatomic,strong) IBOutlet UIButton *buttonUSA;
@property(nonatomic,strong) IBOutlet UIButton *buttonChina;
@property(nonatomic,strong) IBOutlet UIButton *buttonEurope;
@property(nonatomic,strong) IBOutlet UIScrollView *scrlView;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;


- (IBAction)MenuBtnAction:(id)sender;


-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnHomeButton:(id)sender;
-(IBAction)actionOnCountryButtons:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

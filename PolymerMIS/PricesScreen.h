//
//  PricesScreen.h
//  PolymerMIS
//
//  Created by sanchay on 3/1/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@interface PricesScreen : UIViewController <MenuViewDelegate>

{
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *buttonIndianPrices;
    UIButton *buttonInternationalPrices;
    UIButton *buttonFeedstockPrices;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}
@property (strong, nonatomic) IBOutlet UIView *viewWeb;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIButton *btnVisitWEbsit;


@property(nonatomic,strong)IBOutlet UIButton *btnBack;

@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UIButton *buttonIndianPrices;
@property(nonatomic,strong)IBOutlet UIButton *buttonInternationalPrices;
@property(nonatomic,strong)IBOutlet UIButton *buttonFeedstockPrices;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;


- (IBAction)MenuBtnAction:(id)sender;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnIndianButton:(id)sender;
-(IBAction)actionOnInternationalButton:(id)sender;
-(IBAction)actionOnFeedstockButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

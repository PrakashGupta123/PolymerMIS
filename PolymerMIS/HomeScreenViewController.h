//
//  HomeScreenViewController.h
//  PolymerMIS
//
//  Created by sanchay on 2/28/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "HudView.h"
#import "PolymerMISAppDelegate.h"
#import "MenuView.h"

@interface HomeScreenViewController : UIViewController <ASIHTTPRequestDelegate, MenuViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UILabel *headerLabel;
    UIButton *buttonNews;
    UIButton *buttonPrice;
    UIButton *buttonNewsLetter;
    HudView *aHUD;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;

}

@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UIButton *buttonNews;
@property(nonatomic,strong)IBOutlet UIButton *buttonPrice;
@property(nonatomic,strong)IBOutlet UIButton *buttonNewsLetter;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *MenutableIpad;

- (IBAction)MenuBtnAction:(id)sender;

-(IBAction)actionOnNewsButton:(id)sender;
-(IBAction)actionOnPriceButton:(id)sender;
-(IBAction)actionOnNewsLetterButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

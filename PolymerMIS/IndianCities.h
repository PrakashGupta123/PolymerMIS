//
//  IndianCities.h
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "HudView.h"
#import "MenuView.h"

@interface IndianCities : UIViewController <UITableViewDelegate, UITableViewDataSource, ASIHTTPRequestDelegate, MenuViewDelegate>

{
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *homeButton;
    UITableView *tableViewForCities;
    NSMutableArray *cityArray;
    HudView *aHUD;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}

@property(nonatomic,strong) IBOutlet UILabel *headerLabel;
@property(nonatomic,strong) IBOutlet UIButton *backButton;
@property(nonatomic,strong) IBOutlet UIButton *homeButton;
@property(nonatomic,strong) IBOutlet UITableView *tableViewForCities;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;

- (IBAction)MenuBtnAction:(id)sender;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnHomeButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

//
//  CommonPriceDetailScreen.h
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "HudView.h"
#import "MenuView.h"

@interface CommonPriceDetailScreen : UIViewController <UITableViewDelegate, UITableViewDataSource, ASIHTTPRequestDelegate, MenuViewDelegate>

{
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *homeButton;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UITableView *tableViewForPrices;
    NSMutableDictionary *dictionayForCredential;
    NSMutableArray *priceArray;
    HudView *aHUD;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}
@property (weak, nonatomic) IBOutlet UILabel *label4;

@property(nonatomic,strong) IBOutlet UILabel *headerLabel;
@property(nonatomic,strong) IBOutlet UIButton *backButton;
@property(nonatomic,strong) IBOutlet UIButton *homeButton;
@property(nonatomic,strong) IBOutlet UILabel *label1;
@property(nonatomic,strong) IBOutlet UIView *viewIpad;
@property(nonatomic,strong) IBOutlet UILabel *label11;
@property(nonatomic,strong) IBOutlet UILabel *label22;
@property(nonatomic,strong) IBOutlet UILabel *label33;

@property(nonatomic,strong) IBOutlet UILabel *labelipad11;
@property(nonatomic,strong) IBOutlet UILabel *labelipad22;
@property(nonatomic,strong) IBOutlet UILabel *labelipad33;

@property(nonatomic,strong) IBOutlet UILabel *label2;
@property(nonatomic,strong) IBOutlet UILabel *label3;
@property(nonatomic,strong) IBOutlet UITableView *tableViewForPrices;
@property(nonatomic,strong) NSMutableDictionary *dictionayForCredential;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;

- (IBAction)MenuBtnAction:(id)sender;
-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnHomeButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

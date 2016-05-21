//
//  NewsCategory.h
//  PolymerMIS
//
//  Created by sanchay on 3/1/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "HudView.h"
#import "MenuView.h"

@interface NewsCategory : UIViewController <UITableViewDelegate, UITableViewDataSource, ASIHTTPRequestDelegate, MenuViewDelegate>

{
    UILabel *headerLabel;
    UIButton *backButton;
    UITableView *tableViewForCategories;
    NSMutableArray *categoryArray;
    HudView *aHUD;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
    
}

@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UITableView *tableViewForCategories;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;


- (IBAction)MenuBtnAction:(id)sender;


-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

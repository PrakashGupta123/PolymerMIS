//
//  NewsCategoryDetails.h
//  PolymerMIS
//
//  Created by sanchay on 3/2/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "HudView.h"
#import "PullUpView.h"
#import "MenuView.h"

@interface NewsCategoryDetails : UIViewController <UITableViewDelegate, UITableViewDataSource, ASIHTTPRequestDelegate, MenuViewDelegate>

{
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *homeButton;
    NSString *newsurl;
    UITableView *tableViewForDetail;
    NSString *categoryID;
    NSString *categoryName;
    int pageIndex;
    NSMutableArray *newsArray;
    NSMutableArray *temporaryNewsArray;
    HudView *aHUD;
    PullUpView *view;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}

@property(nonatomic,strong) IBOutlet UILabel *headerLabel;
@property(nonatomic,strong) IBOutlet UIButton *backButton;
@property(nonatomic,strong) IBOutlet UIButton *homeButton;
@property(nonatomic,strong) IBOutlet UITableView *tableViewForDetail;
@property(nonatomic,strong) NSString *categoryID;
@property(nonatomic,strong) NSString *categoryName;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;


- (IBAction)MenuBtnAction:(id)sender;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnHomeButton:(id)sender;
-(IBAction)showMenu:(id)sender;


@end

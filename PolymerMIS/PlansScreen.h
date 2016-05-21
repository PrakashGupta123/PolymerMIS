//
//  PlansScreen.h
//  PolymerMIS
//
//  Created by sanchay on 3/1/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@interface PlansScreen : UIViewController <MenuViewDelegate>

{
    UILabel *headerLabel;
    UIButton *backButton;
    UIScrollView *scrollView;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}
- (IBAction)btnVisit:(id)sender;

- (IBAction)btnBack:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewWeb;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;

- (IBAction)MenuBtnAction:(id)sender;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

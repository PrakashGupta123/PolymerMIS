//
//  NewsDetail.h
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"
#import "HudView.h"
@interface NewsDetail : UIViewController <MenuViewDelegate>

{
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *homeButton;
    UIScrollView *scrollView;
    UILabel *labelForNewsTitle;
    UILabel *labelForNewsDate;
    UIWebView *webView;
     HudView *aHUD;
    NSMutableDictionary *dictionary;
    UIButton *buttonMenu;
    PolymerMISAppDelegate *appDelegate;
    MenuView *menu;
}

@property(nonatomic,strong) IBOutlet UILabel *headerLabel;
@property(nonatomic,strong) IBOutlet UIButton *backButton;
@property(nonatomic,strong) IBOutlet UIButton *homeButton;
@property(nonatomic,strong) IBOutlet UILabel *labelForNewsTitle;
@property(nonatomic,strong) IBOutlet UILabel *labelForNewsDate;
@property(nonatomic,strong) IBOutlet UIWebView *webView;
@property(nonatomic,strong) NSMutableDictionary *dictionary;
@property(nonatomic,strong) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet UIImageView *ImageIcon;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;
@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *Menutableipad;


- (IBAction)MenuBtnAction:(id)sender;

-(IBAction)actionOnBackButton:(id)sender;
-(IBAction)actionOnHomeButton:(id)sender;
-(IBAction)showMenu:(id)sender;

@end

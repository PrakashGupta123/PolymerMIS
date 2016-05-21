//
//  InternationalPrices.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 06/03/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "InternationalPrices.h"
#import "CommonPriceDetailScreen.h"
#import "SignloginCell.h"
#import "SignloginIpadCell.h"
#import "HomeScreenViewController.h"
#import "Reachability.h"
#import "PlansScreen.h"
#import "LoginScreen.h"
#import "AboutUsScreen.h"
#import  "TermsAndConditionsScreen.h"
#import "ContactUsScreen.h"


CGSize screenSize;

@interface InternationalPrices ()
{
    NSMutableArray *menuArray,*menuArrayimg;

}
@end

@implementation InternationalPrices

@synthesize headerLabel, backButton, homeButton, buttonChina, buttonEurope, buttonIndia, buttonMiddleEast, buttonSouthEastAsia,buttonUSA,scrlView, buttonMenu;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.MenuTable.hidden=YES;
      self.Menutableipad.hidden=YES;
    self.MenuBtn.tag=0;
    _viewWeb.hidden=YES;

    menuArray = [[NSMutableArray alloc]initWithObjects:@"Home",@"About Us",@"Plans",@"Contact Us",@"Log out",@"Terms & Conditions",nil];
    
    menuArrayimg = [[NSMutableArray alloc]initWithObjects:@"homemenu",@"about us",@"plans",@"contact us",@"logout",@"icon02.png",nil];

    [self.view bringSubviewToFront:self.MenuBtn];
    screenSize=[[UIScreen mainScreen] bounds].size;

    [scrlView setContentSize:CGSizeMake(240, 295)];
    
    //[headerLabel setTextColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [self.view bringSubviewToFront:self.MenuBtn];
        [self.view bringSubviewToFront:self.MenuTable];
        self.MenuTable.frame = CGRectMake(0, 64, self.view.frame.size.width-160,self.view.frame.size.height+50);
        CGRect napkinBottomFrame = self.MenuTable.frame;
        napkinBottomFrame.origin.x = -200;
        

        [backButton setImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [homeButton setImage:[UIImage imageNamed:@"btn_home_up.png"] forState:UIControlStateNormal];
        [homeButton setImage:[UIImage imageNamed:@"btn_home_down.png"] forState:UIControlStateHighlighted];
//        [buttonIndia setImage:[UIImage imageNamed:@"btn_india_up.png"] forState:UIControlStateNormal];
//        [buttonIndia setImage:[UIImage imageNamed:@"btn_india_down.png"] forState:UIControlStateHighlighted];
//        [buttonSouthEastAsia setImage:[UIImage imageNamed:@"btn_southeastaisa_up.png"] forState:UIControlStateNormal];
//        [buttonSouthEastAsia setImage:[UIImage imageNamed:@"btn_southeastaisa_down.png"] forState:UIControlStateHighlighted];
//        [buttonMiddleEast setImage:[UIImage imageNamed:@"btn_middleeast_up.png"] forState:UIControlStateNormal];
//        [buttonMiddleEast setImage:[UIImage imageNamed:@"btn_middleeast_down.png"] forState:UIControlStateHighlighted];
//        [buttonUSA setImage:[UIImage imageNamed:@"btn_usa_up.png"] forState:UIControlStateNormal];
//        [buttonUSA setImage:[UIImage imageNamed:@"btn_usa_down.png"] forState:UIControlStateHighlighted];
//        [buttonChina setImage:[UIImage imageNamed:@"btn_china_up.png"] forState:UIControlStateNormal];
//        [buttonChina setImage:[UIImage imageNamed:@"btn_china_down.png"] forState:UIControlStateHighlighted];
//        [buttonEurope setImage:[UIImage imageNamed:@"btn_europe_up.png"] forState:UIControlStateNormal];
//        [buttonEurope setImage:[UIImage imageNamed:@"btn_europe_down.png"] forState:UIControlStateHighlighted];
        
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.Menutableipad.frame = CGRectMake(0, 64, 225,self.view.frame.size.height+50);

          [self.view bringSubviewToFront:self.Menutableipad];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_up.png"] forState:UIControlStateNormal];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_down.png"] forState:UIControlStateHighlighted];
//        [buttonIndia setBackgroundImage:[UIImage imageNamed:@"btn_india_up.png"] forState:UIControlStateNormal];
//        [buttonIndia setBackgroundImage:[UIImage imageNamed:@"btn_india_down.png"] forState:UIControlStateHighlighted];
//        [buttonSouthEastAsia setBackgroundImage:[UIImage imageNamed:@"btn_southeastaisa_up.png"] forState:UIControlStateNormal];
//        [buttonSouthEastAsia setBackgroundImage:[UIImage imageNamed:@"btn_southeastaisa_down.png"] forState:UIControlStateHighlighted];
//        [buttonMiddleEast setBackgroundImage:[UIImage imageNamed:@"btn_middleeast_up.png"] forState:UIControlStateNormal];
//        [buttonMiddleEast setBackgroundImage:[UIImage imageNamed:@"btn_middleeast_down.png"] forState:UIControlStateHighlighted];
//        [buttonUSA setBackgroundImage:[UIImage imageNamed:@"btn_usa_up.png"] forState:UIControlStateNormal];
//        [buttonUSA setBackgroundImage:[UIImage imageNamed:@"btn_usa_down.png"] forState:UIControlStateHighlighted];
//        [buttonChina setBackgroundImage:[UIImage imageNamed:@"btn_china_up.png"] forState:UIControlStateNormal];
//        [buttonChina setBackgroundImage:[UIImage imageNamed:@"btn_china_down.png"] forState:UIControlStateHighlighted];
//        [buttonEurope setBackgroundImage:[UIImage imageNamed:@"btn_europe_up.png"] forState:UIControlStateNormal];
//        [buttonEurope setBackgroundImage:[UIImage imageNamed:@"btn_europe_down.png"] forState:UIControlStateHighlighted];
    }
    [buttonMenu setContentMode:UIViewContentModeScaleAspectFill];
    appDelegate=(PolymerMISAppDelegate *)[UIApplication sharedApplication].delegate;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIInterfaceOrientation toInterfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20)];
            [scrlView setContentSize:CGSizeMake(240, 305)];
//            [scrlView setFrame:CGRectMake(40, 130, 240, 295)];
//            [backButton setFrame:CGRectMake(5, 7, 73, 32)];
//            [homeButton setFrame:CGRectMake(242, 7, 73, 32)];
            [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];
            [scrlView setContentSize:CGSizeMake(240, 400)];

//            [scrlView setFrame:CGRectMake(120, 100, 240, 200)];
//            [backButton setFrame:CGRectMake(5, 0, 73, 32)];
//            [homeButton setFrame:CGRectMake(400, 0, 73, 32)];
            [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
          //  [backButton setFrame:CGRectMake(20, 6, 75, 35)];
            [homeButton setFrame:CGRectMake(673, 6, 75, 35)];
            [buttonMenu setFrame:CGRectMake((768-buttonMenu.frame.size.width)/2, 1004-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
         //   [backButton setFrame:CGRectMake(20, 0, 75, 35)];
            [homeButton setFrame:CGRectMake(929, 0, 75, 35)];
            [buttonMenu setFrame:CGRectMake((1024-buttonMenu.frame.size.width)/2, 748-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
    }
    
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20)];
            [scrlView setContentSize:CGSizeMake(240, 305)];

//            [scrlView setFrame:CGRectMake(40, 130, 240, 295)];
//            [backButton setFrame:CGRectMake(5, 7, 73, 32)];
//            [homeButton setFrame:CGRectMake(242, 7, 73, 32)];
            if(appDelegate.isMenuViewPresented)
            {
                [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height-menu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
            else
            {
                [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
//            [buttonIndia setFrame:CGRectMake(47, 130, 227, 45) ];
//            [buttonSouthEastAsia setFrame:CGRectMake(47, 180, 227, 45) ];
//            [buttonMiddleEast setFrame:CGRectMake(47, 230, 227, 45) ];
//            [buttonUSA setFrame:CGRectMake(47, 280, 227, 45) ];
//            [buttonChina setFrame:CGRectMake(47, 330, 227, 45) ];
//            [buttonEurope setFrame:CGRectMake(47, 380, 227, 45) ];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];
            [scrlView setContentSize:CGSizeMake(240, 420)];

//           [scrlView setFrame:CGRectMake(120, 100, 240, 200)];
//            [backButton setFrame:CGRectMake(5, 0, 73, 32)];
//            [homeButton setFrame:CGRectMake(400, 0, 73, 32)];
            if(appDelegate.isMenuViewPresented)
            {
                [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height-menu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
            else
            {
                [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
//            [buttonIndia setFrame:CGRectMake(130, 90, 227, 45) ];
//            [buttonSouthEastAsia setFrame:CGRectMake(130, 130, 227, 45) ];
//            [buttonMiddleEast setFrame:CGRectMake(130, 170, 227, 45) ];
//            [buttonUSA setFrame:CGRectMake(130, 210, 227, 45) ];
//            [buttonChina setFrame:CGRectMake(130, 250, 227, 45) ];
//            [buttonEurope setFrame:CGRectMake(130, 290, 227, 45) ];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
          //  [backButton setFrame:CGRectMake(20, 6, 75, 35)];
            [homeButton setFrame:CGRectMake(673, 6, 75, 35)];
            if(appDelegate.isMenuViewPresented)
            {
                [buttonMenu setFrame:CGRectMake((768-buttonMenu.frame.size.width)/2, (1004-buttonMenu.frame.size.height)-menu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
            else
            {
                [buttonMenu setFrame:CGRectMake((768-buttonMenu.frame.size.width)/2, 1004-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
          //  [backButton setFrame:CGRectMake(20, 0, 75, 35)];
            [homeButton setFrame:CGRectMake(929, 0, 75, 35)];
            if(appDelegate.isMenuViewPresented)
            {
                [buttonMenu setFrame:CGRectMake((1024-buttonMenu.frame.size.width)/2, (748-buttonMenu.frame.size.height)-menu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
            else
            {
                [buttonMenu setFrame:CGRectMake((1024-buttonMenu.frame.size.width)/2, 748-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
        }
    }
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if(appDelegate.isMenuViewPresented)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"orientationChanged" object:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods

- (IBAction)MenuBtnAction:(id)sender {
    
    screenSize=[[UIScreen mainScreen] bounds].size;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        self.MenuTable.hidden=NO;
        if (self.MenuBtn.tag==1)
            
        {
            self.MenuBtn.tag=0;
            
            CGRect napkinBottomFrame = self.MenuTable.frame;
            napkinBottomFrame.origin.x = -225;
            
            [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ self.MenuTable.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
            
            
        }
        else
        {
            self.MenuBtn.tag=1;
            CGRect napkinBottomFrame = self.MenuTable.frame;
            napkinBottomFrame.origin.x = 0;
            [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^
             { self.MenuTable.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
            
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        
        self.Menutableipad.hidden=NO;
        if (self.MenuBtn.tag==1)
            
        {
            self.MenuBtn.tag=0;
            
            CGRect napkinBottomFrame = self.Menutableipad.frame;
            napkinBottomFrame.origin.x = -225;
            
            [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ self.Menutableipad.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
            
            
        }
        else
        {
            self.MenuBtn.tag=1;
            CGRect napkinBottomFrame = self.Menutableipad.frame;
            napkinBottomFrame.origin.x = 0;
            [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^
             { self.Menutableipad.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
            
        }
        
        
    }
    
}
- (IBAction)btnBack:(id)sender
{
    _viewWeb.hidden=YES;
    _MenuBtn.hidden=NO;

    
}
- (IBAction)btnVisit:(id)sender

{
    _viewWeb.hidden=NO;
    [self.view bringSubviewToFront:self.btnBack];
    _MenuBtn.hidden=YES;
    NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    
    
}
-(IBAction)actionOnBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(IBAction)actionOnHomeButton:(id)sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count]-3)] animated:NO];
}

-(IBAction)actionOnCountryButtons:(id)sender
{
    UIButton *button=(UIButton *)sender;
    NSMutableDictionary *dictionay=[[NSMutableDictionary alloc] init];
    [dictionay setObject:@"internationalPrice" forKey:@"priceType"];
    if(button.tag==1)
    {
        [dictionay setObject:@"INDIA" forKey:@"countryName"];
        [dictionay setObject:@"India" forKey:@"countryTag"];

    }
    else if(button.tag==2)
    {
        [dictionay setObject:@"SOUTH EAST ASIA" forKey:@"countryName"];
        [dictionay setObject:@"SouthEastAsia" forKey:@"countryTag"];
    }
    else if(button.tag==3)
    {
        [dictionay setObject:@"MIDDLE EAST" forKey:@"countryName"];
        [dictionay setObject:@"MiddleEast" forKey:@"countryTag"];
    }
    else if(button.tag==4)
    {
        [dictionay setObject:@"USA" forKey:@"countryName"];
        [dictionay setObject:@"Usa" forKey:@"countryTag"];
    }
    else if(button.tag==5)
    {
        [dictionay setObject:@"CHINA" forKey:@"countryName"];
        [dictionay setObject:@"China" forKey:@"countryTag"];
    }
    else if(button.tag==6)
    {
        [dictionay setObject:@"EUROPE" forKey:@"countryName"];
        [dictionay setObject:@"Eurpoe" forKey:@"countryTag"];
    }
    
    CommonPriceDetailScreen *priceScreen=[[CommonPriceDetailScreen alloc] init];
    
    priceScreen.dictionayForCredential=dictionay;
    
    [self.navigationController pushViewController:priceScreen animated:NO];
}

-(IBAction)showMenu:(id)sender
{
    menu=[[MenuView alloc] initWithLoginFlag:YES inClass:self];
    menu.delegate=self;
    [UIView animateWithDuration:0.5 animations:^
     {
         CGRect rect=buttonMenu.frame;
         rect.origin.y-=menu.frame.size.height;
         buttonMenu.frame=rect;
         [buttonMenu setBackgroundImage:[UIImage imageNamed:@"menu_down.png"] forState:UIControlStateNormal];
     }
     ];
    
    [menu showMenuViewInView:self.view];
}

#pragma mark - MenuViewDelegate Methods

-(void)changeMenuButtonPosition
{
    [UIView animateWithDuration:0.5 animations:^
     {
         CGRect rect=buttonMenu.frame;
         rect.origin.y+=menu.frame.size.height;
         buttonMenu.frame=rect;
         [buttonMenu setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
     }
     ];
}

-(void)changeMenuButtonPositionInCaseOfLoginIphone
{
    //nslog(@"%f",menu.frame.origin.y);
    CGRect rect=buttonMenu.frame;
    rect.origin.y=menu.frame.origin.y-buttonMenu.frame.size.height;
    buttonMenu.frame=rect;
    //nslog(@"%f %f",menu.frame.origin.y,buttonMenu.frame.origin.y);
    //    [self.view bringSubviewToFront:buttonMenu];
}
#pragma mark - MenuTableDelegate Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menuArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView==self.MenuTable) {
        
        SignloginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignloginCell"];
        if (cell == nil) {
            // Load the top-level objects from the custom cell XIB.
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SignloginCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
            
        }
        cell.labelMenu.text=[menuArray objectAtIndex:indexPath.row];
cell.imagMenu.image=[UIImage imageNamed:[menuArrayimg objectAtIndex:indexPath.row] ];
        // cell.textLabel.text=[menuArray objectAtIndex:indexPath.row];
        cell.labelMenu.textColor=[UIColor whiteColor];
        return cell;
    }
    else  {
        
        SignloginIpadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignloginIpadCell"];
        if (cell == nil) {
            // Load the top-level objects from the custom cell XIB.
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SignloginIpadCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
cell.imageipad.image=[UIImage imageNamed:[menuArrayimg objectAtIndex:indexPath.row] ];
        cell.labelipad.text=[menuArray objectAtIndex:indexPath.row];
        // cell.textLabel.text=[menuArray objectAtIndex:indexPath.row];
        cell.labelipad.textColor=[UIColor whiteColor];
        
        return cell;
    }

}
- (void)tableView:(UITableView *)tableView willDisplayCell:(SignloginCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    cell.labelMenu.text =[menuArray objectAtIndex:indexPath.row];
    //    if (cell.isSelected == YES)
    //    {
    //        // [cell setBackgroundColor:[UIColor blueColor]];
    //    }
    //    else
    //    {
    //        // [cell setBackgroundColor:[UIColor blueColor]];
    //    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if (indexPath.row==0) {
        
           HomeScreenViewController *about=[[HomeScreenViewController alloc] init];
        
          [appDelegate.navigationController pushViewController:about animated:NO];
        
    }
    
    if (indexPath.row==1) {
        
        AboutUsScreen *about=[[AboutUsScreen alloc] init];
        
        [appDelegate.navigationController pushViewController:about animated:NO];
        
        
        
    }
    
    
    
    if (indexPath.row==2) {
        
        PlansScreen *plan=[[PlansScreen alloc] init];
        
        [appDelegate.navigationController pushViewController:plan animated:NO];
        
        
        
        
        
        
        
    }
    
    
    
    if (indexPath.row==3) {
        
        ContactUsScreen *contact=[[ContactUsScreen alloc] init];
        
        [appDelegate.navigationController pushViewController:contact animated:NO];
        
        
        
    }
    
    
    
    if (indexPath.row==4) {
        
        [self logoutClicked];
        
    }
    
    if (indexPath.row==5)
        
    {
        TermsAndConditionsScreen *contact=[[TermsAndConditionsScreen alloc] init];
        [appDelegate.navigationController pushViewController:contact animated:NO];
        
        
    }

    
    
    
    _Menutableipad.hidden=YES;
    _MenuTable.hidden=YES;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
}
-(void)logoutClicked
{
    
    if([[Reachability sharedReachability] internetConnectionStatus] == NotReachable)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"No Network Connection. Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        //Old_Webservice_Pushpendra:-http://www.polymermis.com/webservice.php
        
        // [self performSelector:@selector(showHUD1:) withObject:@"Please wait..."];
        
        // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_new.php"];
        
        //   polymer test url
      //  NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
        NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        NSString *userNameText=  [[NSUserDefaults standardUserDefaults]valueForKey:@"LoginUserName"];
        NSString *passwordText= [[NSUserDefaults standardUserDefaults] valueForKey:@"LoginUserPassword"];;
        //nslog(@"%@ %@",userNameText,passwordText);
//        [request setPostValue:userNameText forKey:@"userName"];
//        [request setPostValue:passwordText forKey:@"password"];
        NSString *strmember_id=[[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"];
        
        
        
        [request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"] forKey:@"member_id"];
        
        [request setPostValue:@"logout_user" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForLogOut:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailedLogout:)];
        [request startAsynchronous];
    }
    
}

-(void)requestFinishedForLogOut:(ASIHTTPRequest *)request
{
    //[self performSelector:@selector(killHUD1)];
    NSString *responseString = [request responseString];
    //nslog(@"result=%@",responseString);
    if(responseString.length==0 || responseString==nil)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid Username or Password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        NSMutableDictionary *responseDictionary=[[NSMutableDictionary alloc] init];
        
        responseDictionary=[request responseData];
        
        
        NSLog(@"%@",responseDictionary);
        
        
        
        
        //        NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        //        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //
        //
        //        NSLog(@"%@",responseDictionary);
        
        
        //        if(responseDictionary != nil)
        //        {
        //
        //            NSMutableDictionary *tableDictionary=[[responseDictionary objectForKey:@"response"] objectForKey:@"logoutResponse"] ;
        
        
        //            if ([[responseDictionary valueForKey:@"message"]isEqualToString:@"true"])
        //            {
        
        
        
        //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[tableDictionary valueForKey:@"Table"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        //                [alert show];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"User logout successfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        [userDefaults setValue:nil forKey:@"MemberId"];
        [userDefaults setValue:nil forKey:@"email"];
        [userDefaults setValue:nil forKey:@"fullName"];
        [userDefaults setValue:nil forKey:@"member_city"];
        [userDefaults setValue:nil forKey:@"member_comapny"];
        [userDefaults setValue:nil forKey:@"member_country"];
        [userDefaults setValue:nil forKey:@"member_mobile"];
        [userDefaults setValue:nil forKey:@"NewsLetter"];
        [userDefaults setValue:nil forKey:@"News"];
        
        
        [userDefaults setValue:nil forKey:@"member_state"];
        [userDefaults setBool:NO forKey:@"isUserLoggedIn"];
        
        //  LoginScreen *about=[[LoginScreen alloc] init];
        //  [appDelegate.navigationController pushViewController:about animated:NO];
        //     LoginScreen   *nextpage = [[LoginScreen alloc] initWithNibName:@"NextPage" bundle:nil];
        //        LoginScreen *signUp=[[LoginScreen alloc] init];
        //        [self presentViewController:signUp animated:YES completion:^{
        //        }];
        
        //   [self.view addSubview:nextPage.view];
        //  [self:nextPage animated:YES];
        //    id delegate = [[UIApplication sharedApplication] delegate];
        //  [[delegate menu] presentModalViewController:imagePicker animated:YES];
        //        LoginScreen *view = [[LoginScreen alloc] initWithNibName:@"xibNameGoesHere" bundle:nil];
        //        view.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        //        [self presentViewController:view animated:YES completion:nil];
        //   NSString *str = [appDelegate.navigationController.viewControllers objectAtIndex:2] ;
        // self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        //     self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        
        
        
        LoginScreen *contact=[[LoginScreen alloc] init];
        [appDelegate.navigationController pushViewController:contact animated:NO];
        // [appDelegate.navigationController popToViewController:[appDelegate.navigationController.viewControllers objectAtIndex:2] animated:NO];
        //    [self performSelector:@selector(removeAllSubviews)];
        
        
        //
        //            } else
        //
        //            {
        //
        //            }
        //
        //
        //
        
        
        // }
    }
}


-(void)requestFinishedAndFailedLogout: (ASIHTTPRequest *)request
{
    //nslog(@"Failed.");
}





@end

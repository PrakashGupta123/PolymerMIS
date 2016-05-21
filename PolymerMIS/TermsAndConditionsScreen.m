//
//  TermsAndConditionsScreen.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 25/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "TermsAndConditionsScreen.h"
#import "SignUpOrLogin.h"
#import "PolymerMISAppDelegate.h"
#import "LoginScreen.h"
#import "HomeScreenViewController.h"
#import "SignloginCell.h"
#import "PlansScreen.h"
#import "AboutUsScreen.h"
#import "ContactUsScreen.h"
#import "Reachability.h"
#import "SignloginIpadCell.h"

CGSize screenSize;

@interface TermsAndConditionsScreen ()
{
    NSMutableArray *menuArray,*menuArrayimg;
}
@end

@implementation TermsAndConditionsScreen

@synthesize headerLabel,scrollView,buttonAccept,buttonDecline, checkBoxButton, labelIAccept,viewradius,uiviuu,lblAccept;

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
    self.MenutableIpad.hidden=YES;
    self.MenuBtn.tag=0;
    
    menuArray = [[NSMutableArray alloc]initWithObjects:@"Home",@"About Us",@"Plans",@"Contact Us",@"Log out",@"Terms & Conditions",nil];
    
    menuArrayimg = [[NSMutableArray alloc]initWithObjects:@"homemenu",@"about us",@"plans",@"contact us",@"logout",@"icon02.png",nil];
    
    [self.view bringSubviewToFront:self.MenuBtn];

    screenSize=[[UIScreen mainScreen] bounds].size;
    
   uiviuu.layer.cornerRadius = 5.0; // set cornerRadius as you want.
   uiviuu.layer.borderColor = [UIColor whiteColor].CGColor; // set color as you want.
   uiviuu.layer.borderWidth = 1.0; // set borderWidth a
    
    
    
  //  [headerLabel setTextColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
    [buttonAccept setImage:[UIImage imageNamed:@"btnreset"] forState:UIControlStateNormal];
    [lblAccept setText:@"Accept"];
    [buttonAccept setImage:[UIImage imageNamed:@"btnreset"] forState:UIControlStateHighlighted];
    [buttonDecline setImage:[UIImage imageNamed:@"btn_decline_up.png"] forState:UIControlStateNormal];
    [buttonDecline setImage:[UIImage imageNamed:@"btn_decline_down.png"] forState:UIControlStateHighlighted];
    NSString *labelText=@"1.PolymerMIS takes utmost care to provide complete, true, reliable and accurate information from its sources and analysis. However, PolymerMIS is not liable for any errors, omissions, inaccuracies, misinterpretation at user end and incorrect judgment at user end and shall not be responsible for any loss incurring to the user from the usage of information provided on this Application or through the SMS service.\n2.Any information on our Application www.polymermis.com can change without any prior notice or alert to the user.\n3.User agrees to use any of the information either through SMS or from our Application entirely at his/her own risk.\n4.PolymerMIS is not liable for delay in transmission of SMS and does not warrant that delivery of SMS will be instantaneous as and when sent from our systems. There can be delays from your service provider or technical issues through the network which PolymerMIS has no control of.\n5.PolymerMIS does not warrant that the Application will be available uninterrupted or error-free throughout.\n6.PolymerMIS reserves the right, in its sole discretion, to select users and to refuse service or subscription to www.polymermis.com to any person or entity for any reason or for no reason whatsoever.\n7.Forwarding our SMS or part of our SMS to unauthorized users is a violation and any user found doing same will have his account terminated immediately without any notice and no-refund will be credited back.\n8.No content from our Application www.polymermis.com may be reproduced, retransmitted, forwarded to unauthorized users or shared in any form possible without prior written authorization from PolymerMIS. Any user found doing same will have his account terminated immediately without any notice and no refund will be credited back.\n9.PolymerMIS reserves the right to change or add any fees or charges for access or use of www.polymermis.com at any time which would be effective immediately.\n10.Any subscription is non-transferrable and non-refundable in any circumstances.\n11.PolymerMIS may terminate account of any user without any prior notice and/or immediately, who misuses www.polymermis.com or fails to comply with any terms or conditions.\n12.By subscribing to our services the user agrees to abide by all our terms and conditions mentioned in this document.\n13.No user or company or entity or individual who deals in similar business as that of Vista Websoft Pvt. Ltd. or Polymer MIS or is related in any manner similar to our business should subscribe to our services.";
    label=[[OHAttributedLabel alloc] init];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [self.view bringSubviewToFront:self.MenuBtn];
        [self.view bringSubviewToFront:self.MenuTable];
        self.MenuTable.frame = CGRectMake(0, 64, self.view.frame.size.width-160,self.view.frame.size.height+50);
        [label setFrame:CGRectMake(6, 77, 308, 1500)];
        [scrollView setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-70)];
        [scrollView setContentSize:CGSizeMake(320, 1720)];
        [checkBoxButton setFrame:CGRectMake(110, 1614, 25, 25)];
        [labelIAccept setFrame:CGRectMake(140, 1617, 82, 21)];
        [buttonAccept setFrame:CGRectMake(102.5, 1647, 115, 44)];
        [lblAccept setFrame:CGRectMake(132.5, 1652, 100, 30)];
        [lblAccept  setFont:[UIFont fontWithName:@"System" size:17]];
        
        [buttonDecline setFrame:CGRectMake(185, 1600, 115, 44)];
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.MenutableIpad.frame = CGRectMake(0, 64, 225,self.view.frame.size.height+50);

        [self.view bringSubviewToFront:self.MenutableIpad];
        self.MenutableIpad.delegate=self;
        
        self.MenutableIpad.dataSource=self;

        [label setFrame:CGRectMake(20, 170, 728, 680)];
        [scrollView setContentSize:CGSizeMake(768, 960)];
        [checkBoxButton setFrame:CGRectMake(334, 860, 25, 25)];
        [labelIAccept setFrame:CGRectMake(364, 863, 82, 21)];
        [buttonAccept setFrame:CGRectMake(326.5, 890, 115, 44)];
        [buttonDecline setFrame:CGRectMake(434, 890, 115, 44)];
        [lblAccept setFrame:CGRectMake(self.view.frame.size.width / 2-28, 895, 100, 30)];
        [lblAccept  setFont:[UIFont fontWithName:@"System" size:17]];


    }
    [label setFont:[UIFont systemFontOfSize:17]];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [label setText:labelText];
    [label setBackgroundColor:[UIColor clearColor]];
    label.adjustsFontSizeToFitWidth=NO;
    label.linkColor=[UIColor whiteColor];
    label.lineBreakMode=NSLineBreakByWordWrapping;
    [scrollView addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            [scrollView setFrame:CGRectMake(0, 46, screenSize.width, screenSize.height-46-20)];
            [scrollView setContentSize:CGSizeMake(320, 1710)];
            [checkBoxButton setFrame:CGRectMake(110, 1614, 25, 25)];
            [labelIAccept setFrame:CGRectMake(140, 1617, 82, 21)];
            [buttonAccept setFrame:CGRectMake(102.5, 1647, 115, 44)];
            [buttonDecline setFrame:CGRectMake(185, 1600, 115, 44)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [scrollView setFrame:CGRectMake(0, 46, screenSize.height, screenSize.width-46-20)];
            [scrollView setContentSize:CGSizeMake(320, 1100)];
            [checkBoxButton setFrame:CGRectMake(190, 1020, 25, 25)];
            [labelIAccept setFrame:CGRectMake(220, 1020, 82, 21)];
            [buttonAccept setFrame:CGRectMake(182.5, 1050, 115, 44)];
            [buttonDecline setFrame:CGRectMake(290, 1025, 115, 44)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [scrollView setContentSize:CGSizeMake(768, 960)];
            [checkBoxButton setFrame:CGRectMake(334, 860, 25, 25)];
            [labelIAccept setFrame:CGRectMake(364, 863, 82, 21)];
            [buttonAccept setFrame:CGRectMake(326.5, 890, 115, 44)];
            [buttonDecline setFrame:CGRectMake(434, 890, 115, 44)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [scrollView setContentSize:CGSizeMake(1024, 780)];
            [checkBoxButton setFrame:CGRectMake(462, 685, 25, 25)];
            [labelIAccept setFrame:CGRectMake(492, 688, 82, 21)];
            [buttonAccept setFrame:CGRectMake(454.5, 715, 115, 44)];
            [buttonDecline setFrame:CGRectMake(562, 700, 115, 44)];
        }
    }
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
        
        self.MenutableIpad.hidden=NO;
        if (self.MenuBtn.tag==1)
            
        {
            self.MenuBtn.tag=0;
            
            CGRect napkinBottomFrame = self.MenutableIpad.frame;
            napkinBottomFrame.origin.x = -225;
            
            [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ self.MenutableIpad.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
            
            
        }
        else
        {
            self.MenuBtn.tag=1;
            CGRect napkinBottomFrame = self.MenutableIpad.frame;
            napkinBottomFrame.origin.x = 0;
            [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^
             { self.MenutableIpad.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
            
        }
        
        
    }
}

-(IBAction)ActionOnAccept:(id)sender
{
    if(checkBoxButton.tag==1)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"accepted" forKey:@"TermsAndConditions"];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        PolymerMISAppDelegate *appDelegate=(PolymerMISAppDelegate *)[UIApplication sharedApplication].delegate;
//        SignUpOrLogin *signUpOrLogin=[[SignUpOrLogin alloc] init];
//        [appDelegate.navigationController pushViewController:signUpOrLogin animated:NO];
//        LoginScreen *signUpOrLogin=[[LoginScreen alloc] init];
//        [appDelegate.navigationController pushViewController:signUpOrLogin animated:NO];
        HomeScreenViewController *about=[[HomeScreenViewController alloc] init];
        [appDelegate.navigationController pushViewController:about animated:NO];


    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please accept Terms and Conditions." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
}

-(IBAction)ActionOnCheckBox:(id)sender
{
    UIButton *checkButton=(UIButton *)sender;
    if(checkButton.tag==0)
    {
        checkButton.tag=1;
        [checkButton setBackgroundImage:[UIImage imageNamed:@"cheked"] forState:UIControlStateNormal];
    }
    else if(checkButton.tag==1)
    {
        checkButton.tag=0;
        [checkButton setBackgroundImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
    }
}

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
        cell.imagMenu.image=[UIImage imageNamed:[menuArrayimg objectAtIndex:indexPath.row] ];
        cell.labelMenu.text=[menuArray objectAtIndex:indexPath.row];
        // cell.textLabel.text=[menuArray objectAtIndex:indexPath.row];
        cell.labelMenu.textColor=[UIColor whiteColor];
        return cell;
    }
    {
        
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
        
//        HomeScreenViewController *masterViewController = [[HomeScreenViewController alloc] initWithNibName:@"HomeScreenViewController" bundle:nil];
//        
     //   self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        
        HomeScreenViewController *about=[[HomeScreenViewController alloc] init];
        
        NSLog(@"%@",self.navigationController);
        [self.navigationController pushViewController:about animated:NO];
       // [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    
    if (indexPath.row==1) {
        
        AboutUsScreen *about=[[AboutUsScreen alloc] init];
        
        [self.navigationController pushViewController:about animated:NO];
        
        
        
    }
    
    
    
    if (indexPath.row==2) {
        
        PlansScreen *plan=[[PlansScreen alloc] init];
        
        [self.navigationController pushViewController:plan animated:NO];
        
        
        
        
        
        
        
    }
    
    
    
    if (indexPath.row==3) {
        
        ContactUsScreen *contact=[[ContactUsScreen alloc] init];
        
        [self.navigationController pushViewController:contact animated:NO];
        
        
        
    }
    
    
    
    if (indexPath.row==4) {
        
        [self logoutClicked];
        
    }
    
    if (indexPath.row==5)
        
    {
        TermsAndConditionsScreen *contact=[[TermsAndConditionsScreen alloc] init];
        [self.navigationController pushViewController:contact animated:NO];
    }
    
    
    _MenutableIpad.hidden=YES;
    _MenuTable.hidden=YES;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
       // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
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
        
        
        
        LoginScreen *about=[[LoginScreen alloc] init];
        
        [self.navigationController pushViewController:about animated:NO];
        

        
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

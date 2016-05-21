//
//  LoginScreen.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 26/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "LoginScreen.h"
#import "Reachability.h"
#import "ASIFormDataRequest.h"
#import "HomeScreenViewController.h"
#import "SignUpScreen.h"
#import "ContactUsScreen.h"
#import "PolymerMISAppDelegate.h"
CGSize screenSize;

@interface LoginScreen ()<UIAlertViewDelegate,UITextFieldDelegate>
{
BOOL checkBoxSelected;
BOOL chekvalue;
  MenuView *menu;
}

@end

@implementation LoginScreen

@synthesize headerLabel,backButton,textFieldForUsername,textFieldForPassword,buttonLogin,buttonReset,username,password,buttonMenu;

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
       _viewWeb.hidden=YES;
    _viewKill.hidden=YES;
    
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Token Id" message:[[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//    
//    [alert show];
    
    
    self.navigationItem.hidesBackButton = YES;

         screenSize=[[UIScreen mainScreen] bounds].size;

    //[headerLabel setTextColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [backButton setImage:[UIImage imageNamed:@"sidemenu"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"sidemenu"] forState:UIControlStateHighlighted];
        [buttonLogin setImage:[UIImage imageNamed:@"btnsign"] forState:UIControlStateNormal];
        [buttonLogin setTitle:@"SIGN IN" forState:UIControlStateNormal];
        [buttonLogin setImage:[UIImage imageNamed:@"btnsign"] forState:UIControlStateHighlighted];
        [buttonReset setImage:[UIImage imageNamed:@"btnreset"] forState:UIControlStateNormal];
        [buttonReset setTitle:@"RESET" forState:UIControlStateNormal];

        [buttonReset setImage:[UIImage imageNamed:@"btnreset"] forState:UIControlStateHighlighted];
              // self.Chekedbtn addTarget:checkboxSelected: action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
                
        [backButton setBackgroundImage:[UIImage imageNamed:@"sidemenu"] forState:UIControlStateNormal];
        [backButton setBackgroundImage:[UIImage imageNamed:@"sidemenu"] forState:UIControlStateHighlighted];
        [buttonLogin setBackgroundImage:[UIImage imageNamed:@"btnsign"] forState:UIControlStateNormal];
        [buttonLogin setBackgroundImage:[UIImage imageNamed:@"btnsign"] forState:UIControlStateHighlighted];
        [buttonReset setBackgroundImage:[UIImage imageNamed:@"btnreset"] forState:UIControlStateNormal];
        [buttonReset setBackgroundImage:[UIImage imageNamed:@"btnreset"] forState:UIControlStateHighlighted];
    }
    
    [textFieldForUsername setDelegate:self];
    [textFieldForPassword setDelegate:self];
    [buttonMenu setContentMode:UIViewContentModeScaleAspectFill];
    appDelegate=(PolymerMISAppDelegate *)[UIApplication sharedApplication].delegate;
   
    // self.Chekedbtn.imageView.image = [UIImage imageNamed:@"checkbox_ticked.png"];
    //new development
    
//    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn"])
//    {
//        HomeScreenViewController *homeScreen=[[HomeScreenViewController alloc] init];
//        [self.navigationController pushViewController:homeScreen animated:NO];
//    }
}

//-(void)viewDidLayoutSubviews
//{
//    NSString *usernam;
//     NSString *password;
//    
//  username =  textFieldForUsername.text ;
//       password= textFieldForPassword.text ;
//    
//    if ([username isequal:@""]&&[password isEqualToString:@""]) {
//        
//    }
//
//
//}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;

    if([[NSUserDefaults standardUserDefaults]boolForKey:@"remember"])
            {
                NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
                        NSString *user = [def stringForKey:@"USERNAME"];
                
                        NSString *pass = [def stringForKey:@"PASSWORD"];
                checkBoxSelected=YES;
                [def setBool:checkBoxSelected forKey:@"remember"];
                        textFieldForUsername.text = user;
                        textFieldForPassword.text = pass;
                      [self.Chekedbtn setSelected:checkBoxSelected];
                
                        [self.Chekedbtn setBackgroundImage:[UIImage imageNamed:@"checkbox"]
                                                  forState:UIControlStateNormal];
            }else
            {
                NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
                [def setBool:checkBoxSelected forKey:@"remember"];
              
                textFieldForUsername.text = @"";
                textFieldForPassword.text = @"";
                         self.Chekedbtn.selected =NO;
                       [self.Chekedbtn setBackgroundImage:[UIImage imageNamed:@"checkbox"]
                                                  forState:UIControlStateNormal];
            
            }

    if([textFieldForUsername.text length]==0 || [textFieldForPassword.text length]==0)
    {
        
        self.Chekedbtn.hidden=NO;
    }
    else{
        self.Chekedbtn.hidden=YES;
        
    }
    
    UIInterfaceOrientation toInterfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20)];
//            [backButton setFrame:CGRectMake(5, 7, 73, 32)];
//            [username setFrame:CGRectMake(5, 151, 108, 21)];
//            [password setFrame:CGRectMake(5, 212, 108, 21)];
//            [textFieldForUsername setFrame:CGRectMake(124, 147, 186, 30)];
//            [textFieldForPassword setFrame:CGRectMake(124, 208, 186, 30)];
//            [buttonLogin setFrame:CGRectMake(44, 278, 105, 44)];
//            [buttonReset setFrame:CGRectMake(171, 278, 105, 44)];
            [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];
//            [backButton setFrame:CGRectMake(5, 0, 73, 32)];
//            [username setFrame:CGRectMake(80, 121, 108, 21)];
//            [password setFrame:CGRectMake(80, 182, 108, 21)];
//            [textFieldForUsername setFrame:CGRectMake(199, 117, 186, 30)];
//            [textFieldForPassword setFrame:CGRectMake(199, 178, 186, 30)];
//            [buttonLogin setFrame:CGRectMake(124, 228, 105, 44)];
//            [buttonReset setFrame:CGRectMake(251, 228, 105, 44)];
            [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
           // [backButton setFrame:CGRectMake(20, 21, 28 , 22)];
            [buttonMenu setFrame:CGRectMake((768-buttonMenu.frame.size.width)/2, 1004-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            //[backButton setFrame:CGRectMake(20, 0, 75, 35)];
            [buttonMenu setFrame:CGRectMake((1024-buttonMenu.frame.size.width)/2, 748-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
    }
    
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
            [self.view setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20)];
//            [backButton setFrame:CGRectMake(5, 7, 73, 32)];
//            [username setFrame:CGRectMake(5, 151, 108, 21)];
//            [password setFrame:CGRectMake(5, 212, 108, 21)];
//            [textFieldForUsername setFrame:CGRectMake(124, 147, 186, 30)];
//            [textFieldForPassword setFrame:CGRectMake(124, 208, 186, 30)];
//            [buttonLogin setFrame:CGRectMake(44, 278, 105, 44)];
//            [buttonReset setFrame:CGRectMake(171, 278, 105, 44)];
            if(appDelegate.isMenuViewPresented)
            {
                [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height-menu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
            else
            {
                [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
            
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];
//            [backButton setFrame:CGRectMake(5, 0, 73, 32)];
//            [username setFrame:CGRectMake(80, 121, 108, 21)];
//            [password setFrame:CGRectMake(80, 182, 108, 21)];
//            [textFieldForUsername setFrame:CGRectMake(199, 117, 186, 30)];
//            [textFieldForPassword setFrame:CGRectMake(199, 178, 186, 30)];
//            [buttonLogin setFrame:CGRectMake(124, 228, 105, 44)];
//            [buttonReset setFrame:CGRectMake(251, 228, 105, 44)];
            if(appDelegate.isMenuViewPresented)
            {
                [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height-menu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
            else
            {
                [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
            }
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [backButton setFrame:CGRectMake(20, 15, 34, 34)];
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
            [backButton setFrame:CGRectMake(20, 0, 75, 35)];
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

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        UIInterfaceOrientation toInterfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, -100, screenSize.height, 400)];
        }
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if([textFieldForUsername.text length]==0 || [textFieldForPassword.text length]==0)
    {
       self.Chekedbtn.hidden=NO;
        
    }
  //
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:_txtKillPwd])
    {
        
        [_txtKillPwd resignFirstResponder];
    }
    
    if([textField isEqual:textFieldForUsername])
    {
       
        [textFieldForPassword becomeFirstResponder];
    }
    
    else if([textField isEqual:textFieldForPassword])
    {
       
        [textFieldForPassword resignFirstResponder];
        UIInterfaceOrientation toInterfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, 300)];
        }
    }
    return YES;
}

#pragma mark - Custom Methods
//-(void)checkboxSelected:(id)sender
//{
//    checkBoxSelected = !checkboxSelected; /* Toggle */
//    [checkbox setSelected:checkboxSelected];
//}
-(IBAction)btnContactus:(id)sender
{
    
    //  [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"no
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"normalcontact"];

        ContactUsScreen *homeScreen= [[ContactUsScreen alloc] initWithNibName:@"ContactUsScreen~ipad" bundle:nil];
        [self presentViewController:homeScreen animated:YES completion:nil];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"normalcontact"];

        ContactUsScreen *homeScreen= [[ContactUsScreen alloc] initWithNibName:@"ContactUsScreen" bundle:nil];
        [self presentViewController:homeScreen animated:YES completion:nil];
    }
    
    
    //    ContactUsScreen *homeScreen=[[ContactUsScreen alloc] init];
    //    [self.navigationController pushViewController:homeScreen animated:NO];
    //    [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"normalcontact"];
    
}
-(void)killSession
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
        
        NSString *strDeviceToken =   [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
        
        if (strDeviceToken == nil)
        {
            strDeviceToken =@"0f4f0cf4fcdfcb5732a95f10cb6ce445bfdbfa65c7f57254b4706014f7bd7bd2";
        }
        
        
        //nslog(@"%@ %@",userNameText,passwordText);
        
        NSString *strn=  [[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"];
        [request setPostValue:strn forKey:@"member_id"];
        
        [request setPostValue:strDeviceToken forKey:@"device_token"];

        NSString *passwordText= _txtKillPwd.text;;
        //nslog(@"%@ %@",userNameText,passwordText);
        [request setPostValue:passwordText forKey:@"member_password"];
        //[request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"] forKey:@"member_id"];
        [request setPostValue:@"ios" forKey:@"device_type"];
        [request setPostValue:@"kill_session" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedKillSession:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailedKillSession:)];
        [request startAsynchronous];
    }


}
         
-(void)requestFinishedKillSession:(ASIHTTPRequest *)request
        {
            //[self performSelector:@selector(killHUD1)];
            NSString *responseString = [request responseString];
            NSLog(@"result=%@",responseString);
            if(responseString.length==0 || responseString==nil)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid Username or Password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else
            {
                  NSMutableDictionary *responseDictionary=[NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:nil];
                
                NSLog(@"%@",responseDictionary);
                
                NSString *str=[[[[responseDictionary valueForKey:@"response"] valueForKey:@"loginResponse"] valueForKey:@"Table"] valueForKey:@"msg"];

                NSString *new=[responseDictionary valueForKey:@"error"];
                NSInteger myInt = [new intValue];

                if (myInt==1 || ![new isEqualToString:@""]) {
                    
                  NSString *str=  [[responseDictionary valueForKey:@"response"] valueForKey:@"msg"];
                    if (str == nil) {
                        
                        str = new;
                    }
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:str delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [alert show];
                }
                else if([str isEqualToString:@"Login successfully"])
                {
                    if(responseDictionary != nil)
                    {
                        NSMutableDictionary *tableDictionary=[[[responseDictionary objectForKey:@"response"] objectForKey:@"loginResponse"] objectForKey:@"Table"];
                        
                        if([[tableDictionary objectForKey:@"msg"] length] < 106)
                        {
                            NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_id"] forKey:@"MemberId"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"email"] forKey:@"email"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"fullName"] forKey:@"fullName"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_city "] forKey:@"member_city"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_comapny "] forKey:@"member_comapny"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_country "] forKey:@"member_country"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_mobile "] forKey:@"member_mobile"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_state "] forKey:@"member_state"];
                            [userDefaults setBool:YES forKey:@"isUserLoggedIn"];
                            
                            [userDefaults setBool:checkBoxSelected forKey:@"remember"];
                            [userDefaults synchronize];
                            //  [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
                            
                            //    if(checkBoxSelected == YES)
                            //   {
                            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                            NSString* textField1Text = textFieldForUsername.text;
                            [defaults setObject:textField1Text forKey:@"USERNAME"];
                            
                            NSString *textField2Text = textFieldForPassword.text;
                            [defaults setObject:textField2Text forKey:@"PASSWORD"];
                            [defaults synchronize];
                            //    }else{
                            
                            //checkBoxSelected=NO;
                            //   }
                            
                            HomeScreenViewController *homeScreen=[[HomeScreenViewController alloc] init];
                            [self.navigationController pushViewController:homeScreen animated:NO];
                        }
                    }
                    else
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Server Error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
            }
                
                else{
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [alert show];

                
                }
                
                
            }
        
        }

-(void)requestFinishedAndFailedKillSession: (ASIHTTPRequest *)request
        {
            //nslog(@"Failed.");
        }
         
-(void)logout

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
        [request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"] forKey:@"member_id"];
        
        [request setPostValue:@"logout_user" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForLogOut2:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailedLogout2:)];
        [request startAsynchronous];
    }
}
//-(void)requestFinishedForLogOut2:(ASIHTTPRequest *)request
//{
//    //[self performSelector:@selector(killHUD1)];
//    NSString *responseString = [request responseString];
//    //nslog(@"result=%@",responseString);
//    if(responseString.length==0 || responseString==nil)
//    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid Username or Password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//        [alert show];
//    }
//    else
//    {
//        NSMutableDictionary *responseDictionary=[[NSMutableDictionary alloc] init];
//        
//        responseDictionary=[request responseData];
//        
//        
//        NSLog(@"%@",responseDictionary);
//        
//        
//        
//        
//        //        NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
//        //        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        //
//        //
//        //        NSLog(@"%@",responseDictionary);
//        
//        
//        //        if(responseDictionary != nil)
//        //        {
//        //
//        //            NSMutableDictionary *tableDictionary=[[responseDictionary objectForKey:@"response"] objectForKey:@"logoutResponse"] ;
//        
//        
//        //            if ([[responseDictionary valueForKey:@"message"]isEqualToString:@"true"])
//        //            {
//        
//        
//        
//        //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[tableDictionary valueForKey:@"Table"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        //                [alert show];
//        //
//        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"User logout successfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        //        [alert show];
//        
//        
//        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
//        [userDefaults setValue:nil forKey:@"MemberId"];
//        [userDefaults setValue:nil forKey:@"email"];
//        [userDefaults setValue:nil forKey:@"fullName"];
//        [userDefaults setValue:nil forKey:@"member_city"];
//        [userDefaults setValue:nil forKey:@"member_comapny"];
//        [userDefaults setValue:nil forKey:@"member_country"];
//        [userDefaults setValue:nil forKey:@"member_mobile"];
//        [userDefaults setValue:nil forKey:@"NewsLetter"];
//        [userDefaults setValue:nil forKey:@"News"];
//        
//        
//        [userDefaults setValue:nil forKey:@"member_state"];
//        [userDefaults setBool:NO forKey:@"isUserLoggedIn"];
//        LoginScreen *contact=[[LoginScreen alloc] init];
//        [appDelegate.navigationController pushViewController:contact animated:NO];
//        //        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
////        self.window.backgroundColor = [UIColor whiteColor];
////        //LoginScreen *splash=[[LoginScreen alloc] init];
////        SignUpOrLogin *splash=[[SignUpOrLogin alloc] init];
////        navigationController=[[UINavigationController alloc] initWithRootViewController:splash];
////        [window setRootViewController:navigationController];
////        [self.window makeKeyAndVisible];
//        //  [appDelegate.navigationController popToViewController:[appDelegate.navigationController.viewControllers objectAtIndex:2] animated:NO];
//        //  [self performSelector:@selector(removeAllSubviews)];
//        
//        
//        //
//        //            } else
//        //
//        //            {
//        //
//        //            }
//        //
//        //
//        //
//        
//        
//        // }
//    }
//}

- (IBAction)RemembermeAction:(id)sender

{
    checkBoxSelected = !checkBoxSelected;
    
    
    [self.Chekedbtn setSelected:checkBoxSelected];
    
    
    self.Chekedbtn.adjustsImageWhenHighlighted=YES;
  
    if([textFieldForUsername.text length]==0 || [textFieldForPassword.text length]==0)
   
    {
        self.Chekedbtn.hidden=NO;
        
        if(checkBoxSelected == YES)
            
        {
            
            checkBoxSelected =YES;
            [self.Chekedbtn setBackgroundImage:[UIImage imageNamed:@"checkbox1.png"]
                                      forState:UIControlStateNormal];
            
            
            [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
            
            //        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            //        NSString* textField1Text = textFieldForUsername.text;
            //        [defaults setObject:textField1Text forKey:@"USERNAME"];
            //
            //        NSString *textField2Text = textFieldForPassword.text;
            //        [defaults setObject:textField2Text forKey:@"PASSWORD"];
            //        [defaults synchronize];
        }
        
        else
            
        {
            
            
            checkBoxSelected=NO;
            
            [self.Chekedbtn setBackgroundImage:[UIImage imageNamed:@"checkbox.png"]
                                      forState:UIControlStateNormal];
            
            
            [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
        }
        

        
        
    }
    
    else
    
    {
        
        self.Chekedbtn.hidden=NO;
        
        if(checkBoxSelected == YES)
      
        {
            
            checkBoxSelected =YES;
            [self.Chekedbtn setBackgroundImage:[UIImage imageNamed:@"checkbox1.png"]
                                      forState:UIControlStateNormal];
            

            [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
            
            //        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            //        NSString* textField1Text = textFieldForUsername.text;
            //        [defaults setObject:textField1Text forKey:@"USERNAME"];
            //
            //        NSString *textField2Text = textFieldForPassword.text;
            //        [defaults setObject:textField2Text forKey:@"PASSWORD"];
            //        [defaults synchronize];
        }
        
        else
        
        {
            
            
            checkBoxSelected=NO;
            
            [self.Chekedbtn setBackgroundImage:[UIImage imageNamed:@"checkbox.png"]
                                      forState:UIControlStateNormal];
            
            
            [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
        }

        
    }

    //  [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
    

   
}



-(IBAction)actionOnBackButton:(id)sender
{
    //[self.navigationController popViewControllerAnimated:NO];
}

-(IBAction)actionOnLoginButton:(id)sender
{
  // PolymerMISAppDelegate *appDelegate=(PolymerMISAppDelegate *)[[UIApplication sharedApplication]delegate];
    if (appDelegate.IsUpadte == NO )
    {
        
    
    

    if([textFieldForUsername.text length]==0 || [textFieldForPassword.text length]==0)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"All fields are mandatory." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else if(![self validateEmailWithString:textFieldForUsername.text])
    {
        
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter valid email ID." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        
    }
    else
    {
        [self performSelector:@selector(callWebService)];
    }
}
    else
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Update PolymerMis App" message:@"PolymerMIS has introduced some cool features. Please download the updated app for the improved experience and save money." delegate:self cancelButtonTitle:@"Go to App Store" otherButtonTitles:nil];
        alertView.tag=102;
        [alertView show];
       

    
    }
//   HomeScreenViewController *homeScreen=[[HomeScreenViewController alloc] init];
//  [self.navigationController pushViewController:homeScreen animated:NO];
}
-(void) httpPostWithCustomDelegate{}
//{
//    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
//    
//    NSURL * url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
//    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
//    
//    
//    NSString *userNameText=textFieldForUsername.text;
//    NSString *passwordText=textFieldForPassword.text;
//    [[NSUserDefaults standardUserDefaults] setValue:userNameText forKey:@"LoginUserName"];
//    [[NSUserDefaults standardUserDefaults] setValue:passwordText forKey:@"LoginUserPassword"];
//    
//    NSString *strDeviceToken =   [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
//    
//    if (strDeviceToken == nil)
//    {
//        strDeviceToken =@"9de6967f758cad9f17fb70eca9f8cc906d977d281a91647c1a6ec1c3b20184f6";
//    }
//    
//    
//    //nslog(@"%@ %@",userNameText,passwordText);
//    [request setPostValue:userNameText forKey:@"userName"];
//    [request setPostValue:passwordText forKey:@"password"];
//    
//    [request setPostValue:strDeviceToken forKey:@"device_token"];
//    [request setPostValue:@"ios" forKey:@"added_by"];
//    //[request setPostValue:@"" forKey:@"app_version"];
//    
//    
//    //[request setPostValue:@"login_webuser" forKey:@"methodName"];
//    [request setPostValue:@"login_webuser" forKey:@"methodName"];
//    
//    
//   
//    NSDictionary *params =[[NSDictionary alloc]initWithObjectsAndKeys: @"ios",@"added_by", strDeviceToken,@"device_token",passwordText,@"password",@"login_webuser",@"methodName",nil];
//    
//    
//    
//    [urlRequest setHTTPMethod:@"POST"];
//    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
//                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                           NSLog(@"Response:%@ %@\n", response, error);
//                                                           if(error == nil)
//                                                           {
//                                                               NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
//                                                               NSLog(@"Data = %@",text);
//                                                           }
//                                                           
//                                                       }];
//    [dataTask resume];
//    
//}

-(void)callWebService
{
    if([[Reachability sharedReachability] internetConnectionStatus] == NotReachable)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"No Network Connection. Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        http://www.polymermis.com/webservice_new.php
        //Old_Webservice_Pushpendra:-http://www.polymermis.com/webservice.php
        
        [self performSelector:@selector(showHUD:) withObject:@"Please wait..."];
       // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_new.php"];
        
        //http://www.polymermis.com/webservice.php

        
        //polymer test url
       // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
       NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        

        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        NSString *userNameText=textFieldForUsername.text;
        NSString *passwordText=textFieldForPassword.text;
        [[NSUserDefaults standardUserDefaults] setValue:userNameText forKey:@"LoginUserName"];
        [[NSUserDefaults standardUserDefaults] setValue:passwordText forKey:@"LoginUserPassword"];
        
    NSString *strDeviceToken =   [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];

        if (strDeviceToken == nil)
        {
            strDeviceToken =@"9de6967f758cad9f17fb70eca9f8cc906d977d281a91647c1a6ec1c3b20184f6";
        }
        NSString * currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        [request setPostValue:currentVersion forKey:@"app_version"];

        //nslog(@"%@ %@",userNameText,passwordText);
        [request setPostValue:userNameText forKey:@"userName"];
        [request setPostValue:passwordText forKey:@"password"];
        
        [request setPostValue:strDeviceToken forKey:@"device_token"];
        [request setPostValue:@"ios" forKey:@"added_by"];
        //[request setPostValue:@"" forKey:@"app_version"];


        //[request setPostValue:@"login_webuser" forKey:@"methodName"];
        [request setPostValue:@"login_webuser" forKey:@"methodName"];

        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForSignIn:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailed:)];
        [request startAsynchronous];
    }
}

- (void) connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
             forAuthenticationChallenge:challenge];
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void) connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    if([[protectionSpace authenticationMethod] isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
    }
}
-(void)WebService
{
    if([[Reachability sharedReachability] internetConnectionStatus] == NotReachable)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"No Network Connection. Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
    http://www.polymermis.com/webservice_new.php
        //Old_Webservice_Pushpendra:-http://www.polymermis.com/webservice.php
        
        [self performSelector:@selector(showHUD:) withObject:@"Please wait..."];
        // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_new.php"];
        
        //http://www.polymermis.com/webservice.php
        
        
        //polymer test url
        NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/phpinfo.php"];
        
        // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        
        
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        //[request setPostValue:@"ios" forKey:@"device_type"];
               [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForccc:)];
        [request setDidFailSelector:@selector(requestFinishedAndccc:)];
        [request startAsynchronous];
    }
}


-(void)requestFinishedForccc:(ASIHTTPRequest *)request
{
    [self performSelector:@selector(killHUD)];
    NSString *responseString = [request responseString];
    //nslog(@"result=%@",responseString);
    if(responseString.length==0 || responseString==nil)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid Username or Password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        NSError *error=nil;
        NSMutableDictionary *responseDictionary=[NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:&error];
        
        
        NSLog(@"%@",responseDictionary);
        

    }
}
-(IBAction)actionOnResetButton:(id)sender
{
    [textFieldForUsername setText:@""];
    [textFieldForPassword setText:@""];
    self.Chekedbtn.hidden=NO;
}

- (void) killHUD
{
    if(aHUD != nil )
    {
        [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
        [aHUD setUserInteractionEnabledForSuperview:self.view];
        [aHUD.loadingView removeFromSuperview];
        aHUD = nil;
        [self.view setUserInteractionEnabled:YES];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}

- (void) showHUD:(NSString *)text
{
    if(aHUD == nil)
    {
        aHUD = [[HudView alloc]init];
        [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
        [aHUD loadingViewInView:self.view text:text];
        [self.view setUserInteractionEnabled:NO];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}

- (BOOL)validateEmailWithString:(NSString*)email1
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email1];
}
-(IBAction)btnNewUser:(id)sender
{
    SignUpScreen *signUp=[[SignUpScreen alloc] init];
    [self presentViewController:signUp animated:YES completion:^{
    }];

}

-(IBAction)showMenu:(id)sender
{
    menu=[[MenuView alloc] initWithLoginFlag:NO inClass:self];
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

#pragma mark - ASIHTTPRequestDelegate Methods

-(void)requestFinishedForSignIn:(ASIHTTPRequest *)request
{
    [self performSelector:@selector(killHUD)];
    NSString *responseString = [request responseString];
    //nslog(@"result=%@",responseString);
    if(responseString.length==0 || responseString==nil)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid Username or Password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        NSError *error=nil;
        NSMutableDictionary *responseDictionary=[NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:&error];
        
        
        
        
        NSString *text = [[NSString alloc] initWithData:[request responseData]encoding:NSUTF8StringEncoding];
        NSLog(@"Response: %@", text);
        
        NSDictionary *dcict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:nil];
        
        
//        NSData *jsonData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
//        
////        NSData *requestData = [NSData dataWithBytes:[request UTF8String] length:[request length]];
//        
//        NSString *jsonString = [[NSString alloc] initWithData:jsonData  encoding:NSUTF8StringEncoding];
     //   NSDictionary *jsonDict = [jsonString JSONValue];
        ///harsh
        NSLog(@"%@",responseDictionary);
        
        NSString *str2=[responseDictionary valueForKey:@"error"] ;

        if (!str2) {
            
            
             NSString *str2=[responseDictionary valueForKey:@"status"] ;
            
            NSInteger myInt = [str2 intValue];

            
            
            if(str2==nil)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            else if(myInt==0)
            {
                
            UIAlertView *alertnew = [[UIAlertView alloc] initWithTitle:@"Alert" message:str2 delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
                alertnew.tag=101;
            [alertnew show];
            }
            else
            {
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:str2 delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [alert show];
            }

        }
        
        else if([str2 isEqualToString:@"Please Install new build !"])
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:str2 delegate:self cancelButtonTitle:@"Go to App Store" otherButtonTitles:nil, nil];
            alert.tag=501;
            [alert show];
        }
        
    

    
        else  {
            
        NSString *str=[[[[responseDictionary valueForKey:@"response"] valueForKey:@"loginResponse"] valueForKey:@"Table"] valueForKey:@"msg"];
           
                
                if ([str isEqualToString:@"Already logged in with other device. Click ok to kill your session!."]) {
                    
                
                
                NSString *str1=[[[[responseDictionary valueForKey:@"response"] valueForKey:@"loginResponse" ]  valueForKey:@"Table" ] valueForKey:@"msg"];
                NSString *strmemberid = [[[[responseDictionary valueForKey:@"response"] valueForKey:@"loginResponse" ]  valueForKey:@"Table" ] valueForKey:@"member_id"];
                
                
                [[NSUserDefaults standardUserDefaults ] setValue:strmemberid forKey:@"MemberId"];
       // [NSUserDefaults userDefaults setValue:strmemberid forKey:@"MemberId"];
                
                UIAlertView *alertnew = [[UIAlertView alloc] initWithTitle:@"Alert" message:str1 delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
                alertnew.tag=101;
                [alertnew show];

                
            }
            
                else if([str isEqualToString:@"Login successfully"])
                
                
                
                {
                    
                    
                    if(responseDictionary != nil)
                    {
                        NSMutableDictionary *tableDictionary=[[[responseDictionary objectForKey:@"response"] objectForKey:@"loginResponse"] objectForKey:@"Table"];
                        
                        if([[tableDictionary objectForKey:@"msg"] length] < 106)
                        {
                            NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_id"] forKey:@"MemberId"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"email"] forKey:@"email"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"fullName"] forKey:@"fullName"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_city "] forKey:@"member_city"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_comapny "] forKey:@"member_comapny"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_country "] forKey:@"member_country"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_mobile "] forKey:@"member_mobile"];
                            [userDefaults setValue:[tableDictionary objectForKey:@"member_state "] forKey:@"member_state"];
                            [userDefaults setBool:YES forKey:@"isUserLoggedIn"];
                            
                            [userDefaults setBool:checkBoxSelected forKey:@"remember"];
                            [userDefaults synchronize];
                            //  [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
                            
                            //    if(checkBoxSelected == YES)
                            //   {
                            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                            NSString* textField1Text = textFieldForUsername.text;
                            [defaults setObject:textField1Text forKey:@"USERNAME"];
                            
                            NSString *textField2Text = textFieldForPassword.text;
                            [defaults setObject:textField2Text forKey:@"PASSWORD"];
                            [defaults synchronize];
                            //    }else{
                            
                            //checkBoxSelected=NO;
                            //   }
                            
                            HomeScreenViewController *homeScreen=[[HomeScreenViewController alloc] init];
                            [self.navigationController pushViewController:homeScreen animated:NO];
                        }
                    }
                    else
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Server Error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
                }
            
            
            
            
         else if ([str isEqualToString:@""]||[str isEqual:[NSNull null]]||str==nil) {
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:str delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
             [alert show];
             
        
        }
            
            else
                
            {
               
                
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:str delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
               // [self logout];

            }
            
            
            
        }
        
        if (!str2) {
            
        
        if(responseDictionary != nil)
        {
            NSMutableDictionary *tableDictionary=[[[responseDictionary objectForKey:@"response"] objectForKey:@"loginResponse"] objectForKey:@"Table"];
            
            if([[tableDictionary objectForKey:@"msg"] length] < 6)
            {
                NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
                [userDefaults setValue:[tableDictionary objectForKey:@"MemberId"] forKey:@"MemberId"];
                [userDefaults setValue:[tableDictionary objectForKey:@"email"] forKey:@"email"];
                [userDefaults setValue:[tableDictionary objectForKey:@"fullName"] forKey:@"fullName"];
                [userDefaults setValue:[tableDictionary objectForKey:@"member_city "] forKey:@"member_city"];
                [userDefaults setValue:[tableDictionary objectForKey:@"member_comapny "] forKey:@"member_comapny"];
                [userDefaults setValue:[tableDictionary objectForKey:@"member_country "] forKey:@"member_country"];
                [userDefaults setValue:[tableDictionary objectForKey:@"member_mobile "] forKey:@"member_mobile"];
                [userDefaults setValue:[tableDictionary objectForKey:@"member_state "] forKey:@"member_state"];
                [userDefaults setBool:YES forKey:@"isUserLoggedIn"];
              
                [userDefaults setBool:checkBoxSelected forKey:@"remember"];
                  [userDefaults synchronize];
              //  [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];

            //    if(checkBoxSelected == YES)
             //   {
                    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                    NSString* textField1Text = textFieldForUsername.text;
                    [defaults setObject:textField1Text forKey:@"USERNAME"];
                    
                    NSString *textField2Text = textFieldForPassword.text;
                    [defaults setObject:textField2Text forKey:@"PASSWORD"];
                    [defaults synchronize];
            //    }else{
                    
                    //checkBoxSelected=NO;
             //   }

                HomeScreenViewController *homeScreen=[[HomeScreenViewController alloc] init];
                [self.navigationController pushViewController:homeScreen animated:NO];
            }
        }
        else
        {
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter valid UserName or Password!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//            [alert show];
        }
    }
        
        else
        {

        }
        
    }
}

-(void)requestFinishedAndFailed: (ASIHTTPRequest *)request
{
    [self performSelector:@selector(killHUD)];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag == 101)
    {
    
    if(buttonIndex == 0)//OK button pressed
    {
        _viewKill.hidden=NO;
        //do something
    }
    else if(buttonIndex == 1)//Annul button pressed.
    {
        //do something
    }
    }else if
        (alertView.tag==102)
    {
        if(buttonIndex == 0)//OK button pressed
        {
            
          //  [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
            NSString *urlStr =[NSString stringWithFormat:@"%@", @"https://itunes.apple.com/in/app/polymermis/id690529163?mt=8"];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];

        }

    
    }
    else if
        (alertView.tag==501)
    {
        if(buttonIndex == 0)//OK button pressed
        {
            NSString *urlStr =[NSString stringWithFormat:@"%@", @"https://itunes.apple.com/in/app/polymermis/id690529163?mt=8"];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];

            
           // [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        }

    
    }



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
- (IBAction)btnVisit:(id)sender

{
    //_viewKill.hidden=NO;
    _viewWeb.hidden=NO;
    
    NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    

}

- (IBAction)btnKillSession:(id)sender {
    
    if([_txtKillPwd.text length]==0)
    {
    
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
            [alert show];
        _viewKill.hidden=NO;

        return;
    }
    else
    {
        [self killSession];
    }
    
    
    
}
- (IBAction)btnBack:(id)sender
{
    _viewWeb.hidden=YES;

}
@end

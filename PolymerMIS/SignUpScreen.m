//
//  SignUpScreen.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 26/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "SignUpScreen.h"
#import "Reachability.h"
#import "LoginScreen.h"
#import "ContactUsScreen.h"

CGSize screenSize;

@interface SignUpScreen ()

@end

@implementation SignUpScreen
@synthesize headerLabel, backButton, textFieldCity, textFieldCompanyName, textFieldCountry, textFieldEmail, textFieldFullName,textFieldMobileNumber, textFieldState, buttonReset, buttonSignUp, scrollView, buttonMenu;

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

    screenSize=[[UIScreen mainScreen] bounds].size;

   // [headerLabel setTextColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [backButton setImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateHighlighted];
        [buttonSignUp setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [buttonSignUp setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [buttonReset setImage:[UIImage imageNamed:@"btn_reset_up.png"] forState:UIControlStateNormal];
        [buttonReset setImage:[UIImage imageNamed:@"btn_reset_down.png"] forState:UIControlStateHighlighted];
        [scrollView setContentSize:CGSizeMake(320, 400)];

    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateHighlighted];
        [buttonSignUp setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [buttonSignUp setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [buttonReset setBackgroundImage:[UIImage imageNamed:@"btn_reset_up.png"] forState:UIControlStateNormal];
        [buttonReset setBackgroundImage:[UIImage imageNamed:@"btn_reset_down.png"] forState:UIControlStateHighlighted];
        [scrollView setContentSize:CGSizeMake(768, 856)];
    }
    
    [textFieldFullName setDelegate:self];
    [textFieldCompanyName setDelegate:self];
    [textFieldMobileNumber setDelegate:self];
    [textFieldCity setDelegate:self];
    [textFieldState setDelegate:self];
    [textFieldCountry setDelegate:self];
    [textFieldEmail setDelegate:self];
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
            [scrollView setFrame:CGRectMake(0, 102, screenSize.width, screenSize.height-102-20)];
            [scrollView setContentSize:CGSizeMake(320, screenSize.height-60)];
            [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];
            [scrollView setFrame:CGRectMake(0, 102, screenSize.height, screenSize.width-102-20)];
            [scrollView setContentSize:CGSizeMake(320, 400)];
            [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            //[backButton setFrame:CGRectMake(20, 6, 75, 35)];
            [buttonMenu setFrame:CGRectMake((768-buttonMenu.frame.size.width)/2, 1004-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
           // [backButton setFrame:CGRectMake(20, 0, 75, 35)];
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
            [scrollView setFrame:CGRectMake(0, 102, screenSize.width, screenSize.height-102-20)];
            [scrollView setContentSize:CGSizeMake(320, screenSize.height-60)];
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
            [scrollView setFrame:CGRectMake(0, 102, screenSize.height, screenSize.width-102-20)];
            [scrollView setContentSize:CGSizeMake(320, 400)];
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
            [backButton setFrame:CGRectMake(20, 6, 75, 35)];
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
    if(tempTextField!=nil)
    {
        [self performSelector:@selector(adjustScrollViewContentOffset)];
    }
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            if([textField isEqual:textFieldMobileNumber])
            {
                CGPoint bottomOffset = CGPointMake(0, 60);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldCity])
            {
                CGPoint bottomOffset = CGPointMake(0, 120);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldCountry])
            {
                CGPoint bottomOffset = CGPointMake(0, 160);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldEmail])
            {
                CGPoint bottomOffset = CGPointMake(0, 210);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }

            
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            if([textField isEqual:textFieldFullName])
            {
                CGPoint bottomOffset = CGPointMake(0, 20);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldCompanyName])
            {
                CGPoint bottomOffset = CGPointMake(0, 65);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldMobileNumber])
            {
                CGPoint bottomOffset = CGPointMake(0, 110);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldState])
            {
                CGPoint bottomOffset = CGPointMake(0, 155);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldCity])
            {
                CGPoint bottomOffset = CGPointMake(0, 200);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldCountry])
            {
                CGPoint bottomOffset = CGPointMake(0, 245);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([textField isEqual:textFieldEmail])
            {
                CGPoint bottomOffset = CGPointMake(0, 290);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }

        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            
        }
    }

    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    tempTextField=textField;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    tempTextField=nil;
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
    if([textField isEqual:textFieldFullName])
    {
        [textFieldCompanyName becomeFirstResponder];
    }
    else if([textField isEqual:textFieldCompanyName])
    {
        [textFieldMobileNumber becomeFirstResponder];
    }
    else if([textField isEqual:textFieldMobileNumber])
    {
        [textFieldState becomeFirstResponder];
    }
    else if([textField isEqual:textFieldState])
    {
        [textFieldCity becomeFirstResponder];
    }
    else if([textField isEqual:textFieldCity])
    {
        [textFieldCountry becomeFirstResponder];
    }
    else if([textField isEqual:textFieldCountry])
    {
        [textFieldEmail becomeFirstResponder];
    }
    else if([textField isEqual:textFieldEmail])
    {
        [textFieldEmail resignFirstResponder];
    }
    return YES;
}


#pragma mark - Custom Methods
-(IBAction)btnContactus:(id)sender
{
    
   //  [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"no
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"normalcontact"];

        ContactUsScreen *homeScreen= [[ContactUsScreen alloc] initWithNibName:@"ContactUsScreen~ipad" bundle:nil];
        NSLog(@"%@",self.navigationController);
   
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
-(IBAction)actionOnBackButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

-(IBAction)actionOnResetButton:(id)sender
{
    [textFieldFullName setText:@""];
    [textFieldCompanyName setText:@""];
    [textFieldMobileNumber setText:@""];
    [textFieldCity setText:@""];
    [textFieldState setText:@""];
    [textFieldCountry setText:@""];
    [textFieldEmail setText:@""];

}

-(IBAction)actionOnSignUpButton:(id)sender
{
    if([textFieldFullName.text length]==0 || [textFieldMobileNumber.text length]==0 || [textFieldEmail.text length]==0)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"All fields are mandatory." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else if(![self validateEmailWithString:textFieldEmail.text])
    {
        
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter valid email ID." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        
    }
    else if(!([textFieldMobileNumber.text length]==10))
    {
        
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a valid mobile number." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        
    }
    else if(![self validatePhoneNumberWithString:textFieldMobileNumber.text])
    {
        
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a valid mobile number." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        
    }
    else
    {
        [self performSelector:@selector(callWebService)];
    }
}

-(void)callWebService
{
    if([[Reachability sharedReachability] internetConnectionStatus] == NotReachable)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"No Network Connection. Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        
        [self performSelector:@selector(showHUD:) withObject:@"Please wait..."];
        //   polymer test url
      //  NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
     NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        
        NSString *fullName=textFieldFullName.text;
        NSString *companyName=textFieldCompanyName.text;
        NSString *mobileNumber=textFieldMobileNumber.text;
        NSString *state=textFieldState.text;
        NSString *city=textFieldCity.text;
        NSString *country=textFieldCountry.text;
        NSString *email=textFieldEmail.text;
        
        NSString *deviceToken = [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
        
        if (deviceToken == nil)
        {
            deviceToken =@"0f4f0cf4fcdfcb5732a95f10cb6ce445bfdbfa65c7f57254b4706014f7bd7bd2";
        }
        
        
        [request setPostValue:deviceToken forKey:@"device_token"];
        [request setPostValue:fullName forKey:@"fullName"];
        [request setPostValue:companyName forKey:@"companyName"];
        [request setPostValue:mobileNumber forKey:@"mobileNo"];
        [request setPostValue:state forKey:@"state"];
        [request setPostValue:city forKey:@"city"];
        [request setPostValue:country forKey:@"country"];
        [request setPostValue:email forKey:@"email"];
        [request setPostValue:@"ws_add_user" forKey:@"methodName"];
        
        [request setPostValue:deviceToken forKey:@"device_token"];
        [request setPostValue:@"ios" forKey:@"added_by"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForSignUp:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailed:)];
        [request startAsynchronous];
    }
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
- (BOOL)validatePhoneNumberWithString:(NSString*)num
{
    NSString *number = @"^(0|[1-9][0-9]*)$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    return [numberTest evaluateWithObject:num];
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

-(void)adjustScrollViewContentOffset
{
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            if([tempTextField isEqual:textFieldMobileNumber])
            {
                CGPoint bottomOffset = CGPointMake(0, 60);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldCity])
            {
                CGPoint bottomOffset = CGPointMake(0, 120);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldCountry])
            {
                CGPoint bottomOffset = CGPointMake(0, 160);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldEmail])
            {
                CGPoint bottomOffset = CGPointMake(0, 210);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            
            
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            if([tempTextField isEqual:textFieldFullName])
            {
                CGPoint bottomOffset = CGPointMake(0, 20);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldCompanyName])
            {
                CGPoint bottomOffset = CGPointMake(0, 65);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldMobileNumber])
            {
                CGPoint bottomOffset = CGPointMake(0, 110);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldState])
            {
                CGPoint bottomOffset = CGPointMake(0, 155);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldCity])
            {
                CGPoint bottomOffset = CGPointMake(0, 200);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldCountry])
            {
                CGPoint bottomOffset = CGPointMake(0, 245);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            else if([tempTextField isEqual:textFieldEmail])
            {
                CGPoint bottomOffset = CGPointMake(0, 290);
                [self.scrollView setContentOffset:bottomOffset animated:YES];
            }
            
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            
        }
    }
    

}


#pragma mark - ASIHTTPRequestDelegate Methods

-(void)requestFinishedForSignUp:(ASIHTTPRequest *)request
{
    [self performSelector:@selector(killHUD)];
    NSString *responseString = [request responseString];
    if(responseString.length==0 || responseString==nil)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Server error, Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        @try {
            NSError *error=nil;
            NSMutableDictionary *responseDictionary=[NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:&error];
            NSMutableDictionary *tableDictionary=[[[responseDictionary objectForKey:@"response"] objectForKey:@"adduserResponse"] objectForKey:@"Table"];
            
            
           NSString  *strMessage= [tableDictionary valueForKey:@"msg"];
            {
                
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:strMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
                
            }
            if ([strMessage isEqualToString:@"You have already taken trial once now please contact our team."])
            {
                [self dismissViewControllerAnimated:YES completion:^{
                }];

            }
            
            id memberId=[tableDictionary objectForKey:@"Member_id"];
            if([memberId isKindOfClass:[NSArray class]])
            {
                NSArray *memberID=(NSArray *)memberId;
                if(memberID.count>0)
                {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Your password has been mailed on your Email Id." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    alert.tag=101;
                    [alert show];
                }
                else
                {
                    NSString *emailError=[tableDictionary objectForKey:@"email"];
                    NSString *mobileError=[tableDictionary objectForKey:@"mobile"];
                    NSString *countryError=[tableDictionary objectForKey:@"country"];
                    if(emailError.length>0)
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:emailError delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
                    else if(mobileError.length>0)
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:mobileError delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
                    else if(countryError.length>0)
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:countryError delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
                }

            }
            
            else if([memberId isKindOfClass:[NSString class]])
            {
                NSString *memberID=(NSString *)memberId;
                if(memberID.length>0)
                {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Your password has been mailed on your Email Id." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    alert.tag=101;
                    [alert show];
                }
                else
                {
                    NSString *emailError=[tableDictionary objectForKey:@"email"];
                    NSString *mobileError=[tableDictionary objectForKey:@"mobile"];
                    NSString *countryError=[tableDictionary objectForKey:@"country"];
                    if(emailError.length>0)
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:emailError delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
                    else if(mobileError.length>0)
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:mobileError delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
                    else if(countryError.length>0)
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:countryError delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }
                }
                
            }
            
        }
        @catch (NSException *exception) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Server error, Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        @finally {
            
        }
        
    }
}

-(void)requestFinishedAndFailed: (ASIHTTPRequest *)request
{

}

#pragma mark - UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==101)
    {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        LoginScreen *login=[[LoginScreen alloc] init];
        PolymerMISAppDelegate *appDelegate1=(PolymerMISAppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate1.navigationController pushViewController:login animated:NO];
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


@end

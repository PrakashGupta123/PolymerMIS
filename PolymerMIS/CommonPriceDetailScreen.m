//
//  CommonPriceDetailScreen.m
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "CommonPriceDetailScreen.h"
#import "Reachability.h"
#import "IndianAndFeedPriceCell.h"
#import "InternationalPriceCell.h"
#import "SignloginCell.h"
#import "SignloginIpadCell.h"
#import "HomeScreenViewController.h"
#import "PlansScreen.h"
#import "AboutUsScreen.h"
#import "ContactUsScreen.h"
#import "LoginScreen.h"
#import  "TermsAndConditionsScreen.h"

CGSize screenSize;

@interface CommonPriceDetailScreen ()
{
    NSMutableArray *menuArray,*menuArrayimg;

}
@end

@implementation CommonPriceDetailScreen

@synthesize headerLabel, backButton, homeButton, label1, label2, label3, tableViewForPrices, dictionayForCredential, buttonMenu;
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
    [self.viewIpad.layer setBorderColor:[UIColor blackColor].CGColor ];
    [self.viewIpad.layer setBorderWidth:1.0f];
    
    
    menuArray = [[NSMutableArray alloc]initWithObjects:@"Home",@"About Us",@"Plans",@"Contact Us",@"Log out",@"Terms & Conditions",nil];
    
    menuArrayimg = [[NSMutableArray alloc]initWithObjects:@"homemenu",@"about us",@"plans",@"contact us",@"logout",@"icon02.png",nil];
    
    [self.view bringSubviewToFront:self.MenuBtn];
    screenSize=[[UIScreen mainScreen] bounds].size;

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
        
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.Menutableipad.frame = CGRectMake(0, 64, 225,self.view.frame.size.height+50);

        CGRect napkinBottomFrame = self.Menutableipad.frame;
        napkinBottomFrame.origin.x = -225;
         [self.view bringSubviewToFront:self.Menutableipad];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_up.png"] forState:UIControlStateNormal];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_down.png"] forState:UIControlStateHighlighted];
        
    }
    
  //  [tableViewForPrices setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1]];
    tableViewForPrices.delegate=self;
    tableViewForPrices.dataSource=self;
    //[tableViewForPrices setSeparatorColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bdr.png"]]];
    priceArray=[[NSMutableArray alloc] init];
    if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"indianPrice"])
    {
        
        [headerLabel setText:[dictionayForCredential objectForKey:@"cityName"]];
        [label1 setText:@"Grade"];
        [label2 setText:@"Price"];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
        [label2 setFrame:CGRectMake(175, label2.frame.origin.y, label2.frame.size.width, label2.frame.size.height)];
            
              [_label11 setFrame:CGRectMake(165, _label11.frame.origin.y, _label11.frame.size.width, _label11.frame.size.height)];

            
            
        }else
        {
        
        [label2 setFrame:CGRectMake(495, label2.frame.origin.y, label2.frame.size.width, label2.frame.size.height)];
            [_label11 setFrame:CGRectMake(185, _label11.frame.origin.y, _label11.frame.size.width, _label11.frame.size.height)];

        }
       // [label3 setFrame:CGRectMake(475, label3.frame.origin.y, label3.frame.size.width, label3.frame.size.height)];
        
      
        [_label33 setFrame:CGRectMake(245, _label11.frame.origin.y, _label33.frame.size.width, _label11.frame.size.height)];
       
        [_labelipad11 setFrame:CGRectMake(475, _label11.frame.origin.y, _labelipad11.frame.size.width, _labelipad11.frame.size.height)];
        [_labelipad33 setFrame:CGRectMake(635, _label11.frame.origin.y, _labelipad33.frame.size.width, _labelipad11.frame.size.height)];
        
        label3.hidden=YES;
        _labelipad22.hidden=YES;
        _label22.hidden=YES;
        [_label4 setText:@"Date"];
        [self performSelector:@selector(callWebServiceForIndianPrice)];
    }
    else if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"internationalPrice"])
    {
        [headerLabel setText:[dictionayForCredential objectForKey:@"countryName"]];
        [label1 setText:@"Port"];
        [label2 setText:@"Grade"];
        [label3 setText:@"Price"];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            [label1 setFrame:CGRectMake(10, label1.frame.origin.y, 200, label1.frame.size.height)];
        }
        else
        {
         [label1 setFrame:CGRectMake(20, label1.frame.origin.y, 200, label1.frame.size.height)];
        }
         [_label11 setFrame:CGRectMake(85, _label11.frame.origin.y, _label11.frame.size.width, _label11.frame.size.height)];
        [_label33 setFrame:CGRectMake(245, _label11.frame.origin.y, _label33.frame.size.width, _label11.frame.size.height)];
        
        
        [_labelipad33 setFrame:CGRectMake(635, _label11.frame.origin.y, _labelipad33.frame.size.width, _labelipad11.frame.size.height)];
        
        [self performSelector:@selector(callWebServiceForInternationalPrice)];
    }
    else if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"feedstockPrice"])
    {
        [headerLabel setText:@"Feedstock Prices"];
        [label1 setText:@"Name"];
        label2.hidden=YES;
        
        label3.hidden=YES;
        _label22.hidden=YES;
        _labelipad22.hidden=YES;
        _labelipad11.hidden=YES;

        _label11.hidden=YES;
[_label33 setFrame:CGRectMake(245, _label11.frame.origin.y, _label33.frame.size.width, _label11.frame.size.height)];
         [_labelipad33 setFrame:CGRectMake(635, _label11.frame.origin.y, _labelipad33.frame.size.width, _labelipad11.frame.size.height)];

        [_label4 setText:@"Price"];
        
        [self performSelector:@selector(callWebServiceForFeedstockPrice)];
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
            //[scrlView setFrame:CGRectMake(40, 130, 240, 295)];
//            [backButton setFrame:CGRectMake(5, 7, 73, 32)];
//            [homeButton setFrame:CGRectMake(242, 7, 73, 32)];
            [tableViewForPrices reloadData];
            [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];
            //[scrlView setFrame:CGRectMake(120, 100, 240, 200)];
//            [backButton setFrame:CGRectMake(5, 0, 73, 32)];
//            [homeButton setFrame:CGRectMake(400, 0, 73, 32)];
            [tableViewForPrices reloadData];
            [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
           // [backButton setFrame:CGRectMake(20, 6, 75, 35)];
            [homeButton setFrame:CGRectMake(673, 6, 75, 35)];
            [buttonMenu setFrame:CGRectMake((768-buttonMenu.frame.size.width)/2, 1004-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
           // [backButton setFrame:CGRectMake(20, 0, 75, 35)];
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
//            [backButton setFrame:CGRectMake(5, 7, 73, 32)];
//            [homeButton setFrame:CGRectMake(242, 7, 73, 32)];
            [tableViewForPrices reloadData];
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
//            [homeButton setFrame:CGRectMake(400, 0, 73, 32)];
            [tableViewForPrices reloadData];
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
           // [backButton setFrame:CGRectMake(20, 0, 75, 35)];
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


#pragma mark - ASIHTTPRequestDelegate Methods

-(void)requestFinishedForPrices:(ASIHTTPRequest *)request
{
    [self performSelector:@selector(killHUD)];
    NSString *responseString = [request responseString];
    //nslog(@"result=%@",responseString);
    if(responseString.length==0 || responseString==nil)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Server error, Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        NSError *error=nil;
        NSMutableDictionary *responseDictionary=[NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:&error];
       
        NSLog(@"%@",responseDictionary);
        // nslog(@"%@",responseDictionary);
          NSString *str5=[responseDictionary valueForKey:@"error"];
        
        if ([str5 isEqualToString:@"You are already logged in with other device."]) {
            
            NSString *str=[[responseDictionary valueForKey:@"response"]valueForKey:@"msg"];
         
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:str delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            alert.tag=101;
            [alert show];
            LoginScreen *contact=[[LoginScreen alloc] init];
            [appDelegate.navigationController pushViewController:contact animated:NO];

            
            
        }
        else if ([str5 isEqualToString:@"Please Install new build !"])
            
        {
            
            
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Install new build !" delegate:self cancelButtonTitle:@"Go to App store." otherButtonTitles: nil];
            
            alert.tag=501;
            
            [alert show];
            
            
        
            
        }
        else{
        if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"indianPrice"])
        {
            if([[[[responseDictionary objectForKey:@"response"] objectForKey:@"cityPriceResponse"] objectForKey:@"Table"] isKindOfClass:[NSArray class]])
            {
                priceArray=[[[responseDictionary objectForKey:@"response"] objectForKey:@"cityPriceResponse"] objectForKey:@"Table"];
            }
            else
            {
               [[[UIAlertView alloc] initWithTitle:@"Alert" message:[[[responseDictionary objectForKey:@"response"] objectForKey:@"cityPriceResponse"] objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
           
            
        }
        else if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"internationalPrice"])
        {
            if([[[[responseDictionary objectForKey:@"response"] objectForKey:@"cityinternationalResponse"] objectForKey:@"Table"] isKindOfClass:[NSArray class]])
            {
                priceArray=[[[responseDictionary objectForKey:@"response"] objectForKey:@"cityinternationalResponse"] objectForKey:@"Table"];
            }
            else
            {
                [[[UIAlertView alloc] initWithTitle:@"Alert" message:[[[responseDictionary objectForKey:@"response"] objectForKey:@"cityinternationalResponse"] objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
            
            
        }
        else if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"feedstockPrice"])
        {
            if([[[[responseDictionary objectForKey:@"response"] objectForKey:@"feedstockResponse"] objectForKey:@"Table"] isKindOfClass:[NSArray class]])
            {
                priceArray=[[[responseDictionary objectForKey:@"response"] objectForKey:@"feedstockResponse"] objectForKey:@"Table"];
            }
            else
            {
               [[[UIAlertView alloc] initWithTitle:@"Alert" message:[[[responseDictionary objectForKey:@"response"] objectForKey:@"feedstockResponse"] objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
        }
        [tableViewForPrices reloadData];
//        [self performSelector: @selector(adjustTableHeight)];
    }
    }
}

-(void)requestFinishedAndFailed: (ASIHTTPRequest *)request
{
    //nslog(@"Failed.");
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


-(void)callWebServiceForIndianPrice
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
       // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
        NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        NSString *strMemberId =  [userDefaults valueForKey:@"MemberId"];
        [request setPostValue:strMemberId forKey:@"userId"];
        NSString *strDeviceToken =   [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
    
        if (strDeviceToken == nil)
            
        {
        strDeviceToken =@"0f4f0cf4fcdfcb5732a95f10cb6ce445bfdbfa65c7f57254b4706014f7bd7bd2";
        }
        [request setPostValue:strDeviceToken forKey:@"device_token"];
        [request setPostValue:@"ios" forKey:@"device_type"];
        
        NSString * currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        
        [request setPostValue:currentVersion forKey:@"app_version"];
         [request setPostValue:@"web_get_city_price" forKey:@"methodName"];
        [request setPostValue:[dictionayForCredential objectForKey:@"cityName"] forKey:@"city_name"];
        
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForPrices:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailed:)];
        [request startAsynchronous];
    }
}

-(void)callWebServiceForInternationalPrice
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
       // NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
        NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        NSString *strMemberId =  [userDefaults valueForKey:@"MemberId"];
        [request setPostValue:strMemberId forKey:@"userId"];
        
         NSString *strDeviceToken =   [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
        
    if (strDeviceToken == nil)
                                      
    {
                                          
    strDeviceToken =@"0f4f0cf4fcdfcb5732a95f10cb6ce445bfdbfa65c7f57254b4706014f7bd7bd2";
                                          
        }
                                      
    [request setPostValue:strDeviceToken forKey:@"device_token"];
                                      
    [request setPostValue:@"ios" forKey:@"device_type"];
                                      
                                      
                                      
        NSString * currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        
        [request setPostValue:currentVersion forKey:@"app_version"];
        
        [request setPostValue:[dictionayForCredential objectForKey:@"countryTag"] forKey:@"countryName"];
        [request setPostValue:@"web_get_international_price" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForPrices:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailed:)];
        [request startAsynchronous];
    }
}

-(void)callWebServiceForFeedstockPrice
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
        
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        NSString *str =  [userDefaults valueForKey:@"MemberId"];
        [request setPostValue:str forKey:@"userId"];
        
        NSString *strDeviceToken =   [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
        
        if (strDeviceToken == nil)
            
        {
            
            strDeviceToken =@"0f4f0cf4fcdfcb5732a95f10cb6ce445bfdbfa65c7f57254b4706014f7bd7bd2";
            
        }
        
        [request setPostValue:strDeviceToken forKey:@"device_token"];
        
        [request setPostValue:@"ios" forKey:@"device_type"];
        
        NSString * currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        
        [request setPostValue:currentVersion forKey:@"app_version"];
        
        [request setPostValue:@"web_get_feedstock_price" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForPrices:)];
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

-(IBAction)actionOnBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(IBAction)actionOnHomeButton:(id)sender
{
    if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"indianPrice"] || [[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"internationalPrice"])
    {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count]-4)] animated:NO];
    }
    else if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"feedstockPrice"])
    {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count]-3)] animated:NO];
    }
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


//-(void)adjustTableHeight
//{
//    CGRect rect=[tableViewForPrices rectForFooterInSection:0];
//    [tableViewForPrices setBounds:CGRectMake(0, 0, 310, rect.origin.y)];
//}

#pragma mark - UITableViewDelegate Methods


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tableViewForPrices) {
        
    }
    else
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
    
    if (indexPath.row==4)
    {
        [self logoutClicked];
    }
    
    if (indexPath.row==5)
        
    {
        TermsAndConditionsScreen *contact=[[TermsAndConditionsScreen alloc] init];
        [appDelegate.navigationController pushViewController:contact animated:NO];
    }

    
}

    _Menutableipad.hidden=YES;
    _MenuTable.hidden=YES;
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



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  
    if (tableView==tableViewForPrices)
    {

      CGFloat height=40.0;
        
    if (priceArray.count!=0)
    
    {
        
    
    if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"internationalPrice"])
    {
        CGSize maxSize=CGSizeMake(80, 9999);
        CGSize size=[[[priceArray objectAtIndex:indexPath.row]objectForKey:@"port_name"] sizeWithFont:[UIFont boldSystemFontOfSize:12] constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
        height = size.height+10;
    }
    
        return height;
    }
    else
    {
        return height;
    }
      }
else if (tableView==_Menutableipad)
{
    return 72;
}
    else
    {
        return 40;
    }
}


- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
    
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView ==self.MenuTable) {
        return [menuArray count];
    }else if (tableView==self.Menutableipad)
    {
        return [menuArray count];
    }else
{
return [priceArray count];
}

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.MenuTable) {
        
        SignloginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignloginCell"];
        if (cell == nil)
        
        {
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
    
    else if (tableView==self.Menutableipad)
    
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
    
    else
    
    {
    
        UITableViewCell *commonCell=nil;
        
    if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"indianPrice"])
    
    {
        
        static NSString *cellIdentifier=nil;
        
        IndianAndFeedPriceCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(cell==nil)
            
        {
            cell=[[IndianAndFeedPriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
        }
        [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
        [cell.contentView.layer setBorderWidth:1.0f];
        
        [cell.firstLabel setText:[[priceArray objectAtIndex:indexPath.row]objectForKey:@"grade"]];
        
        NSString *stringSearch = [NSString stringWithFormat:@"%@",[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price"]];
        NSString *stringURL = [NSString stringWithFormat:@"%@",@"₹"];
        NSString *combined = [NSString stringWithFormat:@"%@%@", stringURL, stringSearch];
        

        [cell.secondLabel setText:combined];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
        [cell.thirdLabel setFrame:CGRectMake(255, 10, screenSize.width-200-20, 20) ];
        }

        [cell.thirdLabel setText:[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price_date"]];
        
  
        
        
        NSString *strimg;
        
        
        strimg=[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price_status"];
        
        
        if ([strimg isEqualToString:@"1"])
            
        {
            cell.shoeimg.image = [UIImage imageNamed:@"green"];
        }
        
        else if([strimg isEqualToString:@"0"])
            
        {
            cell.shoeimg.image = [UIImage imageNamed:@"red"];
            
        } else if([strimg isEqualToString:@"2"])
            
        {
          
            cell.shoeimg.image = [UIImage imageNamed:@"orange-circle"];
           
            
        }

        
        [cell setBackgroundColor:[UIColor clearColor]];
        
        
        commonCell=cell;
        
    }
    
    
    
    else if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"internationalPrice"])
    {
        
        static NSString *cellIdentifier=nil;
        InternationalPriceCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell==nil)
            
        {
            cell=[[InternationalPriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
        }
        
        [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
        [cell.contentView.layer setBorderWidth:1.0f];

        [cell.firstLabel setText:[[priceArray objectAtIndex:indexPath.row]objectForKey:@"port_name"]];
        
        [cell.secondLabel setText:[[priceArray objectAtIndex:indexPath.row]objectForKey:@"grade"]];
        //[cell.fourthLabel setText:@"(21/10/2015)"];
        
         [cell.fourthLabel setText:[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price_date"]];
        
        
   // cell.shoeimg.image = [UIImage imageNamed:@"green-15x15.png"];

        
       
        
        NSString *strimg;
        
        
        strimg=[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price_status"];
        
        
        if ([strimg isEqualToString:@"1"])
        
        {
            cell.shoeimg.image = [UIImage imageNamed:@"green"];
        }
        
        else if([strimg isEqualToString:@"0"])
            
        {
            cell.shoeimg.image = [UIImage imageNamed:@"red"];
            
        }
        else if([strimg isEqualToString:@"2"])
            
        {
            cell.shoeimg.image = [UIImage imageNamed:@"orange-circle"];
            
        }

     
        
        if([[dictionayForCredential objectForKey:@"countryTag"] isEqualToString:@"India"])
       
        {
            NSString *stringSearch = [NSString stringWithFormat:@"%@",[[priceArray objectAtIndex:indexPath.row]objectForKey:@"high"]];
            NSString *stringURL = [NSString stringWithFormat:@"%@",@"$"];
            NSString *combined = [NSString stringWithFormat:@"%@%@", stringURL, stringSearch];
            
            [cell.thirdLabel setText:combined];
        }
        
        else
        {
            NSString *stringSearch = [NSString stringWithFormat:@"%@",[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price"]];
            NSString *stringURL = [NSString stringWithFormat:@"%@",@"$"];
            NSString *combined = [NSString stringWithFormat:@"%@%@", stringURL, stringSearch];

            [cell.thirdLabel setText:combined];
        }
        [cell setBackgroundColor:[UIColor clearColor]];
        commonCell=cell;
        
    }
    
    
    else if([[dictionayForCredential objectForKey:@"priceType"] isEqualToString:@"feedstockPrice"])
    {
    
        static NSString *cellIdentifier=nil;
        IndianAndFeedPriceCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell==nil)
            
        {
            cell=[[IndianAndFeedPriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
        }
        
        [cell.firstLabel setText:[[priceArray objectAtIndex:indexPath.row]objectForKey:@"feedstock_name"]];
      
        NSString *stringSearch = [NSString stringWithFormat:@"%@",[[priceArray objectAtIndex:indexPath.row]objectForKey:@"feedstock_price"]];
        NSString *stringURL = [NSString stringWithFormat:@"%@",@"$"];
        NSString *combined = [NSString stringWithFormat:@"%@%@", stringURL, stringSearch];

        
        [cell.thirdLabel setText:combined];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            

        [cell.thirdLabel setFrame:CGRectMake(255, 10, 50, 20) ];
        }
        [cell.firstLabel11 setHidden:YES];
        [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
        [cell.contentView.layer setBorderWidth:1.0f];

        
         [cell setBackgroundColor:[UIColor clearColor]];
        
        
       // cell.shoeimg11.image = [UIImage imageNamed:@"green-15x15.png"];

        
        
        NSString *strimg;
        
        
        strimg=[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price_status"];
        
        
        if ([strimg isEqualToString:@"1"])
            
        {
            cell.shoeimg11.image = [UIImage imageNamed:@"green"];
        }
        
        else if([strimg isEqualToString:@"0"])
            
        {
            cell.shoeimg11.image = [UIImage imageNamed:@"red"];
            
        }
        else if([strimg isEqualToString:@"2"])
            
        {
            cell.shoeimg11.image = [UIImage imageNamed:@"orange-circle"];
            
        }


        
        
        
        
        
        
       
        
        //[cell.thirdLabel setText:@"(21/10/2015)"];
        /// [cell.thirdLabel setText:[[priceArray objectAtIndex:indexPath.row]objectForKey:@"price_date"]];

        commonCell=cell;
        
    }
    
    return commonCell;
}

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex              {
    if(alertView.tag==501){
        
        if(buttonIndex == 0)//OK button pressed
        {
            NSString *urlStr =[NSString stringWithFormat:@"%@", @"https://itunes.apple.com/in/app/polymermis/id690529163?mt=8"];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
           // [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        }
        else if(buttonIndex == 1)//Annul button pressed.
        {
            //do something
        }
    
    }
}


@end

//
//  NewsCategoryDetails.m
//  PolymerMIS
//
//  Created by sanchay on 3/2/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "NewsCategoryDetails.h"
#import "Reachability.h"
#import "NewsCategoryDetailCell.h"
#import "NewsDetail.h"
#import "NewsLetterDetail.h"
#import "SignloginCell.h"
#import "SignloginIpadCell.h"
#import "HomeScreenViewController.h"
#import "LoginScreen.h"
#import "PlansScreen.h"
#import  "TermsAndConditionsScreen.h"
#import "AboutUsScreen.h"

#import "ContactUsScreen.h"


CGSize screenSize;

@interface NewsCategoryDetails ()
{

    NSMutableArray *menuArray,*menuArrayimg;
}
@end

@implementation NewsCategoryDetails

@synthesize headerLabel, backButton, homeButton, tableViewForDetail, categoryID, categoryName, buttonMenu;

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
   
    menuArray = [[NSMutableArray alloc]initWithObjects:@"Home",@"About Us",@"Plans",@"Contact Us",@"Log out",@"Terms & Conditions",nil];
    
    menuArrayimg = [[NSMutableArray alloc]initWithObjects:@"homemenu",@"about us",@"plans",@"contact us",@"logout",@"icon02.png",nil];
    
    
    screenSize=[[UIScreen mainScreen] bounds].size;

  //  [headerLabel setTextColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
    [headerLabel setText:categoryName];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
         [self.view bringSubviewToFront:self.MenuTable];
         self.MenuTable.frame = CGRectMake(0, 64, self.view.frame.size.width-160,self.view.frame.size.height+40);
        [backButton setImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [homeButton setImage:[UIImage imageNamed:@"btn_home_up.png"] forState:UIControlStateNormal];
        [homeButton setImage:[UIImage imageNamed:@"btn_home_down.png"] forState:UIControlStateHighlighted];
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.Menutableipad.frame = CGRectMake(0, 64, 225,self.view.frame.size.height+50);

        [self.view bringSubviewToFront:self.Menutableipad];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_up.png"] forState:UIControlStateNormal];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_down.png"] forState:UIControlStateHighlighted];
    }
    
    pageIndex=0;
    tableViewForDetail.delegate=self;
    tableViewForDetail.dataSource=self;
   // [tableViewForDetail setSeparatorColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bdr.png"]]];
    newsArray=[[NSMutableArray alloc] init];
    view=[[PullUpView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [self performSelector:@selector(callWebService1)];
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
//            [backButton setFrame:CGRectMake(5, 7, 73, 32)];
//            [homeButton setFrame:CGRectMake(242, 7, 73, 32)];
            [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];
//            [backButton setFrame:CGRectMake(5, 0, 73, 32)];
//            [homeButton setFrame:CGRectMake(400, 0, 73, 32)];
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
            //[backButton setFrame:CGRectMake(20, 0, 75, 35)];
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

-(void)callWebService1
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
        [request setPostValue:categoryID forKey:@"categoryId"];
        [request setPostValue:categoryName forKey:@"categoryName"];
        [request setPostValue:[NSString stringWithFormat:@"%d",pageIndex] forKey:@"tabIndex"];
        NSString *strMemberId =  [[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"];
        [request setPostValue:strMemberId forKey:@"member_id"];
        
        NSString *strDeviceToken =   [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
        
        if (strDeviceToken == nil)
            
        {
            
            strDeviceToken =@"0f4f0cf4fcdfcb5732a95f10cb6ce445bfdbfa65c7f57254b4706014f7bd7bd2";
            
        }
        
        [request setPostValue:strDeviceToken forKey:@"device_token"];
        
        [request setPostValue:@"ios" forKey:@"device_type"];
        
        NSString * currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        
        [request setPostValue:currentVersion forKey:@"app_version"];

        [request setPostValue:@"web_get_news" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForNewsDetail1:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailed1:)];
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
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count]-3)] animated:NO];
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

#pragma mark - ASIHTTPRequestDelegate Methods

-(void)requestFinishedForNewsDetail1:(ASIHTTPRequest *)request
{
    [self performSelector:@selector(killHUD)];
    NSString *responseString = [request responseString];
    temporaryNewsArray=[[NSMutableArray alloc] init];
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
        //nslog(@"%@",responseDictionary);
        
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
        
        if([[[[responseDictionary objectForKey:@"response"] objectForKey:@"newsResponse"] objectForKey:@"Table"] isKindOfClass:[NSArray class]])
        {
            temporaryNewsArray=[[[responseDictionary objectForKey:@"response"] objectForKey:@"newsResponse"] objectForKey:@"Table"];
            NSString *dateString=nil;
            for(int i=0;i<[temporaryNewsArray count];i++)
            {
                NSString *title=[[temporaryNewsArray objectAtIndex:i] objectForKey:@"title"];
                if([title isKindOfClass:[NSNull class]])
                {
                    title=@"Title";
                    [[temporaryNewsArray objectAtIndex:i]setObject:title forKey:@"title"];
                }
                else
                {
                    [[temporaryNewsArray objectAtIndex:i]setObject:[title stringByReplacingOccurrencesOfString:@"\r\n" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [title length])] forKey:@"title"];
                }
                dateString=[[[[temporaryNewsArray objectAtIndex:i] objectForKey:@"news_date"] componentsSeparatedByString:@" "] objectAtIndex:0];
                [[temporaryNewsArray objectAtIndex:i]setObject:dateString forKey:@"news_date"];
                
            }
            
            [newsArray addObjectsFromArray:temporaryNewsArray];
            if ([newsArray count]==0) {
                
            }else
            {
            [tableViewForDetail reloadData];
            }
            view.labelForText.hidden=NO;
            view.activityIndicator.hidden=YES;
            [view.activityIndicator stopAnimating];
            tableViewForDetail.tableFooterView=view;
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"No more news found." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
            view.labelForText.hidden=NO;
            view.activityIndicator.hidden=YES;
            [view.activityIndicator stopAnimating];
        }
    }
    }
}

-(void)requestFinishedAndFailed1: (ASIHTTPRequest *)request
{
    //nslog(@"Failed.");
}

#pragma mark - UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_MenuTable)
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
             return 40.0;
        }
        else
        {
            return 72.0;
        }
       
    }
    if (newsArray.count !=0)
    {
        
   
    CGSize maxSize=CGSizeMake(260, 9999);
    CGSize size=[[[newsArray objectAtIndex:indexPath.row]objectForKey:@"title"] sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
        
    return (size.height+53);
    }
    else
     {
      return (53);
      }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_MenuTable]||[tableView isEqual:_Menutableipad])
    
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

        
        
        
    }
    
else


{
    
//    newsurl=[[newsArray objectAtIndex:indexPath.row] objectForKey:@"news_url"];
//    
//    if ([[[newsArray objectAtIndex:indexPath.row] objectForKey:@"news_url"]isEqualToString:@""]) {
//        

        NewsDetail *newsDetailScreen=[[NewsDetail alloc] init];
        
        
        newsDetailScreen.dictionary=[newsArray objectAtIndex:indexPath.row];
        [self .navigationController pushViewController:newsDetailScreen animated:NO];
//    }
//    else{
//        NewsLetterDetail *detail=[[NewsLetterDetail alloc] init];
//        detail.newsletterURL=newsurl;
//        
//        NSString *newsDate=[[[[newsArray objectAtIndex:indexPath.row] objectForKey:@"news_date"] componentsSeparatedByString:@" "] objectAtIndex:0];
//        
//        detail.newsDate=newsDate;
//        
//        //[NSString stringWithFormat:@"http://www.polymermis.com/files/category_file/%@",[[newsArray objectAtIndex:indexPath.row] objectForKey:@"news_url"]];
//           [self.navigationController pushViewController:detail animated:NO];
//    
//    }
    
   
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


#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:tableViewForDetail]
        ) {
        return [newsArray count];
    }
    else{
    return [menuArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    else if (tableView==self.Menutableipad) {
        
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
    static NSString *cellIdentifier=nil;
    NewsCategoryDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell=[[NewsCategoryDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
            [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
            [cell.contentView.layer setBorderWidth:1.0f];
    [cell.labelForNewsContent setText:[[newsArray objectAtIndex:indexPath.row]objectForKey:@"title"]];
    [cell.labelForDate setText:[[newsArray objectAtIndex:indexPath.row]objectForKey:@"news_date"]];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
        }

}
#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if(scrollView.isDragging)
    {
//        //nslog(@"%f",scrollView.contentSize.height-scrollView.bounds.size.height);
        if(scrollView.contentOffset.y>=(scrollView.contentSize.height-scrollView.bounds.size.height+20))
        {
            
            [view.labelForText setText:@"Processing"];
        
        }
        else
        {
            
            [view.labelForText setText:@"Pull up to Load More"];
            
        }
    }
    else
    {
        [view.labelForText setText:@"Pull up to Load More"];
        
    }

    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if(scrollView.contentOffset.y>=(scrollView.contentSize.height-scrollView.bounds.size.height+20))
    {
        view.labelForText.hidden=YES;
        view.activityIndicator.hidden=NO;
        [view.activityIndicator startAnimating];
        pageIndex+=10;
        
        
        [self performSelector:@selector(callWebService1)];
        
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex              {
    if(alertView.tag==501){
        
        if(buttonIndex == 0)//OK button pressed
        {
            NSString *urlStr =[NSString stringWithFormat:@"%@", @"https://itunes.apple.com/in/app/polymermis/id690529163?mt=8"];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
            //[[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        }
        else if(buttonIndex == 1)//Annul button pressed.
        {
            //do something
        }
        
    }
}

@end

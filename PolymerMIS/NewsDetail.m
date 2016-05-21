//
//  NewsDetail.m
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "NewsDetail.h"
#import "SignloginCell.h"
#import "SignloginIpadCell.h"
#import "HomeScreenViewController.h"
#import  "TermsAndConditionsScreen.h"
#import "PlansScreen.h"
#import "Reachability.h"
#import "AboutUsScreen.h"
#import "LoginScreen.h"
#import "ContactUsScreen.h"



CGSize screenSize;

@interface NewsDetail ()
{

  UIView* loadingView;
    NSString*newsdate ;
    NSMutableArray *menuArray,*menuArrayimg;
}
@end

@implementation NewsDetail

@synthesize headerLabel, backButton, homeButton, scrollView, labelForNewsDate, labelForNewsTitle, webView, dictionary, buttonMenu;

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

    [self.view bringSubviewToFront:self.MenuBtn];

  //  appDelegate=(PolymerMISAppDelegate *)[UIApplication sharedApplication].delegate;
    loadingView.hidden=YES;
  newsdate = @"";
    screenSize=[[UIScreen mainScreen] bounds].size;

  //  [headerLabel setTextColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
    
    [scrollView setContentSize:CGSizeMake(320, 460)];
    //nslog(@"%@",dictionary);
    [labelForNewsTitle setText:[dictionary objectForKey:@"title"]];
    [labelForNewsDate setText:[dictionary objectForKey:@"news_date"]];
    NSString *contentString=[dictionary objectForKey:@"content"];
    NSString *urlstring =[dictionary objectForKey:@"news_url"];
    if ([urlstring containsString:@"?"]) {
          newsdate  = [NSString stringWithFormat:@"%@%@%@%@",@"&news_date=",[dictionary objectForKey:@"news_date"],@"&member_id=",[[NSUserDefaults standardUserDefaults]valueForKey:@"MemberId"]];
    }else{
      newsdate  = [NSString stringWithFormat:@"%@%@%@%@",@"?news_date=",[dictionary objectForKey:@"news_date"],@"&member_id=",[[NSUserDefaults standardUserDefaults]valueForKey:@"MemberId"]];
    }
   NSString *urlstring2 =[NSString stringWithFormat:@"%@%@",[dictionary objectForKey:@"news_url"],newsdate];

    NSString *contentString1=[contentString stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    NSString *contentString2=[contentString1 stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    NSString *contentString3=[[contentString2 stringByReplacingOccurrencesOfString:@"nbsp;" withString:@" "] stringByReplacingOccurrencesOfString:@"&amp;" withString:@""];
    NSString *contentString4=[contentString3 stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@" "];
    NSString *contentString5=nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
           [self.view bringSubviewToFront:self.MenuTable];
         self.MenuTable.frame = CGRectMake(0, 64, self.view.frame.size.width-160,self.view.frame.size.height+40);
        [backButton setImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [homeButton setImage:[UIImage imageNamed:@"btn_home_up.png"] forState:UIControlStateNormal];
        [homeButton setImage:[UIImage imageNamed:@"btn_home_down.png"] forState:UIControlStateHighlighted];
        contentString5=[NSString stringWithFormat:@"<html><body><font color=\"white\">%@</font></body></html>",contentString4];
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.Menutableipad.frame = CGRectMake(0, 64, 225,self.view.frame.size.height+50);

           [self.view bringSubviewToFront:self.Menutableipad];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_up.png"] forState:UIControlStateNormal];
        [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_up.png"] forState:UIControlStateNormal];
        [homeButton setBackgroundImage:[UIImage imageNamed:@"btn_home_down.png"] forState:UIControlStateHighlighted];
        webView.scrollView.bounces=NO;
        contentString5=[NSString stringWithFormat:@"<html><body><font color=\"white\" size=\"5\">%@</font></body></html>",contentString4];
    }
    
    if ([urlstring isEqualToString:@"" ]) {
        //webExample.layer.frame=CGRectMake(x,y,200,200);
        loadingView.hidden=YES;
        self.ImageIcon.hidden=NO;
        labelForNewsTitle.hidden=NO;
        labelForNewsDate.hidden=NO;
        webView.layer.frame =webView.layer.frame;       // webView.layer.frame =CGRectMake(31, 301, 240, 150);
        [webView loadHTMLString:contentString5 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
        // self.webView.delegate =self;
    }else{
//        aHUD = [[HudView alloc]init];
//        [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
//      //  [aHUD loadingViewInView:self.view text:text];
//        [self.view setUserInteractionEnabled:NO];
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
          [self addloder];
        self.webView.delegate=self;
        self.ImageIcon.hidden=YES;
        labelForNewsTitle.hidden=YES;
        labelForNewsDate.hidden=YES;
        webView.layer.frame =CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstring2]]];
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
-(IBAction)actionOnBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(IBAction)actionOnHomeButton:(id)sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count]-4)] animated:NO];
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

#pragma mark WEBVIEW DELEGATE --->>>

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
  
//    [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
//    [aHUD setUserInteractionEnabledForSuperview:self.view];
//    [aHUD.loadingView removeFromSuperview];
//    aHUD = nil;
//    [self.view setUserInteractionEnabled:YES];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    

//    if (webView == _webviewSecond) {
//        NSLog(@"_websecond loading");
//        
//    }else{
//        NSLog(@"finish loading");
//        [_webview setBackgroundColor:[UIColor clearColor]];
//        [_webview setOpaque:NO];
//        [_viewWebBg setHidden:YES];
       [loadingView setHidden:YES];
  //  }
}
-(void)addloder
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        loadingView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3.7, self.view.frame.size.height/2, self.view.frame.size.width/2, self.view.frame.size.width/3)];
       
        loadingView.backgroundColor = [UIColor colorWithWhite:0. alpha:0.6];
        loadingView.layer.cornerRadius = 5;
        
        UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityView.center = CGPointMake(loadingView.frame.size.width / 2.0, 70);
        [activityView startAnimating];
        activityView.tag = 100;
        [loadingView addSubview:activityView];
        
        UILabel* lblLoading = [[UILabel alloc]initWithFrame:CGRectMake(32, 18, 120, 30)];
        lblLoading.text = @"please wait...";
        lblLoading.textColor = [UIColor whiteColor];
        lblLoading.font = [UIFont boldSystemFontOfSize:17.0f];//[UIFont fontWithName:lblLoading.font.fontName size:15];
        // lblLoading.font. = []
        lblLoading.textAlignment = NSTextAlignmentLeft;
        [loadingView addSubview:lblLoading];
        [webView addSubview:loadingView];
        loadingView.hidden=YES;
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        loadingView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2.5, self.view.frame.size.height/2.2, 160, 100)];
        loadingView.backgroundColor = [UIColor colorWithWhite:0. alpha:0.6];
        loadingView.layer.cornerRadius = 10;
        
        UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityView.center = CGPointMake(loadingView.frame.size.width / 2.0, 70);
        [activityView startAnimating];
        activityView.tag = 100;
        [loadingView addSubview:activityView];
        
        UILabel* lblLoading = [[UILabel alloc]initWithFrame:CGRectMake(32, 18, 120, 30)];
        lblLoading.text = @"please wait...";
        lblLoading.textColor = [UIColor whiteColor];
        lblLoading.font = [UIFont boldSystemFontOfSize:17.0f];//[UIFont fontWithName:lblLoading.font.fontName size:15];
        // lblLoading.font. = []
        lblLoading.textAlignment = NSTextAlignmentLeft;
        [loadingView addSubview:lblLoading];
        [self.view addSubview:loadingView];
        loadingView.hidden=YES;
    }

     // [_viewWebBg addSubview:loadingView];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
//    aHUD = [[HudView alloc]init];
//    [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
//    
//    [self.view setUserInteractionEnabled:NO];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    //    NSLog(@"start loading");
//    
//    if (webView == _webviewSecond) {
//        NSLog(@"_websecond loading");
//    }else{
//        
//        [_webview setBackgroundColor:[UIColor clearColor]];
//        [self hideGradientBackground:_webview];
//        [_webview setOpaque:NO];
//        [_viewWebBg setHidden:NO];
        [loadingView setHidden:NO];
//    }
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void) hideGradientBackground:(UIView*)theView
{
//    //    for (UIView * subview in theView.subviews)
//    //    {
//    //        if ([subview isKindOfClass:[UIImageView class]])
//    //           // subview.hidden = YES;
//    //
//    //        [self hideGradientBackground:subview];
//    //    }
//    for (id subview in _webview.subviews)
//        if ([[subview class] isSubclassOfClass: [UIScrollView class]]) {
//            for (UIView *scrollSubview in [subview subviews])
//                if ([[scrollSubview class] isSubclassOfClass:[UIImageView class]])
//                    scrollSubview.hidden = YES;
//        }
}
-(void)releaseWebView
{
//    [[NSURLCache sharedURLCache] removeAllCachedResponses];
//    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
//    [_webview loadHTMLString:@"" baseURL:nil];
//    self.webview.delegate = nil;
//    [self.webview stopLoading];
//    
//    [_webVideo loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
//    [_webVideo loadHTMLString:@"" baseURL:nil];
//    self.webVideo.delegate = nil;
//    [self.webVideo stopLoading];
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

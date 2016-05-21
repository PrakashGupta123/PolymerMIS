//
//  SignUpOrLogin.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 25/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "SignUpOrLogin.h"
#import "LoginScreen.h"
#import "SignUpScreen.h"
#import "HomeScreenViewController.h"
#import "SignloginCell.h"
#import  "TermsAndConditionsScreen.h"

CGSize screenSize;

@interface SignUpOrLogin ()
{
    NSMutableArray *menuArray;

}
@end

@implementation SignUpOrLogin
@synthesize buttonSignIn,buttonSignUp,buttonMenu;

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

    menuArray = [[NSMutableArray alloc]initWithObjects:@"About Us",@"Plans",@"Contact Us",nil];
    
    screenSize=[[UIScreen mainScreen] bounds].size;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
         self.MenuBtn.tag=0;
        self.MenuTable.hidden=YES;
        CGRect napkinBottomFrame = self.MenuTable.frame;
        napkinBottomFrame.origin.x = -125;
        
        [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ self.MenuTable.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
        

        [buttonSignUp setImage:[UIImage imageNamed:@"btn_signup_up_two.png"] forState:UIControlStateNormal];
        [buttonSignUp setImage:[UIImage imageNamed:@"btn_signup_down_two.png"] forState:UIControlStateHighlighted];
        [buttonSignIn setImage:[UIImage imageNamed:@"btn_login_up_two.png"] forState:UIControlStateNormal];
        [buttonSignIn setImage:[UIImage imageNamed:@"btn_login_down_two.png"] forState:UIControlStateHighlighted];
        
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.MenuTable.frame = CGRectMake(0, 64, 225,self.view.frame.size.height+50);

        [buttonSignUp setBackgroundImage:[UIImage imageNamed:@"btn_signup_up_two.png"] forState:UIControlStateNormal];
        [buttonSignUp setBackgroundImage:[UIImage imageNamed:@"btn_signup_down_two.png"] forState:UIControlStateHighlighted];
        [buttonSignIn setBackgroundImage:[UIImage imageNamed:@"btn_login_up_two.png"] forState:UIControlStateNormal];
        [buttonSignIn setBackgroundImage:[UIImage imageNamed:@"btn_login_down_two.png"] forState:UIControlStateHighlighted];
        
    }
    
    [buttonMenu setContentMode:UIViewContentModeScaleAspectFill];
    appDelegate=(PolymerMISAppDelegate *)[UIApplication sharedApplication].delegate;
    
    
//    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn"])
//    {
//        HomeScreenViewController *homeScreen=[[HomeScreenViewController alloc] init];
//        [self.navigationController pushViewController:homeScreen animated:NO];
//    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20)];

            [buttonMenu setFrame:CGRectMake((screenSize.width-buttonMenu.frame.size.width)/2, screenSize.height-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [self.view setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20)];

            [buttonMenu setFrame:CGRectMake((screenSize.height-buttonMenu.frame.size.width)/2, screenSize.width-20-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [buttonMenu setFrame:CGRectMake((768-buttonMenu.frame.size.width)/2, 1004-buttonMenu.frame.size.height, buttonMenu.frame.size.width, buttonMenu.frame.size.height)];
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
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

#pragma mark - Custom Methods

- (IBAction)MenuAction:(id)sender {
     self.MenuTable.hidden=NO;
        if (self.MenuBtn.tag==1)
    
        {
            self.MenuBtn.tag=0;

            CGRect napkinBottomFrame = self.MenuTable.frame;
            napkinBottomFrame.origin.x = -125;
    
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

-(IBAction)actionOnSignUp:(id)sender
{
    SignUpScreen *signUp=[[SignUpScreen alloc] init];
    [self presentViewController:signUp animated:YES completion:^{
    }];
}
-(IBAction)actionOnSignIn:(id)sender
{
    LoginScreen *login=[[LoginScreen alloc] init];
    [self.navigationController pushViewController:login animated:NO];
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
    SignloginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignloginCell"];
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SignloginCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
   
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(SignloginCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
     cell.labelMenu.text =[menuArray objectAtIndex:indexPath.row];
    if (cell.isSelected == YES)
    {
        // [cell setBackgroundColor:[UIColor blueColor]];
    }
    else
    {
       // [cell setBackgroundColor:[UIColor blueColor]];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SignloginCell *cell = (SignloginCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor blueColor]];
//
  //  _Menutableipad.hidden=YES;
    _MenuTable.hidden=YES;
    

}
@end

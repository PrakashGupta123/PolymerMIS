//
//  SplashScreen.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 23/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "SplashScreen.h"
#import "TermsAndConditionsScreen.h"
#import "SignUpOrLogin.h"
#import "LoginScreen.h"
#import "Notification.h"
#import "PolymerMISAppDelegate.h"



@interface SplashScreen ()

@end

@implementation SplashScreen

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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"NavigateNotification"
                                               object:nil];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
//    LoginScreen *signUpOrLogin=[[LoginScreen alloc] init];
//   [self.navigationController pushViewController:signUpOrLogin animated:NO];
    
   [self performSelector:@selector(startApplication) withObject:nil afterDelay:3.0];
}
//- (void)viewWillAppear:(BOOL)animated
//{
//        LoginScreen *signUpOrLogin=[[LoginScreen alloc] init];
//      [self.navigationController pushViewController:signUpOrLogin animated:NO];
//
//
//}
-(void)receiveTestNotification:(NSNotification *)Noti
{
    NSLog(@"%@",[Noti userInfo]);
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"isUserLoggedIn"])
      {
          
          // Notification_ipad
          if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
              Notification *obj = [[Notification alloc] initWithNibName:@"Notification_ipad" bundle:nil];
              obj.DictNoti = [Noti userInfo];
              
    [self presentViewController:obj animated:YES completion:nil];
              
          }
          else
          {
              Notification *obj = [[Notification alloc] initWithNibName:@"Notification" bundle:nil];
              obj.DictNoti = [Noti userInfo] ;
                              [self presentViewController:obj animated:YES completion:nil];
              
          }

      }
    
    
else
{
   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"please login first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
}

-(void)startApplication
{
    LoginScreen *signUpOrLogin=[[LoginScreen alloc] init];
        [self.navigationController pushViewController:signUpOrLogin animated:NO];

    
//    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"TermsAndConditions"]isEqualToString:@"accepted"])
//    {
////        SignUpOrLogin *signUpOrLogin=[[SignUpOrLogin alloc] init];
////        [self.navigationController pushViewController:signUpOrLogin animated:NO];
//        LoginScreen *signUpOrLogin=[[LoginScreen alloc] init];
//        [self.navigationController pushViewController:signUpOrLogin animated:NO];
//    }
//    else
//    {
//        TermsAndConditionsScreen *termAndCondition=[[TermsAndConditionsScreen alloc] init];
//        
//        [self presentViewController:termAndCondition animated:YES completion:^{
//        }];
//        
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

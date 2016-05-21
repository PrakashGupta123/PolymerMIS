//
//  PolymerMISAppDelegate.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 23/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "PolymerMISAppDelegate.h"
#import "SplashScreen.h"
#import "LoginScreen.h"
#import "Reachability.h"
#import "Notification.h"
#import "ASIFormDataRequest.h"
#import "Notification.h"
#import "MONPromptView.h"
#import "UIViewController+LayoutConstraint.h"
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"
#import "AFDownloadRequestOperation.h"
#import "AFDownloadManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPClient.h"


@implementation PolymerMISAppDelegate

@synthesize window, navigationController,isMenuViewPresented;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[self callnewService];
   [self callWebservcieForForceUpdate];
   //[self httpPostWithCustomDelegate];
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    SplashScreen *splash=[[SplashScreen alloc] init];
    navigationController=[[UINavigationController alloc] initWithRootViewController:splash];
    [navigationController.navigationBar setHidden:YES];
    [window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    self.IsUpadte = NO;
    if([[UIApplication sharedApplication] respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:  [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |    UIUserNotificationTypeSound)];
    }
    return YES;
}

-(BOOL) needsUpdate
{
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString* appID = infoDictionary[@"CFBundleIdentifier"];
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@", appID]];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSDictionary* lookup = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([lookup[@"resultCount"] integerValue] == 1){
        NSString* appStoreVersion = lookup[@"results"][0][@"version"];
        NSString* currentVersion = infoDictionary[@"CFBundleShortVersionString"];
        if (![appStoreVersion isEqualToString:currentVersion])
        {
            NSLog(@"Need to update [%@ != %@]", appStoreVersion, currentVersion);
            return YES;
        }
    }
    return NO;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self logoutClicked];

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //  [self timeduration];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [navigationController.navigationBar setHidden:YES];
    
    //[self callWebservcieForForceUpdate ];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // [self timeduration];
}



-(void)callWebservcieForForceUpdate {
    
    if([[Reachability sharedReachability] internetConnectionStatus] == NotReachable)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"No Network Connection. Please try later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        
        //   polymer test url
      //  NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
        NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        
        // NSString *currentVersion=  [[NSUserDefaults standardUserDefaults]valueForKey:@"LoginUserName"];
        
        //nslog(@"%@ %@",userNameText,passwordText);
        NSString * currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        [request setPostValue:currentVersion forKey:@"app_version"];
        [request setPostValue:@"chk_build_version_ios" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForUpdate:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailedUpdate:)];
        [request startAsynchronous];
    }
    
}
-(void)requestFinishedForUpdate:(ASIHTTPRequest *)request
{
    //[self performSelector:@selector(killHUD1)];
    NSString *responseString = [request responseString];
    NSLog(@"result=%@",responseString);
           NSMutableDictionary *responseDictionary=[[NSMutableDictionary alloc] init];
    
    
    responseDictionary=[NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:nil];
    

    
    NSString *new = [responseDictionary valueForKey:@"error"] ;
    NSInteger b = [new integerValue];
    
    if (b==1)
    {
    
        NSString *urlStr =[NSString stringWithFormat:@"%@", @"https://itunes.apple.com/in/app/polymermis/id690529163?mt=8"];

        _iTunesLink = [NSURL URLWithString:urlStr];
        _IsUpadte=YES;
      [self.promptView showInView:self.window];

    }
    else
    {
        [self.promptView removeFromSuperview];

        
    }
    
//        
//        
//        NSLog(@"%@",responseDictionary);
//    
//    NSDictionary *dict = responseDictionary;
//    if ([[dict valueForKey:@"error"] isEqualToString:@""]) {
//        NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
//        
//        if (![[[dict valueForKey:@"data"] valueForKey:@"version"] isEqualToString:appVersionString]) {
//            
//            
//            if ([[[dict valueForKey:@"data"] valueForKey:@"is_update"] isEqualToString:@"1"]) {
//                
//             NSURL   *iTunesLink = [[dict valueForKey:@"data"] valueForKey:@"url"];
//                [self.promptView showInView:self.window];
//                
//            }else
//            {
//                
//                [self.promptView removeFromSuperview];
//                
//            }
//        }else{
//            
//            [self.promptView removeFromSuperview];
//            
//        }
//        
//    }
}



-(void)requestFinishedAndFailedUpdate: (ASIHTTPRequest *)request
{
    //nslog(@"Failed.");
}


- (MONPromptView *)promptView {
    if (!_promptView) {
        _promptView =
        [[MONPromptView alloc] initWithTitle:@"Update PolymerMis App"
                                     message:@"PolymerMIS has introduced some cool features. Please download the updated app for the improved experience and save money."
                          dismissButtonTitle:@"Go to App Store"
                                  attributes:@{ kMONPromptViewAttribDismissButtonBackgroundColor: [UIColor colorWithRed:40/255.0f green:122/255.0f blue:1.0f alpha:1.0f],
                                                kMONPromptViewAttribDismissButtonTextColor: [UIColor whiteColor],
                                                kMONPromptViewAttribDismissButtonFont: [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f],
                                                kMONPromptViewAttribMessageFont: [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f],
                                                kMONPromptViewAttribTitleFont: [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f] }];
        _promptView.delegate = self;
    }
    return _promptView;
}
#pragma mark - Prompt View Delegate

- (void)promptViewWillDismiss:(MONPromptView *)promptView {
    _IsUpadte = YES;
    NSString *urlStr =[NSString stringWithFormat:@"%@", @"https://itunes.apple.com/in/app/polymermis/id690529163?mt=8"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];

}
-(void)timeduration
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
        
        //   polymer test url
      //  NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
        
        NSURL *url = [NSURL URLWithString:@"http://www.polymermis.com/webservice.php"];
        
        //http://www.polymermis.com/webservice.php
        
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        //        NSString *userNameText=textFieldForUsername.text;
        //        NSString *passwordText=textFieldForPassword.text;
        //        [[NSUserDefaults standardUserDefaults] setValue:userNameText forKey:@"LoginUserName"];
        //        [[NSUserDefaults standardUserDefaults] setValue:passwordText forKey:@"LoginUserPassword"];
        
        //nslog(@"%@ %@",userNameText,passwordText);
        //        [request setPostValue:userNameText forKey:@"userName"];
        NSString *mberid = [[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"] ;
        [request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"] forKey:@"member_id"];
        
        //[request setPostValue:@"login_webuser" forKey:@"methodName"];
        [request setPostValue:@"/logout_user" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForSignIn11:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailed22:)];
        [request startAsynchronous];
    }
}


-(void)requestFinishedForSignIn11:(ASIHTTPRequest *)request
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
        //nslog(@"%@",responseDictionary);
        if (![[responseDictionary valueForKey:@"error"]isEqualToString:@""]) {
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[responseDictionary valueForKey:@"error"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
        }
        
        //  NSString *str=[NSString stringWithFormat:@"%@",[responseDictionary valueForKey:@"data"]];
        
        if ([[responseDictionary valueForKey:@"data"]isEqualToString:@"false"])
        {
            //            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter valid UserName or Password!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            //            [alert show];
        }
        else if([[responseDictionary valueForKey:@"data"]isEqualToString:@"true"])
            
        {
            LoginScreen *LoginScre=[[LoginScreen alloc] init];
            [self.navigationController pushViewController:LoginScre animated:NO];
            
        }
        if ([[responseDictionary valueForKey:@"error"]isEqualToString:@""])
        {
            
            //            NSMutableDictionary *tableDictionary=[[[responseDictionary objectForKey:@"response"] objectForKey:@"loginResponse"] objectForKey:@"Table"];
            ////            if([[tableDictionary objectForKey:@"msg"] length] < 6)
            ////            {
            //                NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"MemberId"] forKey:@"MemberId"];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"email"] forKey:@"email"];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"fullName"] forKey:@"fullName"];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"member_city "] forKey:@"member_city"];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"member_comapny "] forKey:@"member_comapny"];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"member_country "] forKey:@"member_country"];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"member_mobile "] forKey:@"member_mobile"];
            //                [userDefaults setValue:[tableDictionary objectForKey:@"member_state "] forKey:@"member_state"];
            //                [userDefaults setBool:YES forKey:@"isUserLoggedIn"];
            //                [userDefaults synchronize];
            //            //    [[NSUserDefaults standardUserDefaults]setBool:checkBoxSelected forKey:@"remember"];
            //
        }
        
        
        //   }
        else
        {
            //                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter valid UserName or Password!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            //                [alert show];
        }
    }
    
}

- (void) showHUD:(NSString *)text
{
    //    if(aHUD == nil)
    //    {
    //        aHUD = [[HudView alloc]init];
    //        [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
    //        [aHUD loadingViewInView:self.view text:text];
    //        [self.view setUserInteractionEnabled:NO];
    //        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    //    }
}
- (void) killHUD
{
    //    if(aHUD != nil )
    //    {
    //        [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
    //        [aHUD setUserInteractionEnabledForSuperview:self.view];
    //        [aHUD.loadingView removeFromSuperview];
    //        aHUD = nil;
    //        [self.view setUserInteractionEnabled:YES];
    //        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    //
    //    }
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
        [request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"MemberId"] forKey:@"member_id"];
        
        [request setPostValue:@"logout_user" forKey:@"methodName"];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinishedForLogOut2:)];
        [request setDidFailSelector:@selector(requestFinishedAndFailedLogout:)];
        [request startAsynchronous];
    }
    
}
-(void)requestFinishedForLogOut2:(ASIHTTPRequest *)request
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
        //
        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"User logout successfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        //        [alert show];
        
        
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
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
        LoginScreen *splash=[[LoginScreen alloc] init];
        navigationController=[[UINavigationController alloc] initWithRootViewController:splash];
        [window setRootViewController:navigationController];
        [self.window makeKeyAndVisible];
        //  [appDelegate.navigationController popToViewController:[appDelegate.navigationController.viewControllers objectAtIndex:2] animated:NO];
        //  [self performSelector:@selector(removeAllSubviews)];
        
        
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

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    NSString* strdeviceToken = [[[[deviceToken description]
                                  stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                 stringByReplacingOccurrencesOfString: @">" withString: @""]
                                stringByReplacingOccurrencesOfString: @" " withString: @""] ;
    NSLog(@"Device_Token   -----> %@\n",strdeviceToken);
    //strDeviceToken=strdeviceToken;
    
    [[NSUserDefaults standardUserDefaults] setValue:strdeviceToken forKey:@"DeviceToken"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    
   
}




- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

-(void)requestFinishedAndFailedLogout: (ASIHTTPRequest *)request
{
    //nslog(@"Failed.");
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    self.dictNoti = [[NSDictionary alloc] init];
    self.dictNoti = userInfo;
    
  
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
        if (userInfo) {
            self.dictNoti = userInfo;
            //@"New update is available"
            UIAlertView *alret =[[UIAlertView alloc]initWithTitle:@"Alert" message:@"New update is available." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
            alret.tag=100;
            [alret show];
            
        }

        
    }
    else
    {
         [[NSNotificationCenter defaultCenter] postNotificationName:@"NavigateNotification" object:nil userInfo:userInfo];
    }
    
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==100)
    {
        if (buttonIndex==0)
            
        {
            if([[NSUserDefaults standardUserDefaults] boolForKey:@"isUserLoggedIn"])
        {
            UIViewController *vc = self.window.rootViewController;
            Notification *pvc = [[Notification alloc] init];
            pvc.DictNoti = self.dictNoti;
            [vc presentViewController:pvc animated:YES completion:nil];
            
        }
        else
        {
            UIAlertView *alret =[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Login First." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
            alret.tag=101;
            [alret show];

            
        }

        
    }
   
    
        
        
       // [[NSNotificationCenter defaultCenter] postNotificationName:@"NavigateNotification" object:nil userInfo:self.dictNoti];
       
        
    }
}


/*
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{

    Notification *splash=[[Notification alloc] init];
    navigationController=[[UINavigationController alloc] initWithRootViewController:splash];
    [navigationController.navigationBar setHidden:YES];
    [window setRootViewController:navigationController];
}
 */
//-(void)removeAllSubviews
//{
//    appDelegate.isMenuViewPresented=NO;
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [transparentView removeFromSuperview];
//
//    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//    {
//
//        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
//        {
//            if(loginFlag)
//            {
//                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 106)];} completion:^(BOOL flag){[self removeFromSuperview];}];
//            }
//            else
//            {
//                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 53)];} completion:^(BOOL flag){[self removeFromSuperview];}];
//            }
//        }
//        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
//
//        {
//            if(loginFlag)
//            {
//                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];} completion:^(BOOL flag){[self removeFromSuperview];}];
//            }
//            else
//            {
//                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];} completion:^(BOOL flag){[self removeFromSuperview];}];
//            }
//        }
//    }
//
//    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//    {
//        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
//        {
//            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, 1004, 768, 80)];} completion:^(BOOL flag){[self removeFromSuperview];}];
//        }
//        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
//
//        {
//            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, 748, 1024, 80)];} completion:^(BOOL flag){[self removeFromSuperview];}];
//        }
//
//    }
//
//    if([self.delegate respondsToSelector:@selector(changeMenuButtonPosition)])
//    {
//        [self.delegate changeMenuButtonPosition];
//    }
//}

-(void)requestFinishedAndFailed22: (ASIHTTPRequest *)request
{
    //nslog(@"Failed.");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void) httpPostWithCustomDelegate
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://www.polymermis.com/webservice_test.php"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString * params =@"app_version=1.7&methodName=chk_build_version_ios";
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ %@\n", response, error);
                                                           if(error == nil)
                                                           {
                                                               NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                               NSLog(@"Data = %@",text);
                                                           }
                                                           
                                                       }];
    [dataTask resume];
    
}

-(void)callnewService
{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://hipappserver.com/ca_meeting/api/db/getAlldb"]];
    
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
    if (deviceToken == nil)
    {
        deviceToken =@"b95bbd34765fbcfc0fa407778fd75d7be12dd31d50a28221a8944b8ef08d0db2";
    }
    
    NSDictionary *params =[[NSDictionary alloc]initWithObjectsAndKeys:@"1.7",@"app_version", deviceToken,@"device_token",@"chk_build_version_ios",@"methodName",nil];
    
    
    [client postPath:@"http://www.polymermis.com/webservice_test.php" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSString *text = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
         NSLog(@"Response: %@", text);
         NSData* data = [text dataUsingEncoding:NSUTF8StringEncoding];
         NSString *jsonString = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
     //    NSDictionary *jsonDict = [jsonString JSONValue];
         NSDictionary *dcict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
         // if (dcict con)
        
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", [error localizedDescription]);
       
     }];
}



@end

//
//  MenuView.m
//  PolymerMIS
//
//  Created by sanchay on 3/1/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "MenuView.h"
#import "PlansScreen.h"
#import "ContactUsScreen.h"
#import "AboutUsScreen.h"
#import "ASIFormDataRequest.h"
#import "Reachability.h"
#import "LoginScreen.h"

CGSize screenSize;

@implementation MenuView

@synthesize delegate;

-(id)initWithLoginFlag:(BOOL) isLoggedIn inClass:(id) target
{
    if(self=[super init])
    {
        screenSize=[[UIScreen mainScreen] bounds].size;
        loginFlag=isLoggedIn;
        transparentView=[[TransparentView alloc] init];
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            
            if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
            {
                if(loginFlag)
                {
                    [self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 106)];
                    [transparentView setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20-106)];
                }
                else
                {
                    [self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 53)];
                    [transparentView setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20-53)];
                }
            }
            else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
                
            {
                if(loginFlag)
                {
                    [self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];
                    [transparentView setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20-53)];
                }
                else
                {
                    [self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];
                    [transparentView setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20-53)];
                }
            }
        }
        
        else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
            {
                if(loginFlag)
                {
                    [self setFrame:CGRectMake(0, 1004, 768, 80)];
                    [transparentView setFrame:CGRectMake(0, 0, 768, 924)];
                }
                else
                {
                    [self setFrame:CGRectMake(0, 1004, 768, 80)];
                    [transparentView setFrame:CGRectMake(0, 0, 768, 924)];
                }
            }
            else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
                
            {
                if(loginFlag)
                {
                    [self setFrame:CGRectMake(0, 748, 1024, 80)];
                    [transparentView setFrame:CGRectMake(0, 0, 1024, 668)];
                }
                else
                {
                    [self setFrame:CGRectMake(0, 748, 1024, 80)];
                    [transparentView setFrame:CGRectMake(0, 0, 1024, 668)];
                }
            }
        
        }
        
        targetClass=target;
        transparentView.delegate=self;
        appDelegate=(PolymerMISAppDelegate *) [UIApplication sharedApplication].delegate;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeMenuViewSize) name:@"orientationChanged" object:nil];
    }
    
    return self;
        
}

-(void)showMenuViewInView:(UIView *)superView
{
    appDelegate.isMenuViewPresented=YES;
    targetSuperview=superView;

    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            
            if(loginFlag)
                
            {
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                logout=[UIButton buttonWithType:UIButtonTypeCustom];
                [logout setBackgroundColor:[UIColor clearColor]];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout1"] forState:UIControlStateNormal];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout2"] forState:UIControlStateHighlighted];
                [logout setContentMode:UIViewContentModeScaleAspectFill];
                [logout addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:logout];
                
                home=[UIButton buttonWithType:UIButtonTypeCustom];
                [home setBackgroundColor:[UIColor clearColor]];
                [home setBackgroundImage:[UIImage imageNamed:@"home1"] forState:UIControlStateNormal];
                [home setBackgroundImage:[UIImage imageNamed:@"home2"] forState:UIControlStateHighlighted];
                [home setContentMode:UIViewContentModeScaleAspectFill];
                [home addTarget:self action:@selector(homeClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:home];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 106)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20-106)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                    [home removeFromSuperview];
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, screenSize.height-106, screenSize.width, 106)];[targetSuperview addSubview:self];} completion:nil];
                
            }
            
            else
                
            {
                
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 53)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20-53)];

                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans removeFromSuperview];
                    [contactUs setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [plans setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs removeFromSuperview];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, (screenSize.width-2)/3, 53)];
                    [plans setFrame:CGRectMake(((screenSize.width-2)/3)+1, 0, (screenSize.width-2)/3, 53)];
                    [contactUs setFrame:CGRectMake((((screenSize.width-2)/3)*2)+2, 0, (screenSize.width-2)/3, 53)];
                    
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, screenSize.height-53, screenSize.width, 53)];[targetSuperview addSubview:self];} completion:nil];
            }
            
        }
        
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        
        {
            
            if(loginFlag)
                
            {
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                logout=[UIButton buttonWithType:UIButtonTypeCustom];
                [logout setBackgroundColor:[UIColor clearColor]];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout1"] forState:UIControlStateNormal];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout2"] forState:UIControlStateHighlighted];
                [logout setContentMode:UIViewContentModeScaleAspectFill];
                [logout addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:logout];
                
                home=[UIButton buttonWithType:UIButtonTypeCustom];
                [home setBackgroundColor:[UIColor clearColor]];
                [home setBackgroundImage:[UIImage imageNamed:@"home1"] forState:UIControlStateNormal];
                [home setBackgroundImage:[UIImage imageNamed:@"home2"] forState:UIControlStateHighlighted];
                [home setContentMode:UIViewContentModeScaleAspectFill];
                [home addTarget:self action:@selector(homeClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:home];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.height, screenSize.height-20-53)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/4, 53)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, (screenSize.height/4), 53)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, (screenSize.height/4), 53)];
                    [plans setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, screenSize.height/4, 53)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/4, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, screenSize.height/4, 53)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/4, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, screenSize.height/4, 53)];
                    [home removeFromSuperview];
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, screenSize.width-20-53, screenSize.height, 53)];[targetSuperview addSubview:self];} completion:nil];

            }
            
            else
                
            {
                
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20-53)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/2, 53)];
                    [contactUs setFrame:CGRectMake(screenSize.height/2, 0, screenSize.height/2, 53)];
                    [plans removeFromSuperview];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    
                    [plans setFrame:CGRectMake(0, 0, screenSize.height/2, 53)];
                    [contactUs setFrame:CGRectMake(screenSize.height/2, 0, screenSize.height/2, 53)];
                    [aboutUs removeFromSuperview];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/2, 0, screenSize.height/2, 53)];
                    [contactUs removeFromSuperview];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/3, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/3, 0, screenSize.height/3, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/3)*2, 0, 160, 53)];
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, screenSize.width-20-53, screenSize.height, 53)];[targetSuperview addSubview:self];} completion:nil];
            }
            
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            if(loginFlag)
                
            {
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                logout=[UIButton buttonWithType:UIButtonTypeCustom];
                [logout setBackgroundColor:[UIColor clearColor]];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout1"] forState:UIControlStateNormal];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout2"] forState:UIControlStateHighlighted];
                [logout setContentMode:UIViewContentModeScaleAspectFill];
                [logout addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:logout];
                
                home=[UIButton buttonWithType:UIButtonTypeCustom];
                [home setBackgroundColor:[UIColor clearColor]];
                [home setBackgroundImage:[UIImage imageNamed:@"home1"] forState:UIControlStateNormal];
                [home setBackgroundImage:[UIImage imageNamed:@"home2"] forState:UIControlStateHighlighted];
                [home setContentMode:UIViewContentModeScaleAspectFill];
                [home addTarget:self action:@selector(homeClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:home];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, 1004, 768, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 768, 924)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                    [home removeFromSuperview];
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, 944, 768, 80)];[targetSuperview addSubview:self];} completion:nil];
                
            }
            
            else
                
            {
                
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, 1004, 768, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 768, 924)];
                
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 384, 80)];
                    [plans removeFromSuperview];
                    [contactUs setFrame:CGRectMake(384, 0, 384, 80)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [plans setFrame:CGRectMake(0, 0, 384, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 384, 80)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 384, 80)];
                    [plans setFrame:CGRectMake(384, 0, 384, 80)];
                    [contactUs removeFromSuperview];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                    
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, 944, 768, 80)];[targetSuperview addSubview:self];} completion:nil];
            }

        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            if(loginFlag)
                
            {
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                logout=[UIButton buttonWithType:UIButtonTypeCustom];
                [logout setBackgroundColor:[UIColor clearColor]];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout1"] forState:UIControlStateNormal];
                [logout setBackgroundImage:[UIImage imageNamed:@"logout2"] forState:UIControlStateHighlighted];
                [logout setContentMode:UIViewContentModeScaleAspectFill];
                [logout addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:logout];
                
                home=[UIButton buttonWithType:UIButtonTypeCustom];
                [home setBackgroundColor:[UIColor clearColor]];
                [home setBackgroundImage:[UIImage imageNamed:@"home1"] forState:UIControlStateNormal];
                [home setBackgroundImage:[UIImage imageNamed:@"home2"] forState:UIControlStateHighlighted];
                [home setContentMode:UIViewContentModeScaleAspectFill];
                [home addTarget:self action:@selector(homeClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:home];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, 748, 1024, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 1024, 668)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                    [home removeFromSuperview];
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, 668, 1024, 80)];[targetSuperview addSubview:self];} completion:nil];
                
            }
            
            else
                
            {
                
                aboutUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [aboutUs setBackgroundColor:[UIColor clearColor]];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us1"] forState:UIControlStateNormal];
                [aboutUs setBackgroundImage:[UIImage imageNamed:@"about_us2"] forState:UIControlStateHighlighted];
                [aboutUs setContentMode:UIViewContentModeScaleAspectFill];
                [aboutUs addTarget:self action:@selector(aboutUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:aboutUs];
                
                plans=[UIButton buttonWithType:UIButtonTypeCustom];
                [plans setBackgroundColor:[UIColor clearColor]];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans1"] forState:UIControlStateNormal];
                [plans setBackgroundImage:[UIImage imageNamed:@"plans2"] forState:UIControlStateHighlighted];
                [plans setContentMode:UIViewContentModeScaleAspectFill];
                [plans addTarget:self action:@selector(plansClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:plans];
                
                contactUs=[UIButton buttonWithType:UIButtonTypeCustom];
                [contactUs setBackgroundColor:[UIColor clearColor]];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us1"] forState:UIControlStateNormal];
                [contactUs setBackgroundImage:[UIImage imageNamed:@"contact_us2"] forState:UIControlStateHighlighted];
                [contactUs setContentMode:UIViewContentModeScaleAspectFill];
                [contactUs addTarget:self action:@selector(contactUsClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:contactUs];
                
                [self setBackgroundColor:[UIColor blackColor]];
                
                [self setFrame:CGRectMake(0, 748, 1024, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 1024, 668)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, 512, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 512, 80)];
                    [plans removeFromSuperview];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    
                    [plans setFrame:CGRectMake(0, 0, 512, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 512, 80)];
                    [aboutUs removeFromSuperview];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, 512, 80)];
                    [plans setFrame:CGRectMake(512, 0, 512, 80)];
                    [contactUs removeFromSuperview];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 341, 80)];
                    [plans setFrame:CGRectMake(341, 0, 341, 80)];
                    [contactUs setFrame:CGRectMake(682, 0, 341, 80)];
                }
                
                self.alpha=0.0;
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{self.alpha=0.8;[self setFrame:CGRectMake(0, 668, 1024, 80)];[targetSuperview addSubview:self];} completion:nil];
            }

        }
    }

    [targetSuperview addSubview:transparentView];
    
}


-(void)changeMenuViewSize
{
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            
            if(loginFlag)
                
            {
                [self setFrame:CGRectMake(0, screenSize.height-20-106, screenSize.width, 106)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20-106)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(0, 53, screenSize.width/2, 53)];
                    [logout setFrame:CGRectMake(screenSize.width/2, 53, screenSize.width/2, 53)];
                    [home removeFromSuperview];
                }
                
                if([self.delegate respondsToSelector:@selector(changeMenuButtonPositionInCaseOfLoginIphone)])
                {
                    [self.delegate changeMenuButtonPositionInCaseOfLoginIphone];
                }

            }
            
            else
                
            {
                
                [self setFrame:CGRectMake(0, screenSize.height-20-53, screenSize.width, 53)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-20-53)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
        
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    
                    [plans setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [contactUs setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.width/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.width/2, 0, screenSize.width/2, 53)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, (screenSize.width-2)/3, 53)];
                    [plans setFrame:CGRectMake(((screenSize.width-2)/3)+1, 0, (screenSize.width-2)/3, 53)];
                    [contactUs setFrame:CGRectMake((((screenSize.width-2)/3)*2)+2, 0, (screenSize.width-2)/3, 53)];
                }
            }

            
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            if(loginFlag)
                
            {
                [self setFrame:CGRectMake(0, screenSize.width-20-53, screenSize.height, 53)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20-53)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/4, 53)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, screenSize.height/4, 53)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, screenSize.height/4, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, screenSize.height/4, 53)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/4, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, screenSize.height/4, 53)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/4, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/4, 0, screenSize.height/4, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/4)*2, 0, screenSize.height/4, 53)];
                    [logout setFrame:CGRectMake((screenSize.height/4)*3, 0, screenSize.height/4, 53)];
                    [home removeFromSuperview];
                }
                
                if([self.delegate respondsToSelector:@selector(changeMenuButtonPositionInCaseOfLoginIphone)])
                {
                    [self.delegate changeMenuButtonPositionInCaseOfLoginIphone];
                }

            }
            
            else
                
            {
                
                [self setFrame:CGRectMake(0, screenSize.width-20-53, screenSize.height, 53)];
                [transparentView setFrame:CGRectMake(0, 0, screenSize.height, screenSize.width-20-53)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/2, 53)];
                    [contactUs setFrame:CGRectMake(screenSize.height/2, 0, screenSize.height/2, 53)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    
                    [plans setFrame:CGRectMake(0, 0, screenSize.height/2, 53)];
                    [contactUs setFrame:CGRectMake(screenSize.height/2, 0, screenSize.height/2, 53)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/2, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/2, 0, screenSize.height/2, 53)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, screenSize.height/3, 53)];
                    [plans setFrame:CGRectMake(screenSize.height/3, 0, screenSize.height/3, 53)];
                    [contactUs setFrame:CGRectMake((screenSize.height/3)*2, 0, screenSize.height/3, 53)];
                }
            }

        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            if(loginFlag)
                
            {
                [self setFrame:CGRectMake(0, 924, 768, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 768, 924)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 192, 80)];
                    [plans setFrame:CGRectMake(192, 0, 192, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 192, 80)];
                    [logout setFrame:CGRectMake(576, 0, 192, 80)];
                    [home removeFromSuperview];
                }
                
            }
            
            else
                
            {
                
                [self setFrame:CGRectMake(0, 924, 768, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 768, 924)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, 384, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 384, 80)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    
                    [plans setFrame:CGRectMake(0, 0, 384, 80)];
                    [contactUs setFrame:CGRectMake(384, 0, 384, 80)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, 384, 80)];
                    [plans setFrame:CGRectMake(384, 0, 384, 80)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                }
            }

        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            if(loginFlag)
                
            {
                [self setFrame:CGRectMake(0, 668, 1024, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 1024, 668)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans removeFromSuperview];
                    [home setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    [aboutUs removeFromSuperview];
                    [home setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs removeFromSuperview];
                    [home setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 256, 80)];
                    [plans setFrame:CGRectMake(256, 0, 256, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 256, 80)];
                    [logout setFrame:CGRectMake(768, 0, 256, 80)];
                    [home removeFromSuperview];
                }
                
            }
            
            else
                
            {
                
                [self setFrame:CGRectMake(0, 668, 1024, 80)];
                [transparentView setFrame:CGRectMake(0, 0, 1024, 668)];
                
                if([targetClass class]==[PlansScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, 512, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 512, 80)];
                }
                
                else if ([targetClass class]==[AboutUsScreen class])
                    
                {
                    
                    [plans setFrame:CGRectMake(0, 0, 512, 80)];
                    [contactUs setFrame:CGRectMake(512, 0, 512, 80)];
                }
                
                else if ([targetClass class]==[ContactUsScreen class])
                    
                {
                    
                    [aboutUs setFrame:CGRectMake(0, 0, 512, 80)];
                    [plans setFrame:CGRectMake(512, 0, 512, 80)];
                }
                else
                    
                {
                    [aboutUs setFrame:CGRectMake(0, 0, 341, 80)];
                    [plans setFrame:CGRectMake(341, 0, 341, 80)];
                    [contactUs setFrame:CGRectMake(682, 0, 341, 80)];
                }
            }

        }
    }

        
}

-(void)aboutUsClicked:(id)sender
{
    AboutUsScreen *about=[[AboutUsScreen alloc] init];
    [appDelegate.navigationController pushViewController:about animated:NO];
    [self performSelector:@selector(removeAllSubviews)];
}

-(void)plansClicked:(id)sender
{
    PlansScreen *plan=[[PlansScreen alloc] init];
    [appDelegate.navigationController pushViewController:plan animated:NO];
    [self performSelector:@selector(removeAllSubviews)];
}

-(void)contactUsClicked:(id)sender
{
    ContactUsScreen *contact=[[ContactUsScreen alloc] init];
    [appDelegate.navigationController pushViewController:contact animated:NO];
    [self performSelector:@selector(removeAllSubviews)];
}


- (void) killHUD1
{
    if(aHUD != nil )
    {
        [aHUD setUserInteractionEnabledForSuperview:self];
        [aHUD setUserInteractionEnabledForSuperview:self];
        [aHUD.loadingView removeFromSuperview];
        aHUD = nil;
        [self setUserInteractionEnabled:YES];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    }
}

- (void) showHUD1:(NSString *)text
{
    if(aHUD == nil)
    {
        aHUD = [[HudView alloc]init];
        [aHUD setUserInteractionEnabledForSuperview:self];
        [aHUD loadingViewInView:self text:text];
        [self setUserInteractionEnabled:NO];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}





#pragma mark - ASIHTTPRequestDelegate Methods

   NSError *error=nil;
        
    -(void)logoutClicked:(id)sender
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
                [self performSelector:@selector(removeAllSubviews)];
                

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




-(void)homeClicked:(id)sender
{
    [appDelegate.navigationController popToViewController:[appDelegate.navigationController.viewControllers objectAtIndex:3] animated:NO];
    [self performSelector:@selector(removeAllSubviews)];
}

#pragma mark - TransparentViewDelegate Methods

-(void)removeAllSubviews
{
    appDelegate.isMenuViewPresented=NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [transparentView removeFromSuperview];
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            if(loginFlag)
            {
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 106)];} completion:^(BOOL flag){[self removeFromSuperview];}];
            }
            else
            {
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.height-20, screenSize.width, 53)];} completion:^(BOOL flag){[self removeFromSuperview];}];
            }
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
            
        {
            if(loginFlag)
            {
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];} completion:^(BOOL flag){[self removeFromSuperview];}];
            }
            else
            {
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, screenSize.width-20, screenSize.height, 53)];} completion:^(BOOL flag){[self removeFromSuperview];}];
            }
        }
    }
    
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, 1004, 768, 80)];} completion:^(BOOL flag){[self removeFromSuperview];}];
        }
        else if((interfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation==UIInterfaceOrientationLandscapeRight))
            
        {
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{self.alpha=0.0;[self setFrame:CGRectMake(0, 748, 1024, 80)];} completion:^(BOOL flag){[self removeFromSuperview];}];
        }
        
    }

    if([self.delegate respondsToSelector:@selector(changeMenuButtonPosition)])
    {
        [self.delegate changeMenuButtonPosition];
    }
}


@end

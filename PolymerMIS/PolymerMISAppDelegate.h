//
//  PolymerMISAppDelegate.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 23/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MONPromptView.h"

@interface PolymerMISAppDelegate : UIResponder <UIApplicationDelegate,MONPromptViewDelegate>
{
    UIWindow *window;
    UINavigationController *navigationController;
    BOOL isMenuViewPresented;
    PolymerMISAppDelegate *appDelegate;
    
            
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (nonatomic) BOOL isMenuViewPresented,IsUpadte;
@property (strong,nonatomic)NSDictionary *dictNoti;
@property (strong,nonatomic)NSString *strNoti;
@property (strong,nonatomic)MONPromptView *promptView;
@property (strong,nonatomic)NSURL *iTunesLink;


@end

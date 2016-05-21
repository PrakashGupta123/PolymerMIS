//
//  MenuView.h
//  PolymerMIS
//
//  Created by sanchay on 3/1/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransparentView.h"
#import "PolymerMISAppDelegate.h"
#import "HudView.h"

@protocol MenuViewDelegate <NSObject>

@optional

-(void)changeMenuButtonPositionInCaseOfLoginIphone;

@required

-(void)changeMenuButtonPosition;

@end

@interface MenuView : UIView<TransparentViewDelegate>
{
     HudView *aHUD;
    BOOL loginFlag;
    UIView *targetSuperview;
    id targetClass;
    UIButton *aboutUs;
    UIButton *plans;
    UIButton *contactUs;
    UIButton *logout;
    UIButton *home;
    TransparentView *transparentView;
    PolymerMISAppDelegate *appDelegate;
}

@property(nonatomic,assign)id<MenuViewDelegate> delegate;

-(id)initWithLoginFlag:(BOOL) isLoggedIn inClass:(id) target;
-(void)showMenuViewInView:(UIView *)superView;

@end

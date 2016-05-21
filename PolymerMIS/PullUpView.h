//
//  PullUpView.h
//  PolymerMIS
//
//  Created by sanchay on 3/4/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullUpView : UIView
{
    UIImageView *backgroundImageView;
    UILabel *labelForText;
    UIActivityIndicatorView *activityIndicator;
}

@property(nonatomic,strong)UILabel *labelForText;
@property(nonatomic,strong)UIActivityIndicatorView *activityIndicator;

@end

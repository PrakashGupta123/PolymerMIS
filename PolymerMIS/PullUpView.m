//
//  PullUpView.m
//  PolymerMIS
//
//  Created by sanchay on 3/4/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "PullUpView.h"

@implementation PullUpView
@synthesize labelForText,activityIndicator;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        backgroundImageView=[[UIImageView alloc] initWithFrame:frame];
        [backgroundImageView setImage:[UIImage imageNamed:@"tab_bg.png"]];
        [backgroundImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self addSubview:backgroundImageView];
        
        labelForText=[[UILabel alloc]initWithFrame:CGRectMake(60, 40, 200, 20)];
        [labelForText setBackgroundColor:[UIColor clearColor]];
        [labelForText setFont:[UIFont systemFontOfSize:14]];
        [labelForText setTextAlignment:NSTextAlignmentCenter];
        [labelForText setTextColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
        [labelForText setText:@"Pull up to Load More"];
        [labelForText setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self addSubview:labelForText];
        
        activityIndicator=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(120, 10, 80, 80)];
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
        [activityIndicator setColor:[UIColor colorWithRed:23.0/255.0 green:87.0/255.0 blue:123.0/255.0 alpha:1]];
        activityIndicator.hidden=YES;
        [activityIndicator setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self addSubview:activityIndicator];
    }
    return self;
}


@end

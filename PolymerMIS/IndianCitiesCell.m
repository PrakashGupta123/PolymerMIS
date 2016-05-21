//
//  IndianCitiesCell.m
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "IndianCitiesCell.h"

CGSize screenSize;

@implementation IndianCitiesCell

@synthesize labelForCityName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        screenSize=[[UIScreen mainScreen] bounds].size;
        labelForCityName=[[UILabel alloc] init];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    UIInterfaceOrientation toInterfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [labelForCityName setFrame:CGRectMake(0, 15, screenSize.width, 40)];
            
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [labelForCityName setFrame:CGRectMake(0, 15, screenSize.height, 40)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [labelForCityName setFrame:CGRectMake(50, 15, 628, 40)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [labelForCityName setFrame:CGRectMake(50, 15, 884, 40)];
        }
    }
    
    
    [labelForCityName setBackgroundColor:[UIColor clearColor]];
    [labelForCityName setFont:[UIFont boldSystemFontOfSize:18]];
    [labelForCityName setTextColor:[UIColor whiteColor]];
    [labelForCityName setTextAlignment:NSTextAlignmentCenter];
    [self.contentView addSubview:labelForCityName];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

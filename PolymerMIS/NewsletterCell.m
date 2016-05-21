//
//  NewsletterCell.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 07/03/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "NewsletterCell.h"

@implementation NewsletterCell

@synthesize labelForDate, labelForNewsletter;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        labelForDate=[[UILabel alloc] init];
        labelForNewsletter=[[UILabel alloc] init];
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
            [labelForNewsletter setFrame:CGRectMake(15, 0, 290, 30)];
            [labelForDate setFrame:CGRectMake(15, 30, 290, 30)];

            
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [labelForNewsletter setFrame:CGRectMake(15, 0, 400, 30)];
            [labelForDate setFrame:CGRectMake(15, 30, 400, 30)];

        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [labelForNewsletter setFrame:CGRectMake(15, 0, 700, 30)];
            [labelForDate setFrame:CGRectMake(15, 30, 700, 30)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [labelForNewsletter setFrame:CGRectMake(15, 0, 900, 30)];
            [labelForDate setFrame:CGRectMake(15, 30, 900, 30)];
        }
    }
    
    
    
    [labelForNewsletter setBackgroundColor:[UIColor clearColor]];
    [labelForNewsletter setFont:[UIFont systemFontOfSize:18]];
    [labelForNewsletter setTextColor:[UIColor whiteColor]];
    [labelForNewsletter setTextAlignment:NSTextAlignmentLeft];
    [labelForNewsletter setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:labelForNewsletter];
    
    [labelForDate setBackgroundColor:[UIColor clearColor]];
    [labelForDate setFont:[UIFont systemFontOfSize:15]];
    [labelForDate setTextColor:[UIColor whiteColor]];
    [labelForDate setTextAlignment:NSTextAlignmentLeft];
    [labelForDate setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:labelForDate];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

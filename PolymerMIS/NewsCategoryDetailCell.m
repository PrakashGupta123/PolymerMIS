//
//  NewsCategoryDetailCell.m
//  PolymerMIS
//
//  Created by sanchay on 3/4/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "NewsCategoryDetailCell.h"

@implementation NewsCategoryDetailCell
@synthesize labelForDate, labelForNewsContent;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        labelForDate=[[UILabel alloc] init];
        labelForNewsContent=[[UILabel alloc] init];
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
            [labelForNewsContent setFrame:CGRectMake(15, 10, 260, [self getHeightOfLabel:labelForNewsContent])];
            [labelForDate setFrame:CGRectMake(15, 10+labelForNewsContent.bounds.size.height+10, 260, 20)];
            
            [_viewBottom setFrame:CGRectMake(0, 43, self.contentView.frame.size.width, 1)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [labelForNewsContent setFrame:CGRectMake(15, 10, 450, [self getHeightOfLabel:labelForNewsContent])];
            [labelForDate setFrame:CGRectMake(15, 10+labelForNewsContent.bounds.size.height+10, 450, 20)];
            
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [labelForNewsContent setFrame:CGRectMake(15, 10, 738, [self getHeightOfLabel:labelForNewsContent])];
            [labelForDate setFrame:CGRectMake(15, 10+labelForNewsContent.bounds.size.height+10, 738, 20)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [labelForNewsContent setFrame:CGRectMake(15, 10, 994, [self getHeightOfLabel:labelForNewsContent])];
            [labelForDate setFrame:CGRectMake(15, 15+labelForNewsContent.bounds.size.height+10, 994, 20)];
        }
    }

    [labelForNewsContent setBackgroundColor:[UIColor clearColor]];
    [labelForNewsContent setFont:[UIFont systemFontOfSize:18]];
    [labelForNewsContent setTextColor:[UIColor whiteColor]];
    [labelForNewsContent setTextAlignment:NSTextAlignmentLeft];
    [labelForNewsContent setNumberOfLines:10];
    [labelForNewsContent setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:labelForNewsContent];
    
    [labelForDate setBackgroundColor:[UIColor clearColor]];
    [labelForDate setFont:[UIFont systemFontOfSize:15]];
    [labelForDate setTextColor:[UIColor whiteColor]];
    [labelForDate setTextAlignment:NSTextAlignmentLeft];
    [labelForDate setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:labelForDate];
}

-(CGFloat)getHeightOfLabel:(UILabel *)label
{
    CGSize maxSize=CGSizeMake(260, 9999);
    CGSize size=[label.text sizeWithFont:label.font constrainedToSize:maxSize lineBreakMode:label.lineBreakMode];
     return size.height+5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

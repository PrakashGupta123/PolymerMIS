//
//  NewsCategoryCell.m
//  PolymerMIS
//
//  Created by sanchay on 3/2/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "NewsCategoryCell.h"

@implementation NewsCategoryCell

@synthesize textLabelForCategory;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        textLabelForCategory=[[UILabel alloc] init];
       // _viewBottom=[[UIView alloc]init];
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
            [textLabelForCategory setFrame:CGRectMake(30, 15, 260, 40)];
            [_viewBottom setFrame:CGRectMake(0, 39, self.contentView.frame.size.width, 1)];
            
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [textLabelForCategory setFrame:CGRectMake(30, 15, 420, 40)];
            
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [textLabelForCategory setFrame:CGRectMake(30, 15, 708, 40)];
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [textLabelForCategory setFrame:CGRectMake(30, 15, 964, 40)];
        }
    }
    [_viewBottom setBackgroundColor:[UIColor blackColor]];

    
    [textLabelForCategory setBackgroundColor:[UIColor clearColor]];
    [textLabelForCategory setFont:[UIFont boldSystemFontOfSize:18]];
    [textLabelForCategory setTextColor:[UIColor whiteColor]];
    [textLabelForCategory setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:_viewBottom];
    [self.contentView addSubview:textLabelForCategory];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

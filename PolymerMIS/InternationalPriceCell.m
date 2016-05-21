//
//  InternationalPriceCell.m
//  PolymerMIS
//
//  Created by SUYASH-MAC on 07/03/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "InternationalPriceCell.h"

CGSize screenSize;

@implementation InternationalPriceCell

@synthesize firstLabel,secondLabel,thirdLabel,fourthLabel,shoeimg;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        screenSize=[[UIScreen mainScreen] bounds].size;
        firstLabel=[[UILabel alloc] init];
        secondLabel=[[UILabel alloc]init];
        thirdLabel=[[UILabel alloc]init];
        fourthLabel =[[UILabel alloc]init];
        _firstLabel11=[[UILabel alloc]init];
        _secondLabel22=[[UILabel alloc]init];
        _thirdLabel33 =[[UILabel alloc]init];
        shoeimg = [[UIImageView alloc] init];
        
        
        [self.contentView setAutoresizesSubviews:YES];
        self.contentView.autoresizingMask=UIViewAutoresizingFlexibleWidth;
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
            [firstLabel setFrame:CGRectMake(10, (self.frame.size.height-[self getHeightOfLabel:firstLabel])/2, 74, [self getHeightOfLabel:firstLabel])];
            [secondLabel setFrame:CGRectMake(95, firstLabel.frame.origin.y, 80, firstLabel.frame.size.height)];
            [thirdLabel setFrame:CGRectMake(180, firstLabel.frame.origin.y, screenSize.width-240-15, firstLabel.bounds.size.height)];
            [fourthLabel setFrame:CGRectMake(255, firstLabel.frame.origin.y, screenSize.width-240, firstLabel.bounds.size.height)];
            
            [_firstLabel11 setFrame:CGRectMake(85,0,1,self.contentView.frame.size.height)];
            [_secondLabel22 setFrame:CGRectMake(170,0,1,self.contentView.frame.size.height)];

            [_thirdLabel33 setFrame:CGRectMake(245,0,1,self.contentView.frame.size.height)];
            
             // shoeimg.frame = CGRectMake(_thirdLabel33.frame.origin.x+_thirdLabel33.frame.size.width-10, 0, 15, 15);
            
            shoeimg.frame = CGRectMake(thirdLabel.frame.origin.x+2+thirdLabel.frame.size.width-15, self.contentView.frame.size.height/2-4, 10, 10);
            

        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [firstLabel setFrame:CGRectMake(10, (self.frame.size.height-[self getHeightOfLabel:firstLabel])/2, (screenSize.height-30)/3, [self getHeightOfLabel:firstLabel])];
            [secondLabel setFrame:CGRectMake(firstLabel.frame.origin.x+((screenSize.height-30)/3), firstLabel.frame.origin.y, (screenSize.height-30)/3, firstLabel.frame.size.height)];
            [thirdLabel setFrame:CGRectMake(secondLabel.frame.origin.x+((screenSize.height-30)/3), firstLabel.frame.origin.y-5, (screenSize.height-30)/3, firstLabel.bounds.size.height)];
            [fourthLabel setFrame:CGRectMake(secondLabel.frame.origin.x+((screenSize.height-30)/3), firstLabel.frame.origin.y+6, (screenSize.height-30)/3, firstLabel.bounds.size.height)];
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [firstLabel setFrame:CGRectMake(20, (self.frame.size.height-[self getHeightOfLabel:firstLabel])/2, 120, [self getHeightOfLabel:firstLabel])];
            [secondLabel setFrame:CGRectMake(222, firstLabel.frame.origin.y, 250, firstLabel.frame.size.height)];
            [thirdLabel setFrame:CGRectMake(495, firstLabel.frame.origin.y, 60, firstLabel.bounds.size.height)];
            [fourthLabel setFrame:CGRectMake(655, firstLabel.frame.origin.y, 168, firstLabel.bounds.size.height)];
            
            [_firstLabel11 setFrame:CGRectMake(200,0,1,self.contentView.frame.size.height)];
            [_secondLabel22 setFrame:CGRectMake(475,0,1,self.contentView.frame.size.height)];
            
            [_thirdLabel33 setFrame:CGRectMake(635,0,1,self.contentView.frame.size.height)];
            
            
             shoeimg.frame = CGRectMake(555,self.contentView.frame.size.height/2-4, 10, 10);
            shoeimg.frame = CGRectMake(555, self.contentView.frame.size.height/2-4, 10, 10);

            
        }
        
        
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [firstLabel setFrame:CGRectMake(10, (self.frame.size.height-[self getHeightOfLabel:firstLabel])/2, 190, [self getHeightOfLabel:firstLabel])];
            [secondLabel setFrame:CGRectMake(320, firstLabel.frame.origin.y, 340, firstLabel.frame.size.height)];
            [thirdLabel setFrame:CGRectMake(685, firstLabel.frame.origin.y-5, 289, firstLabel.bounds.size.height)];
            [fourthLabel setFrame:CGRectMake(685, firstLabel.frame.origin.y+6, 289, firstLabel.bounds.size.height)];
        }
    }

    
   
    [_firstLabel11 setBackgroundColor:[UIColor blackColor]];
    [_secondLabel22 setBackgroundColor:[UIColor blackColor]];
    [_thirdLabel33 setBackgroundColor:[UIColor blackColor]];


    

    [self.contentView addSubview:_firstLabel11];
    [self.contentView addSubview:_secondLabel22];
    [self.contentView addSubview:_thirdLabel33];
    [self.contentView addSubview:shoeimg];


    
    [firstLabel setBackgroundColor:[UIColor clearColor]];
    [firstLabel setFont:[UIFont boldSystemFontOfSize:10]];
    [firstLabel setTextColor:[UIColor whiteColor]];
    
    [firstLabel setTextAlignment:NSTextAlignmentLeft];
    [firstLabel setNumberOfLines:5];
    [firstLabel setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
    [firstLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:firstLabel];
    
    
    [secondLabel setBackgroundColor:[UIColor clearColor]];
    [secondLabel setFont:[UIFont boldSystemFontOfSize:10]];
    [secondLabel setTextColor:[UIColor whiteColor]];
    [secondLabel setTextAlignment:NSTextAlignmentLeft];
    [secondLabel setNumberOfLines:5];
    
    [secondLabel setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
    [secondLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:secondLabel];
    
    
    [thirdLabel setBackgroundColor:[UIColor clearColor]];
    [thirdLabel setFont:[UIFont boldSystemFontOfSize:10]];
    [thirdLabel setTextColor:[UIColor whiteColor]];
    [thirdLabel setTextAlignment:NSTextAlignmentLeft];
    [thirdLabel setNumberOfLines:5];
    
    [thirdLabel setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin];
    [thirdLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:thirdLabel];
    
    
    [fourthLabel setBackgroundColor:[UIColor clearColor]];
    [fourthLabel setFont:[UIFont boldSystemFontOfSize:10]];
    [fourthLabel setTextColor:[UIColor whiteColor]];
    [fourthLabel setTextAlignment:NSTextAlignmentLeft];
    [fourthLabel setNumberOfLines:5];
    
    [fourthLabel setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin];
    
    [fourthLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:fourthLabel];

    
}

-(CGFloat)getHeightOfLabel:(UILabel *)label
{
    CGSize maxSize=CGSizeMake(80, 9999);
    CGSize size=[label.text sizeWithFont:label.font constrainedToSize:maxSize lineBreakMode:label.lineBreakMode];
    return size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

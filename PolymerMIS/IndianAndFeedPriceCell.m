//
//  IndianAndFeedPriceCell.m
//  PolymerMIS
//
//  Created by Hashim on 3/6/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "IndianAndFeedPriceCell.h"

CGSize screenSize;

@implementation IndianAndFeedPriceCell

@synthesize firstLabel,secondLabel,thirdLabel,shoeimg,shoeimg11;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        screenSize=[[UIScreen mainScreen] bounds].size;
        firstLabel=[[UILabel alloc] init];
        secondLabel=[[UILabel alloc]init];
        thirdLabel=[[UILabel alloc]init];
        _firstLabel11=[[UILabel alloc] init];
        _secondLabel22=[[UILabel alloc]init];
        shoeimg = [[UIImageView alloc] init];
        shoeimg11 = [[UIImageView alloc] init];
        
        [self.contentView setAutoresizingMask:YES];
        
    }
    return self;
}

-(void)layoutSubviews
{
    
    UIInterfaceOrientation toInterfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
   
    {
        
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [firstLabel setFrame:CGRectMake(10, 10, 150, 20)];
            [secondLabel setFrame:CGRectMake(175, 10, 60, 20)];
            [thirdLabel setFrame:CGRectMake(255, 10, screenSize.width-200-20, 20)];


             [_firstLabel11 setFrame:CGRectMake(165, 0, 1, self.contentView.frame.size.height)];
            [_secondLabel22 setFrame:CGRectMake(245, 0, 1, self.contentView.frame.size.height)];

            
            
             shoeimg.frame = CGRectMake(232, self.contentView.frame.size.height/2-5, 10, 10);
            
               shoeimg11.frame = CGRectMake(303, self.contentView.frame.size.height/2-5, 10, 10);
            
            
         //imgView.image = [UIImage imageNamed:@"image.png"];
            

            
            
            
        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [firstLabel setFrame:CGRectMake(10, 10, 180, 20)];
            [secondLabel setFrame:CGRectMake(360, 5, screenSize.height-360-20, 20)];
             [thirdLabel setFrame:CGRectMake((screenSize.width/2)-50, 5, screenSize.height-360-20, 20)];
            
           
            
            
            
            
            
        }
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if((toInterfaceOrientation==UIInterfaceOrientationPortrait)||(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        {
            [firstLabel setFrame:CGRectMake(20, 10, 354, 20)];
            [thirdLabel setFrame:CGRectMake(655, 10, 70, 20)];
            
                      //[secondLabel setFrame:CGRectMake(354, 18, 354, 20)];
            [secondLabel setFrame:CGRectMake(495, 10, 60, 20)];
          
            [_firstLabel11 setFrame:CGRectMake(475, 0, 1, self.contentView.frame.size.height)];
            [_secondLabel22 setFrame:CGRectMake(635, 0, 1, self.contentView.frame.size.height)];
            
            shoeimg.frame = CGRectMake(555, self.contentView.frame.size.height/2-5                              , 10, 10);
            
            shoeimg11.frame = CGRectMake(725, self.contentView.frame.size.height/2-5, 10, 10);
            


        }
        else if((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight))
        {
            [firstLabel setFrame:CGRectMake(10, 10, 482, 20)];
            [secondLabel setFrame:CGRectMake(482, 5, 482, 20)];
            [thirdLabel setFrame:CGRectMake(482, 18, 482, 20)];

        }
    }
    
    
    
    
    [super layoutSubviews];
   
    [firstLabel setBackgroundColor:[UIColor clearColor]];
    [firstLabel setFont:[UIFont boldSystemFontOfSize:10]];
    [firstLabel setTextColor:[UIColor whiteColor]];
    [_firstLabel11 setBackgroundColor:[UIColor blackColor]];
    [_secondLabel22 setBackgroundColor:[UIColor blackColor]];

    //[firstLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [firstLabel setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:firstLabel];
   
    [self.contentView addSubview:_firstLabel11];

    [self.contentView addSubview:_secondLabel22];

    [secondLabel setBackgroundColor:[UIColor clearColor]];
    [secondLabel setFont:[UIFont boldSystemFontOfSize:10]];
    //[secondLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [secondLabel setTextColor:[UIColor whiteColor]];
    [secondLabel setTextAlignment:NSTextAlignmentLeft];
   
    [self.contentView addSubview:secondLabel];
    [self.contentView addSubview:shoeimg];
    [self.contentView addSubview:shoeimg11];

    
    [thirdLabel setBackgroundColor:[UIColor clearColor]];
    [thirdLabel setFont:[UIFont boldSystemFontOfSize:10]];
    //[secondLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [thirdLabel setTextColor:[UIColor whiteColor]];
    [thirdLabel setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:thirdLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

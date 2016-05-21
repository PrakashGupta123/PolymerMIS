//
//  NewsletterCell.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 07/03/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsletterCell : UITableViewCell
{
    UILabel *labelForNewsletter;
    UILabel *labelForDate;
}

@property(nonatomic,strong) UILabel *labelForNewsletter;
@property(nonatomic,strong) UILabel *labelForDate;

@end

//
//  NewsCategoryDetailCell.h
//  PolymerMIS
//
//  Created by sanchay on 3/4/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCategoryDetailCell : UITableViewCell

{
    UILabel *labelForNewsContent;
    UILabel *labelForDate;
}

@property(nonatomic,strong) UILabel *labelForNewsContent;
@property(nonatomic,strong) UILabel *labelForDate;
@property(nonatomic,strong)UIView *viewBottom;

-(CGFloat)getHeightOfLabel:(UILabel *)label;

@end

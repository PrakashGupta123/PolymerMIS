//
//  NewsCategoryCell.h
//  PolymerMIS
//
//  Created by sanchay on 3/2/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCategoryCell : UITableViewCell

{
    UILabel *textLabelForCategory;
}

@property(nonatomic,strong)UILabel *textLabelForCategory;
@property(nonatomic,strong)UIView *viewBottom;


@end

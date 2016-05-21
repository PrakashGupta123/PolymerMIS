//
//  InternationalPriceCell.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 07/03/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InternationalPriceCell : UITableViewCell

{
    UILabel *firstLabel;
    UILabel *secondLabel;
    UILabel *thirdLabel;
}

@property(nonatomic,strong) UILabel *firstLabel;
@property(nonatomic,strong) UILabel *secondLabel;
@property(nonatomic,strong) UILabel *thirdLabel;
@property(nonatomic,strong) UILabel *fourthLabel;
@property(nonatomic,strong) UILabel *firstLabel11;
@property(nonatomic,strong) UILabel *secondLabel22;
@property(nonatomic,strong) UILabel *thirdLabel33;
@property(nonatomic,strong) UIImageView *shoeimg;

-(CGFloat)getHeightOfLabel:(UILabel *)label;

@end

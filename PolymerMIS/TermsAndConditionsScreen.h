//
//  TermsAndConditionsScreen.h
//  PolymerMIS
//
//  Created by SUYASH-MAC on 25/02/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OHAttributedLabel.h"
#import "PolymerMISAppDelegate.h"

@interface TermsAndConditionsScreen : UIViewController<UITableViewDataSource,UITableViewDataSource>

{
    UILabel *headerLabel;
    UIScrollView *scrollView;
    UIButton *buttonAccept;
    UIButton *buttonDecline;
    OHAttributedLabel *label;
    UIButton *checkBoxButton;
    PolymerMISAppDelegate *appDelegate;

    UILabel *labelIAccept;
}

@property(nonatomic,strong)IBOutlet UILabel *headerLabel;
@property(nonatomic,strong)IBOutlet UILabel *lblAccept;
@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)IBOutlet UIButton *buttonAccept;
@property(nonatomic,strong)IBOutlet UIButton *buttonDecline;
@property(nonatomic,strong)IBOutlet UIButton *checkBoxButton;
@property(nonatomic,strong)IBOutlet UILabel *labelIAccept;
@property(strong,nonatomic)IBOutlet UIView *viewradius;
@property (weak, nonatomic) IBOutlet UIButton *MenuBtn;

@property (weak, nonatomic) IBOutlet UITableView *MenuTable;
@property (weak, nonatomic) IBOutlet UITableView *MenutableIpad;

- (IBAction)MenuBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *uiviuu;



-(IBAction)ActionOnAccept:(id)sender;
-(IBAction)ActionOnCheckBox:(id)sender;

@end

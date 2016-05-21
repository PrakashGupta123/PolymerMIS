//
//  Notification.h
//  PolymerMIS
//
//  Created by Admin on 05/03/16.
//  Copyright © 2016 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Notification : UIViewController
{
    
}
@property(nonatomic,strong)IBOutlet UILabel *date;
@property(nonatomic,strong)IBOutlet UILabel *content;
@property(nonatomic,strong)IBOutlet UILabel *url;

@property(nonatomic,strong) IBOutlet UILabel *titleValue;

-(IBAction)actionOnBackButton:(id)sender;

@property (nonatomic,strong)NSDictionary *DictNoti;
@end

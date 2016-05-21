//
//  Notification.m
//  PolymerMIS
//
//  Created by Admin on 05/03/16.
//  Copyright © 2016 Syscraft. All rights reserved.
//

#import "Notification.h"
#import "PolymerMISAppDelegate.h"


@interface Notification ()

@end

@implementation Notification
@synthesize title,date,content,url;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dictNotinew=[[NSMutableDictionary alloc] init];
    

    
    
    dictNotinew=[self.DictNoti valueForKey:@"aps"];
    
//    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"alert Noti" message:[NSString stringWithFormat:@"%@",dictNotinew] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//    [alertView show];
    
    if ([dictNotinew valueForKey:@"content"] != nil)
    {
        content.text=[dictNotinew valueForKey:@"content"];
        
    }
     if ([dictNotinew valueForKey:@"news_url"] != nil)
    {
        url.text=[dictNotinew valueForKey:@"news_url"];
        
    }
     if ([dictNotinew valueForKey:@"title"]!=nil)
    {
        _titleValue.text=[dictNotinew valueForKey:@"title"];
        
    }
     if ([dictNotinew valueForKey:@"date"]!=nil)
    {
        date.text=[dictNotinew valueForKey:@"date"];
        
    }
    

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


    // Dispose of any resources that can be recreated.
}
-(IBAction)actionOnBackButton:(id)sender
{
    
    
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        

    
 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

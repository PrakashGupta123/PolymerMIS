//
//  TransparentView.m
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import "TransparentView.h"

@implementation TransparentView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([self.delegate respondsToSelector:@selector(removeAllSubviews)])
    {
        [self.delegate removeAllSubviews];
    }
}

@end

//
//  TransparentView.h
//  PolymerMIS
//
//  Created by sanchay on 3/5/13.
//  Copyright (c) 2013 Syscraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TransparentViewDelegate <NSObject>

@required

-(void)removeAllSubviews;

@end

@interface TransparentView : UIView

@property(nonatomic,assign)id<TransparentViewDelegate> delegate;

@end

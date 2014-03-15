//
//  ActivityIndicatorView.h
//  dineStop
//
//  Created by Krishna Das on 15/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActivityIndicatorView : UIView
+ (id)sharedManager;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
- (void)showActivityIndicator:(UIView *)view;
- (void)hideActivityIndicator;
@end

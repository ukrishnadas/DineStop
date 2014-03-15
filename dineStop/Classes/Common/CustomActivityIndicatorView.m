//
//  ActivityIndicatorView.m
//  dineStop
//
//  Created by Krishna Das on 15/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import "CustomActivityIndicatorView.h"

@implementation CustomActivityIndicatorView

+ (id)sharedManager {
    static CustomActivityIndicatorView *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedMyManager;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _activityIndicator = [[UIActivityIndicatorView alloc] init];
        _activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [_activityIndicator setFrame:CGRectMake((frame.size.width/2)-(_activityIndicator.frame.size.width/2), (frame.size.height/2)-(_activityIndicator.frame.size.height/2), _activityIndicator.frame.size.width, _activityIndicator.frame.size.height)];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setAlpha:0.5];
        [self addSubview:_activityIndicator];
    }
    return self;
}

- (void)showActivityIndicator:(UIView *)view{
    [_activityIndicator startAnimating];
    [view addSubview:self];
}

- (void)hideActivityIndicator{
    [_activityIndicator stopAnimating];
    [self removeFromSuperview];
    
}

@end

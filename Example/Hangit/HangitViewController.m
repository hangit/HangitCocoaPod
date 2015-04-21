//
//  HangitViewController.m
//  Hangit
//
//  Created by John Dutchak on 04/21/2015.
//  Copyright (c) 2014 John Dutchak. All rights reserved.
//

#import "HangitViewController.h"

@interface HangitViewController ()

@end

@implementation HangitViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.sessionManager = [SessionManager sharedInstance];
    self.sessionManager.delegate = self;
    self.sessionManager.presentNotifications = YES;
    self.sessionManager.presentOfferView = YES;
    
    self.sessionKey = [self.sessionManager startSessionUsingLocation:@"YOURAPPID"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(messageViewedNotification:)
                                                 name:@"hangitMessageViewed"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(locationNotification:)
                                                 name:@"hangitLocationNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inBounds:)
                                                 name:@"hangitInBounds"
                                               object:nil];
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(showMap)
                                   userInfo:nil
                                    repeats:NO];
    
    
}

/* Hangit Location Module */

- (void) messageViewedNotification:(NSNotification *)notification {
    
    if ([notification object]) {
        
        NSLog(@"message viewed callback: %@", [notification object]);
        
    }
    
}

- (void) locationNotification:(NSNotification *)notification{
    
    if ([notification object]) {
        
        CLLocation * location = [[notification object] objectForKey:@"Location"];
        
        NSLog(@"location callback: %@", location);
        
    }
    
}

- (void) inBounds:(NSNotification *)notification {
    
    if ([notification object]) {
        
        NSLog(@"in bounds area callback: %@", [notification object]);
        
    }
    
}

- (void)showMap {
    
    /* Show Hangit Map Module */
    
    self.mapManager = [[MapManager alloc] initWithNibName:@"MapManager"
                                                   bundle:[NSBundle bundleWithPath:[[NSBundle mainBundle]
                                                                                    pathForResource:@"HangitSDKResources"
                                                                                    ofType:@"bundle"]]];
    
    self.mapManager.view.frame = CGRectMake(0,20,
                                            [[UIScreen mainScreen] bounds].size.width,
                                            [[UIScreen mainScreen] bounds].size.height-20);
    
    self.mapManager.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.mapManager.view];
    
    /* End Show Hangit Map Module */
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end

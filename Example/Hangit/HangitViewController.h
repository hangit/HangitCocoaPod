//
//  HangitViewController.h
//  Hangit
//
//  Created by John Dutchak on 04/21/2015.
//  Copyright (c) 2014 John Dutchak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HangitSDK/HangitSDK.h>

@interface HangitViewController : UIViewController <SessionManagerDelegate>

/* Hangit SessionManager */
@property (nonatomic, strong) SessionManager *sessionManager;

/* Hangit MapManager */
@property (nonatomic, strong) MapManager *mapManager;

/* Hangit sessionKey Property */
@property (nonatomic, retain) NSString * sessionKey;


@end

//
//  MainViewController.h
//  CheckMyModel
//
//  Created by Антон Аверкиев on 22.06.14.
//  Copyright (c) 2014 Anton Averkiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MainViewController : UIViewController <UITextFieldDelegate,MFMailComposeViewControllerDelegate>

- (IBAction)createEmail;

@end

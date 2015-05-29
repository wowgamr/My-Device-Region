//
//  PageContentViewController.h
//  CheckMyModel
//
//  Created by Антон Аверкиев on 22.06.14.
//  Copyright (c) 2014 Anton Averkiev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end

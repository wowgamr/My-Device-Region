//
//  ViewController.h
//  CheckMyModel
//
//  Created by Антон Аверкиев on 21.06.14.
//  Copyright (c) 2014 Anton Averkiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end

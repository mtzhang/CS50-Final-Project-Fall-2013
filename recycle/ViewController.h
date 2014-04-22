


//
//  ViewController.h
//  recycle
//
//  Created by Mengting Zhang on 12/5/13.
//  Copyright (c) 2013 Karen Kennedy & Mengting Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MessageUI/MessageUI.h>



@interface ViewController : UIViewController <UISearchBarDelegate>

// initialize buttons, search bar, and ResultViewController

@property (strong, nonatomic) IBOutlet UIButton *notFound;

@property (strong, nonatomic) IBOutlet UIButton *recCategories;

@property (strong, nonatomic) IBOutlet UILabel *Title;

@property (strong, nonatomic) IBOutlet UISearchBar *mySearchBar;

@property(strong,nonatomic)UISplitViewController *ResultViewController;


@end

//
//  ResultViewController.h
//  recycle
//
//  Created by Mengting Zhang on 12/5/13.
//  Copyright (c) 2013 Karen Kennedy & Mengting Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ResultViewController : UIViewController

// initialize buttons and array
@property (strong, nonatomic) IBOutlet UILabel *itemLabel;
@property (strong, nonatomic) IBOutlet UILabel *locLabel;
@property (strong, nonatomic) IBOutlet UILabel *recLabel;
@property (strong, nonatomic) IBOutlet UILabel *Item;
@property (strong, nonatomic) IBOutlet UILabel *Recyclable;
@property (strong, nonatomic) IBOutlet UILabel *Where;

@property (strong, nonatomic) NSArray *array;

@end

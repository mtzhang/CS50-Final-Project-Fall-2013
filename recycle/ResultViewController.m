//
//  ResultViewController.m
//  recycle
//
//  Created by Mengting Zhang on 12/5/13.
//  Copyright (c) 2013 Karen Kennedy & Mengting Zhang. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", self.array[0]);
    
    // display values in the labels for the keys of the specified object in the array
    _itemLabel.text = [self.array[0] objectForKey:@"item"];
    _recLabel.text = [self.array[0] objectForKey:@"recyclable"];
    _locLabel.text = [self.array[0] objectForKey:@"location"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

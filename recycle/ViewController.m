
//
//  ViewController.m
//  recycle
//
//  Created by Mengting Zhang on 12/5/13.
//  Copyright (c) 2013 Karen Kennedy & Mengting Zhang. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"


@interface ViewController ()
{
    NSMutableArray *totalStrings;
    NSMutableArray *filteredStrings;
    BOOL isFiltered;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	
    // add search bar
    _mySearchBar.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    // keyboard movements and aesthetics
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    CGRect rect = self.view.bounds;
    self.view.frame = CGRectMake(0, -160, rect.size.width, rect.size.height);
    [UIView commitAnimations];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // keyboard movements and aesthetics
    [self.mySearchBar resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    CGRect rect = self.view.bounds;
    self.view.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [UIView commitAnimations];
    
    // pull text from textfield and store it in a NSString
    NSString *trash = self.mySearchBar.text;
    
    // query for the NSString with Parse
    PFQuery *query = [PFQuery queryWithClassName:@"recyclables"];
    [query whereKey:@"item" equalTo:trash];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            // if NSString entered is not in data base
            if (objects.count == 0)
            {
                // alert the user of invalid entry
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Invalid Entry" message: @"Sorry! We don't have information on that item. Try again!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            else
            {
                // The find succeeded.
                NSLog(@"Successfully retrieved %lu info.", (unsigned long)objects.count);
                // Load new view controller to display answers
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]];
                ResultViewController *resultViewController = [storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
                // pass the object containing info on the item to the new view controller
                resultViewController.array = objects;
                [self.navigationController pushViewController:resultViewController animated:YES];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


@end

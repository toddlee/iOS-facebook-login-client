//
//  ViewController.m
//  FacebookLogin
//
//  Created by todd on 12/29/12.
//  Copyright (c) 2012 tonyandy. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    FBLoginView *loginview = [[FBLoginView alloc] init];
    
    loginview.center = self.view.center;
    loginview.delegate = self;
    
    [self.view addSubview:loginview];
    
    [loginview sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"Logged in user: %@", user);
    NSLog(@"Access token: %@", [[FBSession activeSession] accessToken]);
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
}
@end

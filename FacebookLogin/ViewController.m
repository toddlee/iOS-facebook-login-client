//
//  ViewController.m
//  FacebookLogin
//
//  Created by todd on 12/29/12.
//  Copyright (c) 2012 tonyandy. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
- (void)authenticateOnServerSide:(NSString *)accessToken;
@end

@implementation ViewController

- (void)authenticateOnServerSide:(NSString *)accessToken
{
    NSURL *url = [NSURL URLWithString:@"http://testserver.dev/auth/facebook_access_token/callback"];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
    
    NSString *params = [NSString stringWithFormat:@"access_token=%@", accessToken];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLResponse *res;
        NSError *err;
        [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
        if (!err) {
            NSLog(@"The user is logged in on the server side too");
        } else {
            NSLog(@"Error occurred. %@", err);
        }
    });    
}

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
    
    NSString *accessToken = [[FBSession activeSession] accessToken];
    NSLog(@"Access token: %@", accessToken);
    
    // Now POST to the server.
    [self authenticateOnServerSide:accessToken];
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    NSLog(@"Showing Logged In User: %@", [[FBSession activeSession] accessToken]);
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
}
@end

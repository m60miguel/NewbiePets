//
//  ViewController.h
//  Runner
//
//  Created by AppleAir on 11/1/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#ifndef ViewController_h
#define ViewController_h
#import <UIKit/UIKit.h>
@import GoogleSignIn;
@interface ViewController : UIViewController<GIDSignDelegate, GIDSignInUIDelegate>
@property (weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *signOutButton;

- (IBAction)signOutClicked:(id)sender;

@end


#endif /* ViewController_h */

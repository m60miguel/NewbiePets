#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      // Use Firebase library to configure APIs
      [FIRApp configure];

      [GIDSignIn sharedInstance].clientID = [FIRApp defaultApp].options.clientID;
      [GIDSignIn sharedInstance].delegate = self;

      [GeneratedPluginRegistrant registerWithRegistry:self];
      // Override point for customization after application launch.
      [GMSServices provideAPIKey: @"AIzaSyC9-sgdyL2l0HHjU-GbHPiDOoyTXNaTYtM"];

      return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)application:(nonnull UIApplication *)application
            openURL:(nonnull NSURL *)url
            options:(nonnull NSDictionary<NSString *, id> *)options {
  return [[GIDSignIn sharedInstance] handleURL:url
         sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
  return [[GIDSignIn sharedInstance] handleURL:url
                             sourceApplication:sourceApplication
                                    annotation:annotation];
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
  // ...
  if (error == nil) {
    GIDAuthentication *authentication = user.authentication;
    FIRAuthCredential *credential =
    [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken
                                     accessToken:authentication.accessToken];
    // ...
  } else {
    // ...
  }
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
  // Perform any operations when the user disconnects from app here.
  // ...
}

@end

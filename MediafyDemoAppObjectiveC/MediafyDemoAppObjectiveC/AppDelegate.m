/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */
 

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // ===== INIT: Mediafy SDK
    
    [Mediafy initializeSDKWithAccountSettings:@"bid=56maxa"];
    
    // ===== INIT: Google Mobile Ads SDK
    
    // Initialize GoogleMobileAds SDK
    [GADMobileAds.sharedInstance startWithCompletionHandler:nil];
    
    // ===== INIT: MediafyAdMobAdapter
    [MediafyGADMediationAdapterInitializer start];
    
    // ===== INIT: AppLovin MAX SDK
    
    ALSdkInitializationConfiguration * config = [ALSdkInitializationConfiguration configurationWithSdkKey:@"<SDK_KEY>"];
    [ALSdk.shared initializeWithConfiguration:config
                            completionHandler:^(ALSdkConfiguration * _Nonnull configuration) {}];
    
    return YES;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application
configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                              options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration"
                                          sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {}

@end

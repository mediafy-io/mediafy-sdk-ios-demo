/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "MediafyMultiformatInterstitialViewController.h"

@interface MediafyMultiformatInterstitialViewController ()

@property (nonatomic) MediafyInterstitialAdUnit * interstitialAdUnit;

@end

@implementation MediafyMultiformatInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a MediafyInterstitialAdUnit
    self.interstitialAdUnit = [[MediafyInterstitialAdUnit alloc] init];
    
    // 2. Configure the MediafyInterstitialAdUnit
    self.interstitialAdUnit.delegate = self;
    self.interstitialAdUnit.adSizes = @[[NSValue valueWithCGSize:CGSizeMake(320, 480)], [NSValue valueWithCGSize:CGSizeMake(1024, 768)]];
    
    // 3. Load the interstitial ad
    [self.interstitialAdUnit loadAd];
}


// MARK: - MediafyInterstitialAdUnitDelegate

- (void)interstitial:(MediafyInterstitialAdUnit *)interstitial didFailToReceiveAdWithError:(NSError *)error {
    // Called when Mediafy SDK failed to load ad
    NSLog(@"Did fail to receive ad with error: %@", error.localizedDescription);
}

- (void)interstitialDidReceiveAd:(MediafyInterstitialAdUnit *)interstitial {
    // Called when ad is loaded
    [interstitial showFrom:self];
}

- (void)interstitialWillPresentAd:(MediafyInterstitialAdUnit *)interstitial {
    // Called when interstitial is about to be presented
}

- (void)interstitialDidDismissAd:(MediafyInterstitialAdUnit *)interstitial {
    // Called when interstitial is dismissed
}

- (void)interstitialDidClickAd:(MediafyInterstitialAdUnit *)interstitial {
    // Called when interstitial was clicked
}

- (void)interstitialWillLeaveApplication:(MediafyInterstitialAdUnit *)interstitial {
    // Called when the application is about to enter the background
}

@end

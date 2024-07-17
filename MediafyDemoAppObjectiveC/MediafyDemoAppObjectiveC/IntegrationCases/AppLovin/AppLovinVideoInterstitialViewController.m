/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "AppLovinVideoInterstitialViewController.h"

@interface AppLovinVideoInterstitialViewController ()

@property (nonatomic) MAInterstitialAd * interstitialAd;

@end

@implementation AppLovinVideoInterstitialViewController

- (NSString *)adUnitId {
    return @"<AD_UNIT_ID>";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a MAInterstitialAd
    self.interstitialAd = [[MAInterstitialAd alloc] initWithAdUnitIdentifier:self.adUnitId];
    
    // 2. Configure the MAInterstitialAd
    self.interstitialAd.delegate = self;
    
    // 3. Load the ad
    [self.interstitialAd loadAd];
}

// MARK: - MAAdDelegate

- (void)didLoadAd:(MAAd *)ad {
    if (self.interstitialAd != nil && self.interstitialAd.isReady) {
        [self.interstitialAd showAd];
    }
}

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withError:(MAError *)error {
    NSLog(@"Did fail to load ad with error: %@", error.message);
}

- (void)didFailToDisplayAd:(MAAd *)ad withError:(MAError *)error {
    NSLog(@"Did fail to display ad with error: %@", error.message);
}

- (void)didDisplayAd:(MAAd *)ad {}
- (void)didHideAd:(MAAd *)ad {}
- (void)didClickAd:(MAAd *)ad {}

@end

/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "AppLovinBannerAdViewController.h"

@interface AppLovinBannerAdViewController ()

@property (nonatomic) MAAdView * maAdView;

@end

@implementation AppLovinBannerAdViewController

- (NSString *)adUnitId {
    return @"<AD_UNIT_ID>";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Update the constraints of the container view
    self.containerWidthConstraint.constant = 320;
    self.containerHeightConstraint.constant = 50;
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a MAAdView
    self.maAdView = [[MAAdView alloc] initWithAdUnitIdentifier:self.adUnitId adFormat:MAAdFormat.banner];
    
    // 2. Configure the MAAdView
    self.maAdView.delegate = self;
    self.maAdView.frame = CGRectMake(0, 0, 320, 50);
    
    // Add AppLovin SDK ad view to the app UI
    [self.containerAdView addSubview:self.maAdView];
    
    // 3. Load the ad
    [self.maAdView loadAd];
}

// MARK: - MAAdViewAdDelegate

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withError:(MAError *)error {
    NSLog(@"Did fail to load ad with error: %@", error.message);
}

- (void)didFailToDisplayAd:(MAAd *)ad withError:(MAError *)error {
    NSLog(@"Did fail to display ad with error: %@", error.message);
}

- (void)didLoadAd:(MAAd *)ad {}
- (void)didExpandAd:(MAAd *)ad {}
- (void)didCollapseAd:(MAAd *)ad {}
- (void)didDisplayAd:(MAAd *)ad {}
- (void)didHideAd:(MAAd *)ad {}
- (void)didClickAd:(MAAd *)ad {}

@end

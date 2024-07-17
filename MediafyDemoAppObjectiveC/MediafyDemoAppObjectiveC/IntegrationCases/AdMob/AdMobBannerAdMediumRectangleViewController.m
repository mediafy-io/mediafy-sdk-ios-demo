/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "AdMobBannerAdMediumRectangleViewController.h"

@interface AdMobBannerAdMediumRectangleViewController ()

@property (nonatomic) GADBannerView * gadBannerView;

@end

@implementation AdMobBannerAdMediumRectangleViewController

- (NSString *)adUnitId {
    return @"ca-app-pub-2844566227051243/1179559889";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a GADBannerView
    self.gadBannerView = [[GADBannerView alloc] initWithAdSize:GADAdSizeMediumRectangle];
    
    // 2. Configure the GADBannerView
    self.gadBannerView.adUnitID = self.adUnitId;
    self.gadBannerView.delegate = self;
    self.gadBannerView.rootViewController = self;
    
    // Add GMA SDK banner view to the app UI
    [self.containerAdView addSubview:self.gadBannerView];
    
    // 3. Load ad
    [self.gadBannerView loadRequest:[GADRequest new]];
}


// MARK: - GADBannerViewDelegate

- (void)bannerView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Did fail to receive ad with error: %@", error.localizedDescription);
}

@end

/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "MediafyBannerAdViewController.h"

@interface MediafyBannerAdViewController ()

@property (nonatomic) MediafyAdView * adView;

@end

@implementation MediafyBannerAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a MediafyAdView
    self.adView = [[MediafyAdView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    // 2. Configure the MediafyAdView
    self.adView.delegate = self;
    [self.adView setAdSizes:@[[NSValue valueWithCGSize:CGSizeMake(320, 50)]]];
    
    // Add Mediafy ad view to the app UI
    [self.containerAdView addSubview:self.adView];
    
    // 3. Load the ad
    [self.adView loadAd];
}

// MARK: - MediafyAdViewDelegate

- (UIViewController *)adViewPresentationController {
    return self;
}

- (void)adView:(MediafyAdView *)adView didFailToReceiveAdWith:(NSError *)error {
    // Called when Mediafy SDK failed to load ad
    NSLog(@"Did fail to receive ad with error: %@", error.localizedDescription);
}

- (void)adView:(MediafyAdView *)adView didReceiveAdWithAdSize:(CGSize)adSize {
    // Called when ad is loaded
    
    // Update the constraints of the container view
    self.containerWidthConstraint.constant = adSize.width;
    self.containerHeightConstraint.constant = adSize.height;
}

- (void)adViewWillPresentModal:(MediafyAdView *)adView {
    // Called when modal is about to be presented
}

- (void)adViewDidDismissModal:(MediafyAdView *)adView {
    // Called when modal is dismissed
}

- (void)adViewWillLeaveApplication:(MediafyAdView *)adView {
    // Called when the application is about to enter the background
}

@end

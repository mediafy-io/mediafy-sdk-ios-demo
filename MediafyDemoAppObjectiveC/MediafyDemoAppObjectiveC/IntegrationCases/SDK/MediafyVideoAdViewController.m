/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "MediafyVideoAdViewController.h"

@interface MediafyVideoAdViewController ()

@property (nonatomic) MediafyAdView * adView;

@end

@implementation MediafyVideoAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a MediafyAdView
    self.adView = [[MediafyAdView alloc] initWithFrame:CGRectMake(0, 0, 300, 250)];
    
    // 2. Configure the MediafyAdView
    self.adView.delegate = self;
    [self.adView setAdSizes:@[[NSValue valueWithCGSize:CGSizeMake(300, 250)]]];
    self.adView.adFormat = MediafyAdFormat.video;
    
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

/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "AdMobBannerInterstitialViewController.h"

@interface AdMobBannerInterstitialViewController ()

@property (nonatomic) GADInterstitialAd * interstitialAd;

@end

@implementation AdMobBannerInterstitialViewController

- (NSString *)adUnitId {
    return @"ca-app-pub-2844566227051243/6264365605";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Load the interstitial ad
    __weak typeof(self) weakSelf = self;
    [GADInterstitialAd loadWithAdUnitID:self.adUnitId
                                request:[GADRequest new]
                      completionHandler:^(GADInterstitialAd * _Nullable interstitialAd, 
                                          NSError * _Nullable error) {
        if (error != nil || interstitialAd == nil) {
            return;
        }
        
        weakSelf.interstitialAd = interstitialAd;
        
        // 2. Configure the interstitial ad
        weakSelf.interstitialAd.fullScreenContentDelegate = self;
        
        // 3. Present the interstitial ad
        [weakSelf.interstitialAd presentFromRootViewController:self];
    }];
}


// MARK: - GADFullScreenContentDelegate

- (void)ad:(id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(NSError *)error {
    NSLog(@"Did fail to receive ad with error: %@", error.localizedDescription);
}

@end

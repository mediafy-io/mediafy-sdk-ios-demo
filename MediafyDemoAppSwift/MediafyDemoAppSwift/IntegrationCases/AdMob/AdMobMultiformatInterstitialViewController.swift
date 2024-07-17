/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

import MediafySDK
import MediafyGoogleMobileAdsAdapter

import GoogleMobileAds

fileprivate let adUnitId = "ca-app-pub-2844566227051243/9174078900"

final class AdMobMultiformatInterstitialViewController: InterstitialBaseViewController {
    
    private var interstitialAd: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Load the interstitial ad
        GADInterstitialAd.load(withAdUnitID: adUnitId, request: GADRequest()) { [weak self] ad, error in
            guard error == nil && ad != nil else {
                return
            }
            
            self?.interstitialAd = ad
            
            // 2. Configure the interstitial ad
            self?.interstitialAd?.fullScreenContentDelegate = self
            
            // 3. Present the interstitial ad
            self?.interstitialAd?.present(fromRootViewController: self)
        }
    }
}

// MARK: - GADFullScreenContentDelegate

extension AdMobMultiformatInterstitialViewController: GADFullScreenContentDelegate {
    
    func ad(_ ad: any GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: any Error) {
        print("Did fail to receive ad with error: \(error.localizedDescription)")
    }
}

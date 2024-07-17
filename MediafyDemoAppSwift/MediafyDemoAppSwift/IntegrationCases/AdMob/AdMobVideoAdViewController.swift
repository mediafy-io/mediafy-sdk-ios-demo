/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

import MediafySDK
import MediafyGoogleMobileAdsAdapter

import GoogleMobileAds

fileprivate let adUnitId = "ca-app-pub-2844566227051243/2218343221"

final class AdMobVideoAdViewController: AdBaseViewController {
    
    private var gadBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a GADBannerView
        gadBannerView = GADBannerView(adSize: GADAdSizeMediumRectangle)
        
        // 2. Configure the GADBannerView
        gadBannerView.adUnitID = adUnitId
        gadBannerView.delegate = self
        gadBannerView.rootViewController = self
        
        // Add GMA SDK banner view to the app UI
        containerAdView.addSubview(gadBannerView)
        
        // 3. Load ad
        gadBannerView.load(GADRequest())
    }
}

// MARK: - GADBannerViewDelegate

extension AdMobVideoAdViewController: GADBannerViewDelegate {
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: any Error) {
        print("Did fail to receive ad with error: \(error.localizedDescription)")
    }
}

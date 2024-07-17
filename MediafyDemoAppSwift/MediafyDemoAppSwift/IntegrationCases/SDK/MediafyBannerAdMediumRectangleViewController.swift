/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit
import MediafySDK

final class MediafyBannerAdMediumRectangleViewController: AdBaseViewController {
    
    private var adView: MediafyAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a MediafyAdView
        adView = MediafyAdView(
            frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 250))
        )
        
        // 2. Configure the MediafyAdView
        adView.delegate = self
        adView.adSizes = [CGSize(width: 300, height: 250)]
        
        // Add the ad view to the app UI
        containerAdView.addSubview(adView)
        
        // 3. Load the ad
        adView.loadAd()
    }
}

// MARK: - MediafyAdViewDelegate

extension MediafyBannerAdMediumRectangleViewController: MediafyAdViewDelegate {
    
    func adViewPresentationController() -> UIViewController? {
        self
    }
        
    func adView(_ adView: MediafyAdView, didFailToReceiveAdWith error: any Error) {
        print("Did fail to receive ad with error: \(error.localizedDescription)")
    }

    func adView(_ adView: MediafyAdView, didReceiveAdWithAdSize adSize: CGSize) {
        // Called when ad is loaded
    }
    
    func adViewWillPresentModal(_ adView: MediafyAdView) {
        // Called when modal is about to be presented
    }
    
    func adViewDidDismissModal(_ adView: MediafyAdView) {
        // Called when modal is dismissed
    }

    func adViewWillLeaveApplication(_ adView: MediafyAdView) {
        // Called when the application is about to enter the background
    }
}

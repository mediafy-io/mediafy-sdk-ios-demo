/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit
import MediafySDK

final class MediafyBannerAdViewController: AdBaseViewController {
    
    private var adView: MediafyAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a MediafyAdView
        adView = MediafyAdView(
            frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 50))
        )
        
        // 2. Configure the MediafyAdView
        adView.delegate = self
        adView.adSizes = [CGSize(width: 320, height: 50)]
        
        // Add the ad view to the app UI
        containerAdView.addSubview(adView)
        
        // 3. Load the ad
        adView.loadAd()
    }
}

// MARK: - MediafyAdViewDelegate

extension MediafyBannerAdViewController: MediafyAdViewDelegate {
    
    func adViewPresentationController() -> UIViewController? {
        self
    }
        
    func adView(_ adView: MediafyAdView, didFailToReceiveAdWith error: any Error) {
        print("Did fail to receive ad with error: \(error.localizedDescription)")
    }

    func adView(_ adView: MediafyAdView, didReceiveAdWithAdSize adSize: CGSize) {
        // Called when ad is loaded
        
        // Update the constraints of the container view
        containerWidthConstraint.constant = adSize.width
        containerHeightConstraint.constant = adSize.height
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

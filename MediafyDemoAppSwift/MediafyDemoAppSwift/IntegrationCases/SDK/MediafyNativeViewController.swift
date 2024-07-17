/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit
import MediafySDK

final class MediafyNativeViewController: NativeBaseViewController {
    
    private var nativeAdUnit: MediafyNativeAdUnit!
    private var nativeAd: MediafyNativeAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a MediafyNativeAdUnit
        nativeAdUnit = MediafyNativeAdUnit()
        
        // 2. Configure the MediafyNativeAdUnit
        let cta = MediafyNativeAssetData(type: .ctatext)
        cta.length = 15
        
        let title = MediafyNativeAssetTitle(length: 90)
        title.required = true
        
        let icon = MediafyNativeAssetImage(minimumWidth: 50, minimumHeight: 50)
        icon.type = .Icon
        
        let image = MediafyNativeAssetImage()
        image.required = true
        image.width = 1200
        image.height = 627
        image.type = .Main
        
        let description = MediafyNativeAssetData(type: .description)
        description.required = true
        description.length = 150
        
        let rating = MediafyNativeAssetData(type: .rating)
        
        let parameters = MediafyNativeParameters()
        parameters.assets = [cta, title, icon, image, rating, description]
        
        let eventTracker = MediafyNativeEventTracker(
            event: .Impression,
            methods: [.Image, .js]
        )
        
        parameters.eventtrackers = [eventTracker]
        parameters.context = .Social
        parameters.placementType = .FeedContent
        parameters.contextSubType = .Social
        
        nativeAdUnit.parameters = parameters
        
        nativeAdUnit.loadAd { [weak self] ad, error in
            guard let self = self else {
                return
            }
            
            guard let ad = ad, error == nil else {
                return
            }
            
            self.nativeAd = ad
            self.nativeAd?.delegate = self
            
            // 3. Render the native ad
            self.titleLabel.text = ad.title
            self.bodyLabel.text = ad.text
            self.sponsoredLabel.text = ad.sponsoredBy
            
            self.mainImageView.setImage(from: ad.imageUrl, placeholder: UIImage(systemName: "photo.artframe"))
            self.iconView.setImage(from: ad.iconUrl, placeholder: UIImage(systemName: "photo.artframe"))
            self.callToActionButton.setTitle(ad.callToAction, for: .normal)
            
            self.nativeAd?.registerView(view: self.view, clickableViews: [self.callToActionButton])
        }
    }
}

// MARK: - MediafyNativeAdEventDelegate

extension MediafyNativeViewController: MediafyNativeAdDelegate {
    
    func adDidExpire(ad: MediafyNativeAd) {
        // Called when the ad expired
    }
    
    func adWasClicked(ad: MediafyNativeAd) {
        // Called when the ad was clicked
    }
    
    func adDidLogImpression(ad: MediafyNativeAd) {
        // Called when the impression was logged
    }
}

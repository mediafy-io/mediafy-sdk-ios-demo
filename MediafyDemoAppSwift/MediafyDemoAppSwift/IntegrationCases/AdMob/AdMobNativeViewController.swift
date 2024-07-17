/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

import MediafySDK
import MediafyGoogleMobileAdsAdapter

import GoogleMobileAds

fileprivate let adUnitId = "ca-app-pub-2844566227051243/4736695354"

final class AdMobNativeView: GADNativeAdView {}

final class AdMobNativeViewController: UIViewController {
    
    static var nib: String {
        "AdMobNativeViewController"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var sponsoredLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var callToActionButton: UIButton!
    
    @IBOutlet weak var admobNativeView: AdMobNativeView!
    
    private var adLoader: GADAdLoader?
    
    convenience init() {
        self.init(nibName: Self.nib, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the subviews of the GADNativeAdView
        admobNativeView.iconView = iconView
        admobNativeView.imageView = mainImageView
        admobNativeView.headlineView = titleLabel
        admobNativeView.bodyView = bodyLabel
        admobNativeView.callToActionView = callToActionButton
        admobNativeView.advertiserView = sponsoredLabel
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a GADAdLoader
        adLoader = GADAdLoader(
            adUnitID: adUnitId,
            rootViewController: self,
            adTypes: [.native],
            options: []
        )
        
        // 2. Configure the GADAdLoader
        adLoader?.delegate = self
        
        // 3. Configure the native parameters
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
        
        // 4. Create a MediafyGADExtras
        let extras = MediafyGADExtras(nativeParameters: parameters)
        
        // 5. Create a GADRequest
        let request = GADRequest()
        
        // 6. Register the MediafyGADExtras
        request.register(extras)
        
        // 7. Load the ad
        adLoader?.load(request)
    }
}

// MARK: - GADNativeAdLoaderDelegate

extension AdMobNativeViewController: GADNativeAdLoaderDelegate {
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        // Set GADNativeAd in GADNativeAdView
        admobNativeView.nativeAd = nativeAd
        
        // 8. Render the ad
        titleLabel.text = nativeAd.headline
        bodyLabel.text = nativeAd.body
        
        let gadImages = nativeAd.images as? NSArray as? [GADNativeAdImage]
        let image = gadImages?.count == 2 ? gadImages?[1] : gadImages?.first
        
        mainImageView.setImage(
            from: image?.imageURL?.absoluteString,
            placeholder: UIImage(systemName: "photo.artframe")
        )
        
        iconView.setImage(
            from: nativeAd.icon?.imageURL?.absoluteString,
            placeholder: UIImage(systemName: "photo.artframe")
        )
        
        callToActionButton.setTitle(nativeAd.callToAction, for: .normal)
        sponsoredLabel.text = nativeAd.advertiser
    }
    
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: any Error) {
        print("Did fail to receive ad with error: \(error.localizedDescription)")
    }
}

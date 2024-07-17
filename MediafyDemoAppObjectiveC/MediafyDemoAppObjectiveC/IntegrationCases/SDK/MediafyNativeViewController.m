/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "MediafyNativeViewController.h"

@interface MediafyNativeViewController ()

@property (nonatomic) MediafyNativeAdUnit * nativeAdUnit;
@property (nonatomic, nullable) MediafyNativeAd * nativeAd;

@end

@implementation MediafyNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a MediafyNativeAdUnit
    self.nativeAdUnit = [[MediafyNativeAdUnit alloc] init];
    
    // 2. Configure the MediafyNativeAdUnit 
    MediafyNativeAssetData *cta = [
        [MediafyNativeAssetData alloc]
        initWithType:MediafyDataAssetCtatext
    ];
    
    cta.length = @15;
    
    MediafyNativeAssetTitle *title = [
        [MediafyNativeAssetTitle alloc]
        initWithLength:90
    ];
    
    title.required = @YES;
    
    MediafyNativeAssetImage *icon = [
        [MediafyNativeAssetImage alloc]
        initWithMinimumWidth:20
        minimumHeight:20
    ];
    
    icon.type = MediafyImageAsset.Icon;
    
    MediafyNativeAssetImage *image = [[MediafyNativeAssetImage alloc] init];
    
    image.required = @YES;
    image.width = @1200;
    image.height = @627;
    
    image.type = MediafyImageAsset.Main;
    
    MediafyNativeAssetData * description = [
        [MediafyNativeAssetData alloc]
        initWithType:MediafyDataAssetDescription
    ];
    
    description.required = @YES;
    description.length = @150;
    
    MediafyNativeAssetData * rating = [
        [MediafyNativeAssetData alloc]
        initWithType:MediafyDataAssetRating
    ];
    
    
    MediafyNativeParameters * parameters = [MediafyNativeParameters new];
    parameters.assets = @[cta, title, icon, image, rating, description];
    
    MediafyNativeEventTracker * eventTracker = [
        [MediafyNativeEventTracker alloc]
        initWithEvent:MediafyEventType.Impression
        methods:@[MediafyEventTracking.Image, MediafyEventTracking.js]
    ];
    
    parameters.eventtrackers = @[eventTracker];
    parameters.context = MediafyContextType.Social;
    parameters.placementType = MediafyPlacementType.FeedContent;
    parameters.contextSubType = MediafyContextSubType.Social;
    
    self.nativeAdUnit.parameters = parameters;
    
    __weak typeof(self) weakSelf = self;
    [self.nativeAdUnit loadAdWithCompletion:^(MediafyNativeAd * _Nullable ad, NSError * _Nullable error) {
        if (error != nil || ad == nil) {
            return;
        }
        
        weakSelf.nativeAd = ad;
        weakSelf.nativeAd.delegate = self;
        
        // 3. Render the native ad
        weakSelf.titleLabel.text = ad.title;
        weakSelf.bodyLabel.text = ad.text;
        weakSelf.sponsoredLabel.text = ad.sponsoredBy;
        
        [weakSelf.mainImageView setImageFromURLString:ad.imageUrl
                                          placeholder:[UIImage systemImageNamed:@"photo.artframe"]];
        [weakSelf.iconView setImageFromURLString:ad.iconUrl
                                          placeholder:[UIImage systemImageNamed:@"photo.artframe"]];
        [weakSelf.callToActionButton setTitle:ad.callToAction forState:UIControlStateNormal];
    }];
}

// MARK: - MediafyNativeAdEventDelegate

- (void)adDidExpireWithAd:(MediafyNativeAd *)ad {
    // Called when the ad expired
}

- (void)adWasClickedWithAd:(MediafyNativeAd *)ad {
    // Called when the ad was clicked
}

- (void)adDidLogImpressionWithAd:(MediafyNativeAd *)ad {
    // Called when the impression was logged
}

@end

/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "AppLovinNativeViewController.h"

@interface AppLovinNativeViewController ()

@property (weak, nonatomic) IBOutlet MANativeAdView *maNativeAdView;

@property (nonatomic) MANativeAdLoader *nativeAdLoader;

@end

@implementation AppLovinNativeViewController

- (NSString *)adUnitId {
    return @"<AD_UNIT_ID>";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Bind the subviews using unique tag IDs with an instance of MANativeAdViewBinder
    MANativeAdViewBinder * binder = [
        [MANativeAdViewBinder alloc]
        initWithBuilderBlock:^(MANativeAdViewBinderBuilder * _Nonnull builder) {
            builder.iconImageViewTag = 1;
            builder.titleLabelTag = 2;
            builder.bodyLabelTag = 3;
            builder.advertiserLabelTag = 4;
            builder.callToActionButtonTag = 5;
        }
    ];
    
    [self.maNativeAdView bindViewsWithAdViewBinder:binder];
    
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a MANativeAdLoader
    self.nativeAdLoader = [[MANativeAdLoader alloc] initWithAdUnitIdentifier:self.adUnitId];
    
    // 2. Configure the MANativeAdLoader
    self.nativeAdLoader.nativeAdDelegate = self;
    
    // 3. Configure the native parameters
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
    
    // 4. Create a MediafyAppLovinExtras
    MediafyAppLovinExtras * extras = [[MediafyAppLovinExtras alloc] 
                                       initWithNativeParameters: parameters];
    
    // 5. Set local extra parameter
    [self.nativeAdLoader setLocalExtraParameterForKey:MediafyAppLovinExtras.key value:extras];
    
    // 6. Load the ad
    [self.nativeAdLoader loadAdIntoAdView:self.maNativeAdView];
}

// MARK: - MANativeAdDelegate

- (void)didFailToLoadNativeAdForAdUnitIdentifier:(NSString *)adUnitIdentifier 
                                       withError:(MAError *)error {
    NSLog(@"Did fail to load ad with error: %@", error.message);
}

- (void)didLoadNativeAd:(MANativeAdView *)nativeAdView forAd:(MAAd *)ad {}
- (void)didClickNativeAd:(MAAd *)ad {}

@end

/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "AdMobNativeViewController.h"

@interface AdMobNativeView : GADNativeAdView
@end

@implementation AdMobNativeView
@end

@interface AdMobNativeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *sponsoredLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *callToActionButton;

@property (weak, nonatomic) IBOutlet AdMobNativeView *admobNativeView;

@property (nonatomic) GADAdLoader *adLoader;

@end

@implementation AdMobNativeViewController


- (NSString *)adUnitId {
    return @"ca-app-pub-2844566227051243/4736695354";
}

- (instancetype)init
{
    self = [super initWithNibName:@"AdMobNativeViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the subviews of the GADNativeAdView
    self.admobNativeView.iconView = self.iconView;
    self.admobNativeView.imageView = self.mainImageView;
    self.admobNativeView.headlineView = self.titleLabel;
    self.admobNativeView.bodyView = self.bodyLabel;
    self.admobNativeView.callToActionView = self.callToActionButton;
    self.admobNativeView.advertiserView = self.sponsoredLabel;
 
    [self loadAd];
}

- (void)loadAd {
    // 1. Create a GADAdLoader
    self.adLoader = [[GADAdLoader alloc] initWithAdUnitID:self.adUnitId
                                       rootViewController:self
                                                  adTypes:@[GADAdLoaderAdTypeNative]
                                                  options:@[]];
    
    // 2. Configure the GADAdLoader
    self.adLoader.delegate = self;
    
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
    
    // 4. Create a MediafyGADExtras
    MediafyGADExtras * extras = [[MediafyGADExtras alloc] initWithNativeParameters:parameters];
    
    // 5. Create a GADRequest
    GADRequest * request = [GADRequest new];
    
    // 6. Register the MediafyGADExtras
    [request registerAdNetworkExtras:extras];
    
    // 7. Load the ad
    [self.adLoader loadRequest:request];
}

// MARK: - GADNativeAdLoaderDelegate

- (void)adLoader:(GADAdLoader *)adLoader didReceiveNativeAd:(GADNativeAd *)nativeAd {
    // Set GADNativeAd in GADNativeAdView
    self.admobNativeView.nativeAd = nativeAd;
    
    self.titleLabel.text = nativeAd.headline;
    self.bodyLabel.text = nativeAd.body;
    self.sponsoredLabel.text = nativeAd.advertiser;
    
    [self.mainImageView setImageFromURLString:nativeAd.images.lastObject.imageURL.absoluteString
                                      placeholder:[UIImage systemImageNamed:@"photo.artframe"]];
    [self.iconView setImageFromURLString:nativeAd.icon.imageURL.absoluteString
                                      placeholder:[UIImage systemImageNamed:@"photo.artframe"]];
    [self.callToActionButton setTitle:nativeAd.callToAction forState:UIControlStateNormal];
}

- (void)adLoader:(GADAdLoader *)adLoader didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Did fail to receive ad with error: %@", error.localizedDescription);
}

@end

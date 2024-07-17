/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "IntegrationAdFormatDescriptor.h"

@implementation IntegrationAdFormatDescriptor

+ (NSString *)getDescriptionForAdFormat:(IntegrationAdFormat)adFormat {
    switch(adFormat) {
        case IntegrationAdFormatBanner:
            return @"Banner";
        case IntegrationAdFormatVideo:
            return @"Video";
        case IntegrationAdFormatBannerInterstitial:
            return @"Banner Interstitial";
        case IntegrationAdFormatVideoInterstitial:
            return @"Video Interstitial";
        case IntegrationAdFormatMultiformat:
            return @"Multiformat";
        case IntegrationAdFormatNative:
            return @"Native";
        case IntegrationAdFormatAll:
            return @"All";
    }
}
@end

/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "IntegrationKindDescriptor.h"
#import "IntegrationKind.h"

@implementation IntegrationKindDescriptor

+ (NSString*)getDescriptionForIntegrationKind:(IntegrationKind)integrationKind {
    switch (integrationKind) {
            
        case IntegrationKindMediafy:
            return @"Mediafy";
        case IntegrationKindAdMob:
            return @"AdMob";
        case IntegrationKindAppLovin:
            return @"AppLovin MAX";
        case IntegrationKindAll:
            return @"All";
    }
}

@end

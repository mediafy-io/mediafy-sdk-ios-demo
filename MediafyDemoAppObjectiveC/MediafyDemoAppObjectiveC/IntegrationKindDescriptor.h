/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "IntegrationKind.h"

@interface IntegrationKindDescriptor : NSObject

+ (NSString *)getDescriptionForIntegrationKind:(IntegrationKind)integrationKind;

@end


/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "IntegrationCase.h"

@implementation IntegrationCase

-(id)initWithTitle:(NSString *)title integrationKind:(IntegrationKind)integrationKind adFormat: (IntegrationAdFormat)adFormat configurationClosure:(ConfigurationClosure)configurationClosure {
    self = [self init];
    self.title = title;
    self.integrationKind = integrationKind;
    self.adFormat = adFormat;
    self.configurationClosure = configurationClosure;
    return self;
}

@end

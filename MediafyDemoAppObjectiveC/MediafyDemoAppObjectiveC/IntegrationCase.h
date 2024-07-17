/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "IntegrationKind.h"
#import "IntegrationAdFormat.h"

typedef UIViewController* (^ConfigurationClosure)(void);

@interface IntegrationCase : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) IntegrationKind integrationKind;
@property (nonatomic) IntegrationAdFormat adFormat;
@property (nonatomic) ConfigurationClosure configurationClosure;

-(id)initWithTitle:(NSString *)title integrationKind:(IntegrationKind)integrationKind adFormat: (IntegrationAdFormat)adFormat configurationClosure:(ConfigurationClosure)configurationClosure;

@end

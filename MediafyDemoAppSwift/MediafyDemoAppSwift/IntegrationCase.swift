/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

struct IntegrationCase {
    
    let title: String
    let integrationKind: IntegrationKind
    let adFormat: IntegrationAdFormat
    let configurationClosure: () -> UIViewController
}

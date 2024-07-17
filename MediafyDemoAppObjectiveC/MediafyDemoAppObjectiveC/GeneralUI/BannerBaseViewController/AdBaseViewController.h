/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdBaseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *containerAdView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHeightConstraint;

-(id)init;

@end

NS_ASSUME_NONNULL_END

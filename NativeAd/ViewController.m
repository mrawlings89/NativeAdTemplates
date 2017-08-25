//
//  ViewController.m
//  NativeAd
//
//  Created by Yun Peng Wang on 11/7/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ViewController.h"
#import <Leanplum/Leanplum.h>
@import FBAudienceNetwork;

@interface ViewController ()
@property (strong, nonatomic) FBNativeAd *nativeAd;
@end

#define TOP_RIGHT_POSITION @"TopRight"
#define BOTTOM_RIGHT_POSITION @"BottomRight"
#define CTA_BUTTON_BLUE @"blue"
#define CTA_BUTTON_GREEN @"green"


DEFINE_VAR_STRING(sponsoredLabel, @"Sponsored")
DEFINE_VAR_STRING(adChoicesCorner, @"TopRight")
DEFINE_VAR_STRING(ctaButtonColor, @"blue")

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [FBAdSettings setLogLevel:FBAdLogLevelLog];
    [FBAdSettings addTestDevice:@"b602d594afd2b0b327e07a06f36ca6a7e42546d0"];
    
// Create a native ad request with a unique placement ID (generate your own on the Facebook app settings).
// Use different ID for each ad placement in your app.
    FBNativeAd *nativeAd = [[FBNativeAd alloc] initWithPlacementID:@"150877198827978_150879382161093"];
    
// Set a delegate to get notified when the ad was loaded.
    nativeAd.delegate = self;
    
// Configure native ad to wait to call nativeAdDidLoad: until all ad assets are loaded
    nativeAd.mediaCachePolicy = FBNativeAdsCachePolicyAll;
    [nativeAd loadAd];
}

- (void)nativeAdDidLoad:(FBNativeAd *)nativeAd
{
    FBNativeAdView *adView = [FBNativeAdView nativeAdViewWithNativeAd:nativeAd
                                                             withType:FBNativeAdViewTypeGenericHeight300];
    
    [self.view addSubview:adView];
    
    CGSize size = self.view.bounds.size;
    CGFloat xOffset = size.width / 2 - 160;
    CGFloat yOffset = (size.height > size.width) ? 100 : 20;
    adView.frame = CGRectMake(xOffset, yOffset, 320, 300);
    
    // Register the native ad view and its view controller with the native ad instance
    [nativeAd registerViewForInteraction:adView withViewController:self];
}
//Error Catching below
- (void)nativeAd:(FBNativeAd *)nativeAd didFailWithError:(NSError *)error
{
    NSLog(@"Native ad failed to load with error: %@", error);
}

- (void)nativeAdDidClick:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad was clicked.");
}

- (void)nativeAdDidFinishHandlingClick:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad did finish click handling.");
}

- (void)nativeAdWillLogImpression:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad impression is being captured.");
}

@end


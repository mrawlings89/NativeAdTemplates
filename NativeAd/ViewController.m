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

FBAdView *myAdView;

//NSInteger AdViewType = 1;
//FBNativeAdViewType *myAdViewType;
//myAdViewType = [AdViewType enum];

//FBNativeAdViewAttributes *typeToUse = [[FBNativeAdViewAttributes alloc] init];
//typeToUse.FBNativeAdViewType = (Type)FBNativeAdViewTypeGenericHeight100;



DEFINE_VAR_INT(customTemplate, 400)


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
    NSLog(@"We Here");
    int template = [customTemplate intValue];
   [Leanplum onVariablesChangedAndNoDownloadsPending:^() {
      if(template == 100)
      {
        FBNativeAdView *myAdView = [FBNativeAdView nativeAdViewWithNativeAd:nativeAd
                                                                 withType:FBNativeAdViewTypeGenericHeight100];
        [self.view addSubview:myAdView];
        CGSize size = self.view.bounds.size;
        CGFloat xOffset = size.width / 2 - 160;
        CGFloat yOffset = (size.height > size.width) ? 100 : 20;
        myAdView.frame = CGRectMake(xOffset, yOffset, 320, 300);
        [nativeAd registerViewForInteraction:myAdView withViewController:self];
      }
      else if(template == 120)
      {
          FBNativeAdView *myAdView = [FBNativeAdView nativeAdViewWithNativeAd:nativeAd
                                                                   withType:FBNativeAdViewTypeGenericHeight120];
          [self.view addSubview:myAdView];
          CGSize size = self.view.bounds.size;
          CGFloat xOffset = size.width / 2 - 160;
          CGFloat yOffset = (size.height > size.width) ? 100 : 20;
          myAdView.frame = CGRectMake(xOffset, yOffset, 320, 300);
          [nativeAd registerViewForInteraction:myAdView withViewController:self];
      }
      else if(template == 300)
      {
          NSLog(@"AWESOME");
          FBNativeAdView *myAdView = [FBNativeAdView nativeAdViewWithNativeAd:nativeAd
                                                                   withType:FBNativeAdViewTypeGenericHeight300];
          [self.view addSubview:myAdView];
          CGSize size = self.view.bounds.size;
          CGFloat xOffset = size.width / 2 - 160;
          CGFloat yOffset = (size.height > size.width) ? 100 : 20;
          myAdView.frame = CGRectMake(xOffset, yOffset, 320, 300);
          [nativeAd registerViewForInteraction:myAdView withViewController:self];
      }
      else if(template == 400)
      {
          FBNativeAdView *myAdView = [FBNativeAdView nativeAdViewWithNativeAd:nativeAd
                                                                   withType:FBNativeAdViewTypeGenericHeight400];
          [self.view addSubview:myAdView];
          CGSize size = self.view.bounds.size;
          CGFloat xOffset = size.width / 2 - 160;
          CGFloat yOffset = (size.height > size.width) ? 100 : 20;
          myAdView.frame = CGRectMake(xOffset, yOffset, 320, 300);
          [nativeAd registerViewForInteraction:myAdView withViewController:self];
      }
      else
      {
          FBNativeAdView *myAdView = [FBNativeAdView nativeAdViewWithNativeAd:nativeAd
                                                                   withType:FBNativeAdViewTypeGenericHeight120];
          [self.view addSubview:myAdView];
          CGSize size = self.view.bounds.size;
          CGFloat xOffset = size.width / 2 - 160;
          CGFloat yOffset = (size.height > size.width) ? 100 : 20;
          myAdView.frame = CGRectMake(xOffset, yOffset, 320, 300);
          [nativeAd registerViewForInteraction:myAdView withViewController:self];
      }

     }];
    
    if(myAdView != nil){
    }
    else (NSLog(@"Uh-oh!"));
   
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


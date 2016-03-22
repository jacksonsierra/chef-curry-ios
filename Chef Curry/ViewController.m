//
//  ViewController.m
//  Chef Curry
//
//  Created by Jackson Sierra on 3/20/16.
//  Copyright © 2016 Jackson Sierra. All rights reserved.
//

#import "ViewController.h"
#import "UIAssets.h"

@import CoreGraphics;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UIAssets *assets = [[UIAssets alloc] init];
  assetsLibrary = assets.library;
  
  if (!_status) {
    
  }
  [self updateUI];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

- (void)updateUI {
  statusAssets = [assetsLibrary valueForKey:self.status];
  
  [_statusImage setImage:(UIImage *)[self findStatusImage]];
  [_statusImage setContentMode:UIViewContentModeScaleAspectFit];
  [_statusLabel setText:(NSString *)[self findStatusLabel]];
  [_statusLabel setFont:(UIFont *)[self findStatusLabelFont]];
  [_statusText setText:(NSString *)[self findStatusText]];
//  [_statusLabel setTextColor:(UIColor *)[self findStatusLabelColor]];
}

- (UIImage *)findStatusImage {
  NSArray *images = [statusAssets valueForKey:kImages];
  NSString *imageName;
  int randomNum = arc4random_uniform((unsigned int)images.count);
  
  imageName = images[randomNum];
  
  if (!imageName) {
    return nil;
  }
  
  return [UIImage imageNamed:imageName];
}

- (NSString *)findStatusLabel {
  return [statusAssets valueForKey:kLabel];
}

- (NSString *)findStatusText {
  return [statusAssets valueForKey:kText];
}

- (UIFont *)findStatusLabelFont {
  NSDictionary *font = [statusAssets valueForKey:kFont];
  NSString *fontName = [font valueForKey:kFontName];
  CGFloat fontSize = [[font valueForKey:kFontSize] doubleValue];
  
  if (!(fontName || fontSize)) {
    return nil;
  }
  
  return [UIFont fontWithName:fontName size:fontSize];
}

- (UIColor *)findStatusLabelColor {
  NSDictionary *statusColor = [statusAssets valueForKey:kLabelColor];

  CGFloat red = [[statusColor valueForKey:@"red"] doubleValue]/255;
  CGFloat green = [[statusColor valueForKey:@"green"] doubleValue]/255;
  CGFloat blue = [[statusColor valueForKey:@"blue"] doubleValue]/255;
  CGFloat alpha = [[statusColor valueForKey:@"alpha"] doubleValue]/255;
  
  return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end

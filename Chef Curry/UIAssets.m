//
//  UIAssets.m
//  Chef Curry
//
//  Created by Jackson Sierra on 3/21/16.
//  Copyright © 2016 Jackson Sierra. All rights reserved.
//

#import "UIAssets.h"

NSString *const kImages = @"kImages";
NSString *const kFont = @"kFont";
NSString *const kFontName = @"kFontName";
NSString *const kFontSize = @"kFontSize";
NSString *const kLabel = @"kLabel";
NSString *const kLabelColor = @"kLabelColor";
NSString *const kText = @"kText";
NSString *const kDefaultStatus = @"off";

@implementation UIAssets

- (instancetype)init {
  self = [super init];
  if (self) {
    _library = @{
                 @"god": @{
                     kImages: @[
                         @"Stephen_Curry_God_Cropped.jpg"
                     ],
                     kFont: @{
                         kFontName: @"Copperplate",
                         kFontSize: @48.0
                     },
                     kLabel: @"GOD MODE!!!",
                     kLabelColor: @{
                         @"red": @237.0,
                         @"green": @23.0,
                         @"blue": @76.0,
                         @"alpha": @1.0
                     },
                     kText: @"Shaping up to be a night you don't want to miss...get to the nearest TV!"
                 },
                 @"none": @{
                     kImages: @[
                         @"Stephen_Curry_Headshot.jpg"
                     ],
                     kFont: @{
                         kFontName: @"Avenir",
                         kFontSize: @34.0
                     },
                     kLabel: @"Steph's gotta Steph",
                     kLabelColor: @{
                         @"red": @237.0,
                         @"green": @23.0,
                         @"blue": @76.0,
                         @"alpha": @1.0
                     },
                     kText: @"Check back later to see if Steph enters GOD MODE"
                 },
                 @"hot": @{
                     kImages: @[
                         @"Stephen_Curry_Shot.jpg"
                     ],
                     kFont: @{
                         kFontName: @"Copperplate",
                         kFontSize: @50.0
                     },
                     kLabel: @"Heatin' Up!",
                     kLabelColor: @{
                         @"red": @237.0,
                         @"green": @23.0,
                         @"blue": @76.0,
                         @"alpha": @1.0
                     },
                     kText: @"Steph's hit two 3s in the last 5 min!"
                 },
                 @"shot": @{
                     kImages: @[
                         @"Stephen_Curry_Hot_Cropped.jpg"
                         ],
                     kFont: @{
                         kFontName: @"Copperplate",
                         kFontSize: @48.0
                         },
                     kLabel: @"BANG!",
                     kLabelColor: @{
                         @"red": @237.0,
                         @"green": @23.0,
                         @"blue": @76.0,
                         @"alpha": @1.0
                         },
                     kText: @"MVP just sank a long ball!"
                 }
               };
  }
  return self;
}

@end

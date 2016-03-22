//
//  UIAssets.h
//  Chef Curry
//
//  Created by Jackson Sierra on 3/21/16.
//  Copyright © 2016 Jackson Sierra. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kImages;
extern NSString *const kFont;
extern NSString *const kFontName;
extern NSString *const kFontSize;
extern NSString *const kLabel;
extern NSString *const kLabelColor;
extern NSString *const kText;
extern NSString *const kDefaultStatus;

@interface UIAssets : NSObject

@property (strong, nonatomic) NSDictionary *library;

@end

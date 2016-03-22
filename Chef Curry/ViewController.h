//
//  ViewController.h
//  Chef Curry
//
//  Created by Jackson Sierra on 3/20/16.
//  Copyright © 2016 Jackson Sierra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAssets.h"

@interface ViewController : UIViewController {
  NSDictionary *assetsLibrary;
  NSDictionary *statusAssets;
}

@property (strong, nonatomic) NSString *status;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusText;

- (void)updateUI;

- (UIImage *)findStatusImage;
- (NSString *)findStatusLabel;
- (NSString *)findStatusText;
- (UIFont *)findStatusLabelFont;
- (UIColor *)findStatusLabelColor;

@end


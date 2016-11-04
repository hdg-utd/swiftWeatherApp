//
//  ViewController.h
//  WeatherObjCApp
//
//  Created by Harsh Gosar on 11/2/16.
//  Copyright © 2016 Harsh Gosar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherService.h"

@interface ViewController : UIViewController<WeatherServiceDelegate>


@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *cityButton;

@property (nonatomic) WeatherService *weatherService;

- (void)openCityAlert;



@end


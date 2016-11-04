//
//  ViewController.m
//  WeatherObjCApp
//
//  Created by Harsh Gosar on 11/2/16.
//  Copyright © 2016 Harsh Gosar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)setCityTapped:(id)sender {
   [self openCityAlert];
   
}

- (void)openCityAlert {
   // Creating the UIAlertController named alert
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"City"
                                                                  message:@"Enter city name"
                                                           preferredStyle:UIAlertControllerStyleAlert];
   
   // Adding a textfield to alert
   [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
      [textField setPlaceholder:@"City Name"];
   }];
   
   // Creating the OK button
   UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleDefault
                                              handler:^(UIAlertAction * _Nonnull action) {
                                                 NSString *cityName = [[[alert textFields] objectAtIndex:0] text]; // Getting the text from the 0 index textField
                                                 //NSLog(@"%@", cityName);
                                                 [self.weatherService getWeather:cityName];
                                                 
                                                 [alert dismissViewControllerAnimated:YES
                                                                           completion:nil];
      
                                              }];
   [alert addAction:ok]; // Adding OK to alert
   
   // Creating the Cancel Button
   UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action) {
      [alert dismissViewControllerAnimated:YES
                                completion:nil];
   }];
   [alert addAction:cancel]; // Adding Cancel to alert
   
   [self presentViewController:alert
                      animated:YES
                    completion:nil]; // Calling alert on button tap
   
}

- (void) setWeather:(Weather *)weather {
   NSLog(@"Setting Weather");
   //[weather printContents];
   NSLog(@"%@", weather.descriptionOfCity);
   NSLog(@"%@", [weather temp]);
   
   if([[weather descriptionOfCity] isKindOfClass:[NSString class]]) {
      NSLog(@"It is a String");
      NSString *descrip = weather.descriptionOfCity;//[weather descriptionOfCity];
      NSString *tempCity = weather.temp;//[weather temp];
      NSLog(@"%@", descrip);
      NSLog(@"%@", tempCity);
      _descLabel.text = [NSString stringWithFormat:@"%@", descrip];
      _tempLabel.text = [NSString stringWithFormat:@"%@", tempCity];
   } else {
      NSLog(@"Nay");
   }
   
   
}

- (void)viewDidLoad {
   [super viewDidLoad];
   
   
   _weatherService = [[WeatherService alloc] init];
   _weatherService.delegate = self;
   // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


@end

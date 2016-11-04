//
//  Weather.m
//  WeatherObjCApp
//
//  Created by Harsh Gosar on 11/3/16.
//  Copyright © 2016 Harsh Gosar. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (void) setValues:(NSString *) cityName
      temperature: (NSString *) temp
      description: (NSString *) desc{
   self.cityName = cityName;
   self.temp = temp;
   self.descriptionOfCity = desc;
   NSLog(@"Setting Weather Object");
}

-(void) printContents {
   if(self != nil) {
      NSLog(@"CityName: %@ \nTemperature: %@ \nDescription: %@", _cityName, _temp, _descriptionOfCity);
   } else {
      NSLog(@"Empty Object");
   }
   
}

@end

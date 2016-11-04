//
//  WeatherService.m
//  WeatherObjCApp
//
//  Created by Harsh Gosar on 11/3/16.
//  Copyright © 2016 Harsh Gosar. All rights reserved.
//

#import "WeatherService.h"

@implementation WeatherService

- (void) getWeather: (NSString *) city {
   //NSLog(@"%@", city);
   NSString *cityReplaced = [city stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
   NSString *path = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@)&appid=01a5e9ec74efcc783af4f0a8e93b3cb9", cityReplaced];
   
   NSURL *url = [NSURL URLWithString:path];
   NSURLSession *session = [NSURLSession sharedSession];
   
   NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
      if(!error) {
         //NSLog(@"%@", json);
         //NSLog(@"%@", results);
         
         NSDictionary *mainResults = json[@"main"];
         //NSLog(@"%@", mainResults);
         
         NSString *temp = mainResults[@"temp"];
         //NSLog(@"%@", temp);
         double temperature = [temp doubleValue];
         double fahTemp = (((temperature - 273.15) * 9.0 / 5.0) + 32);
         temp = [NSString stringWithFormat:@"%.2f F", fahTemp];
         
         NSArray *weatherResults = json[@"weather"];
         NSDictionary *weatherResults0 = weatherResults[0];
         
         NSString *desc = weatherResults0[@"description"];
         //NSLog(@"%@", desc);
         
         
         //NSLog(@"Temp: %@, desc: %@, name: %@", temp, desc, name);
         
         Weather *weather = [[Weather alloc] init];
         [weather setValues:city temperature:temp description:desc];
         
         if(self.delegate != nil && weather != nil) {
            //[weather printContents];
            dispatch_async(dispatch_get_main_queue(), ^{
                  [self.delegate setWeather:weather];;
            });
            
         }
      }
   }];
   [task resume];
   
}
@end

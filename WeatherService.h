//
//  WeatherService.h
//  WeatherObjCApp
//
//  Created by Harsh Gosar on 11/3/16.
//  Copyright © 2016 Harsh Gosar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@protocol WeatherServiceDelegate <NSObject>

@required
- (void) setWeather: (Weather *) weather;
@end

@interface WeatherService : NSObject

@property (weak, nonatomic) id<WeatherServiceDelegate> delegate;

- (void) getWeather: (NSString *) city;

@end

//
//  Weather.h
//  WeatherObjCApp
//
//  Created by Harsh Gosar on 11/3/16.
//  Copyright © 2016 Harsh Gosar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property NSString *cityName;
@property NSString *temp;
@property NSString *descriptionOfCity;

- (void) setValues:(NSString *) cityName
      temperature: (NSString *) temp
      description: (NSString *) desc;

-(void) printContents;

@end

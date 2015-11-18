//
//  CityModel.h
//  FMDBDemo
//
//  Created by Leo on 15/10/21.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject

@property (nonatomic, assign) int city_id;
@property (nonatomic, copy) NSString *city_name;
@property (nonatomic, copy) NSString *province_id;
@property (nonatomic, copy) NSString *first_letter;
@property (nonatomic, assign) int is_hot;
@property (nonatomic, assign) int state;

@end

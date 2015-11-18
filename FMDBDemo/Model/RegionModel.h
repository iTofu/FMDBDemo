//
//  RegionModel.h
//  FMDBDemo
//
//  Created by Leo on 15/10/21.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegionModel : NSObject

@property (nonatomic, assign) int region_id;
/**
 *  地区名称
 */
@property (nonatomic, copy) NSString *region_name;
/**
 *  父地区ID
 */
@property (nonatomic, assign) int city_id;

@end

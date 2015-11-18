//
//  ViewController.m
//  FMDBDemo
//
//  Created by Leo on 15/10/21.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
#import "ProvinceModel.h"
#import "CityModel.h"
#import "RegionModel.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *provinceArray;

@property (nonatomic, strong) NSArray *regionArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[DBManager sharedManager] readAllProvinces:^(FMDatabase *db, BOOL success1, NSArray *resultArray1) {
        
        if (success1) {
            
            self.provinceArray = resultArray1;
            
            // 读取第一个省份下的县
            if (resultArray1.count) {
                
                [[DBManager sharedManager] readRegionsWithDB:db province:resultArray1[0] result:^(BOOL success2, NSArray *resultArray2) {
                    
                    if (success2) {
                        
                        self.regionArray = resultArray2;
                        
                        [self.pickerView reloadAllComponents];
                        
                    } else {
                        
                        NSLog(@"ERR: 读取 Regions 失败");
                    }
                }];
            }
            
        } else {
            
            NSLog(@"ERR: 读取 Provinces 失败");
        }
    }];
}

#pragma mark - UIPickerView 代理

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        
        return self.provinceArray.count;
        
    } else if (component == 1) {
        
        return self.regionArray.count;
    }
    
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        
        return [self.provinceArray[row] province_name];
        
    } else if (component == 1) {
        
        return [self.regionArray[row] region_name];
    }
    
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        
        ProvinceModel *province = self.provinceArray[row];
        
        [[DBManager sharedManager] readRegionsWithProvince:province result:^(BOOL success, NSArray *resultArray) {
            
            if (success) {
                
                self.regionArray = resultArray;
                
                [self.pickerView reloadAllComponents];
                
            } else {
                
                NSLog(@"ERR: 读取 Regions 失败");
            }
        }];
    }
}

@end

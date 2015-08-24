//
//  FISAppDelegate.m
//  ApplesAndHolidays
//
//  Created by Al Tyus on 5/30/14.
//  Copyright (c) 2014 com.flatironschool. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray*) fruits {
    NSPredicate *filterOnlyApples = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *filteredFruit = [fruits filteredArrayUsingPredicate:filterOnlyApples];
    return filteredFruit;
}

-(NSArray *)holidaysInSeason:(NSString *) season inDatabase:(NSDictionary *) database {
    NSMutableArray *holidays = [[NSMutableArray alloc]init];
    for (NSString *holidayName in database[season]){
        [holidays addObject:holidayName];
    }
    return holidays;
}

-(NSArray *)suppliesInHoliday:(NSString *) holiday inSeason:(NSString *) season inDatabase:(NSDictionary *) database {
    NSMutableArray *supplies = [[NSMutableArray alloc]init];
    for(NSString *supply in database[season][holiday]){
        [supplies addObject:supply];
    }
    return supplies;
};

-(BOOL)holiday:(NSString *) holiday isInSeason: (NSString *) season inDatabase:(NSDictionary *) database {
    BOOL isholidayInSeason = NO;
    if ([[database[season] allKeys] containsObject:holiday]) {
        isholidayInSeason = YES;
    }
    return isholidayInSeason;
}

-(BOOL)supply:(NSString *) supply isInHoliday:(NSString *) holiday inSeason:(NSString *) season inDatabase:(NSDictionary *) database {
    BOOL isSupplyinHolidayinSeason = NO;
    
    if ([database[season][holiday] containsObject:supply]) {
        
        isSupplyinHolidayinSeason = YES;
    }
    return isSupplyinHolidayinSeason;
}

-(NSDictionary *)addHoliday:(NSString *) holiday toSeason:(NSString *) season inDatabase:(NSDictionary *) database {
    database[season][holiday] =[@[] mutableCopy];
     return  database;
}


-(NSDictionary *)addSupply:(NSString *) supply toHoliday:(NSString *) holiday inSeason:(NSString *) season inDatabase:(NSDictionary *) database {
    [database[season][holiday]addObject:supply];
    return database;
}

@end
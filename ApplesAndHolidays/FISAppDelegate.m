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

/**
 
 * Implement your methods here.
 
 */


-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSPredicate *apples = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] 'apple'"];
    NSArray *appleArray = [fruits filteredArrayUsingPredicate:apples];
    return appleArray;
};

-(NSArray * )holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSMutableArray *holidays = [NSMutableArray array];
    for (NSString *key in database[season]){
        [holidays addObject: key];
    };
    
    return holidays;
};

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary*)database{
    NSMutableArray *suppliesForHoliday = [NSMutableArray array];
    for (NSString *supply in database[season][holiday]){
        [suppliesForHoliday addObject:supply];
    };
    return suppliesForHoliday;
};

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    BOOL check = [[database[season] allKeys] containsObject:holiday];
    return check;
};

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    BOOL check = [database[season][holiday] containsObject:supply];
    return check;
};

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    database[season][holiday]=[NSMutableArray array];
    return database;
};

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSMutableArray *supplies = [NSMutableArray array];
    [supplies addObject:supply];
    database[season][holiday]=supplies;
    return database;
};


@end
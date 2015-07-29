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

- (NSArray*)pickApplesFromFruits:(NSArray*)fruits{
//    Write out the implementation body for the pickApplesFromFruits: method so that it returns an NSArray of all of the occurrences of the string @"apple" in the argument array fruits. Think about how you can filter the argument array using NSPredicate.
//        
//        Hint: Use the self keypath when filtering an array of strings.
    
    NSPredicate* applesArrayPredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    
    NSArray *applesArray = [fruits filteredArrayUsingPredicate:applesArrayPredicate];
    
    NSLog(@"\nfiltered array is %@\n",applesArray);
    
    return [fruits filteredArrayUsingPredicate:applesArrayPredicate];
}

/*
 
 Look at the HolidayTests file to review the structure of the suppliesByHolidayAndSeason dictionary at the top of the file. This dictionary is submitted to the database argument of the method calls across the test file, meaning that it's the collection you'll be working with. 
 
 You should be able to decipher that this is a nested collection: 
 the first layer is a static dictionary of "season" keys; 
 each season key is bound to a mutable dictionary of "holiday" keys; 
 each holiday key is bound to mutable array of "supplies" relevant to that holiday.
 
 
 */
- (NSArray*)holidaysInSeason:(NSString*)season
                  inDatabase:(NSDictionary*)database{
    
    // search the database keys for the key == season

    //collect the keys of this SECOND dictionary, put into an array, and return this array

    return [database[season] allKeys];
}

- (NSArray*)suppliesInHoliday:(NSString*)holiday
                     inSeason:(NSString*)season
                   inDatabase:(NSDictionary*)database{
        return nil;
}

- (BOOL)holiday:(NSString*)holiday
     isInSeason:(NSString*)season
     inDatabase:(NSDictionary*)database{
        return nil;
}
- (BOOL)supply:(NSString*)supply
   isInHoliday:(NSString*)holiday
      inSeason:(NSString*)season
    inDatabase:(NSDictionary*)database{
        return nil;
}
- (NSDictionary*)addHoliday:(NSString*)holiday
                   toSeason:(NSString*)season
                 inDatabase:(NSDictionary*)database{
        return nil;
}
- (NSDictionary*)addSupply:(NSString*)supply
                 toHoliday:(NSString*)holiday
                  inSeason:(NSString*)season
                inDatabase:(NSDictionary*)database{
        return nil;
}

/**
 
 * Implement your methods here.
 
 */

@end
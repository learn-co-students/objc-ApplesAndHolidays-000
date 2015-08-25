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

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    // returns an NSArray of all of the occurrences of the string @"apple" in the argument array fruits. Think about how you can filter the argument array using NSPredicate
    
    NSPredicate *search = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    
    return [fruits filteredArrayUsingPredicate:search];
}


-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    /*
     // holidaysInSeason:inDatabase: to return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
    */
    
    return [database[season] allKeys];
}


-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    // to return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
    
    /*
     NSMutableArray *list = [NSMutableArray new];
     
     for (NSString *supply in database[season][holiday]) {
        [list addObject:supply];
     }
     */
    
    return database[season][holiday];
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    /*
     // to return whether or not the submitted "season" contains a key that matches the "holiday" argument.
     */
    
    BOOL status = FALSE;
     
    NSArray* hIS = [[self holidaysInSeason:season inDatabase:database] copy];

    NSPredicate* hISPredicate = [NSPredicate predicateWithFormat:@"self LIKE %@", holiday];
     
    NSArray *results = [[hIS filteredArrayUsingPredicate:hISPredicate]  copy];
     
    if ([results count] == 0) {
        return FALSE;
    } else{
        return YES;
    }
    
    return status;
}


-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    // return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.

     BOOL status = FALSE;
     
     NSArray *a = [[NSArray alloc] initWithArray:database[season][holiday]];
     
     for(NSUInteger i  = 0; i < [a count]; i++){
         if( [supply isEqualToString:a[i]]) {
             status = TRUE;
         }
     }
    
     // NSLog(@"\n\n\n\n\n\n\n\n ------ %d ------- \n\n\n\n\n\n\n\n", status);
     return status;
}


-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    /*
     // create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.
     
     NSMutableDictionary *h = [NSMutableDictionary dictionaryWithDictionary:database];
     
     h[season][holiday] = @[];
     
     return h;
     */
    
    database[season][holiday] = [@[] mutableCopy];
    
    return database;
}


-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    // insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
    
    /*
     NSMutableDictionary *h = [NSMutableDictionary dictionaryWithDictionary:database];
     
     NSMutableArray *idx = h[season][holiday];
     
     [idx addObject:supply];
     
     return h;
     */
    
    if( database[season][holiday] ) {
        [database[season][holiday] addObject:supply];
    }
    
    // return nil;
    return database;
}

@end
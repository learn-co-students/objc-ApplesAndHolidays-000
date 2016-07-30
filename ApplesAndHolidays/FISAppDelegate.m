//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"SELF contains 'apple'"];
    NSArray *pick = [fruits filteredArrayUsingPredicate:applePredicate];
  
/*    NSMutableArray *pick = [[NSMutableArray alloc] init];
    
    for (NSInteger i=0; i<[fruits count]; i++){
        if ([fruits[i] isEqual:@"apple"]) {
            [pick addObject:fruits[i]];
        }
    }
*/
    return pick;
}

-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database{
  
    NSArray *everyThing =[database[season] allKeys];

    return everyThing;
    
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database{
    
    NSArray *supplies = [NSArray arrayWithArray: database[season][holiday]];
  
    return supplies;
}

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database{
    
    BOOL contain = [[database[season] allKeys] containsObject:holiday];
    
    return contain;
}

-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database{
    
    BOOL allSupply = [database[season][holiday] containsObject:supply];
    
    return allSupply;
}

-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database{
    
    database[season][holiday]=[[NSMutableDictionary alloc] init];
    
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString *)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database{
    
    [database[season][holiday] addObject:supply];
    
    return database;
}


@end
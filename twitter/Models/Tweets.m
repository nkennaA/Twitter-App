//
//  Tweets.m
//  twitter
//
//  Created by Nkenna Aniedobe on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "Tweets.h"

@implementation Tweets
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        // Is this a re-tweet?
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        if(originalTweet != nil){
            NSDictionary *userDictionary = dictionary[@"user"];
            self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];
            // Change tweet to original tweet
            dictionary = originalTweet;
            }
        self.idStr = dictionary[@"id_str"];
        self.text = dictionary[@"text"];
        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
        self.favorited = [dictionary[@"favorited"] boolValue];
        self.retweetCount = [dictionary[@"retweet_count"] intValue];
        self.retweeted = [dictionary[@"retweeted"] boolValue];
        NSDictionary *user = dictionary[@"user"];
        self.user = [[User alloc] initWithDictionary:user];
        NSString *createdDate = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat =  @"E MMM d HH:mm:ss Z y";
        NSDate *date = [formatter dateFromString:createdDate];
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
        self.createdAtString = [formatter stringFromDate:date];
        
        
        }
    return self;
    }
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries{
    NSMutableArray *tweets = [[NSMutableArray alloc] init];
    for(NSDictionary *dictionary in dictionaries){
        Tweets *tweet = [[Tweets alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;
}
@end

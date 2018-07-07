//
//  User.m
//  twitter
//
//  Created by Nkenna Aniedobe on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.username = dictionary[@"name"];
        self.screenname = dictionary[@"screen_name"];
        NSString *profile = dictionary[@"profile_image_url_https"];
        if([profile isKindOfClass:[NSString class]]){
            self.profilePic = [NSURL URLWithString:profile];
        }
        self.followingCount = [dictionary[@"friends_count"] intValue];
        self.followerCount = [dictionary[@"followers_count"] intValue];
        self.userID = [dictionary[@"id_str"] intValue];
        self.noTweets = [dictionary[@"statuses_count"] intValue];
        NSString *banner = dictionary[@"profile_banner_url"];
        if([banner isKindOfClass:[NSString class]]){
            self.profileBanner = [NSURL URLWithString:banner];
        }
    }
    return self;
}
@end

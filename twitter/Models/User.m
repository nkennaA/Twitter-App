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
        self.profilePic = [NSURL URLWithString:profile];
    }
    return self;
}
@end

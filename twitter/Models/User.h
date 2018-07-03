//
//  User.h
//  twitter
//
//  Created by Nkenna Aniedobe on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *screenname;
@property (strong, nonatomic) NSURL *profilePic;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

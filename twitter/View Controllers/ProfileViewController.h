//
//  ProfileViewController.h
//  twitter
//
//  Created by Nkenna Aniedobe on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileBanner;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *noTweetsLabel;
@property (weak, nonatomic) IBOutlet UILabel *noFollowingLabel;
@property (weak, nonatomic) IBOutlet UILabel *noFollowersLabel;
@property User *user;
@end

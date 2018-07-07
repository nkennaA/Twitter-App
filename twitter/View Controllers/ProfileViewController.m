//
//  ProfileViewController.m
//  twitter
//
//  Created by Nkenna Aniedobe on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import <UIImageView+AFNetworking.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenNameLabel.text = self.user.screenname;
    [self.profileBanner setImageWithURL:self.user.profileBanner];
    [self.profilePic setImageWithURL:self.user.profilePic];
    NSString *tweets = [NSString stringWithFormat:@"%d", self.user.noTweets];
    NSString *following = [NSString stringWithFormat:@"%d", self.user.followingCount];
    NSString *followers = [NSString stringWithFormat:@"%d", self.user.followerCount];
    self.noTweetsLabel.text = [tweets stringByAppendingString:@" Tweets"];
    self.noFollowersLabel.text = [followers stringByAppendingString:@" Followers"];
    self.noFollowingLabel.text = [following stringByAppendingString:@" Following"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

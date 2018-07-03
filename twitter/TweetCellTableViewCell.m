//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Nkenna Aniedobe on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCellTableViewCell.h"
#import <UIImageView+AFNetworking.h>

@implementation TweetCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setWithTweet:(Tweets *)tweet{
    self.tweetTextLabel.text = tweet.text;
    NSString *atSign = @"@";
    self.usernameLabel.text = [atSign stringByAppendingString:tweet.user.username];
    self.screenNameLabel.text = tweet.user.screenname;
    self.RTCount.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    self.FavoriteCount.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    self.dateLabel.text = tweet.createdAtString;
    [self.ProfilePic setImageWithURL:tweet.user.profilePic];
}
@end

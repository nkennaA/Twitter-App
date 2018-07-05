//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Nkenna Aniedobe on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCellTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import "APIManager.h"
@implementation TweetCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)didTapLike:(id)sender {
    if(!self.tweet.favorited){
        [self favoriteTweet];
        self.Favbutton.selected = YES;
    }
    else{
        [self unfavoriteTweet];
        self.Favbutton.selected = NO;
    }
}
- (IBAction)didRetweet:(id)sender {
    if(!self.tweet.retweeted){
        [self reTweet];
        self.RTbutton.selected = YES;
    }
    else{
        self.RTbutton.selected=NO;
        [self unreTweet];
    }
}
-(void)reTweet{
    self.tweet.retweetCount+=1;
    self.tweet.retweeted =YES;
    [[APIManager shared] reTweet:self.tweet completion:^(Tweets *tweet, NSError *error) {
        if(error){
            NSLog(@"error");
        }
        else{
            NSLog(@"retweeted");
        }
    }];
    [self refreshData];
}
-(void)unreTweet{
    self.tweet.retweetCount-=1;
    self.tweet.retweeted = NO;
    [[APIManager shared] unreTweet:self.tweet completion:^(Tweets *tweet, NSError *error) {
        if(error){
            NSLog(@"error");
        }
        else{
            NSLog(@"Unretweeted");
        }
    }];
    [self refreshData];
}
-(void)favoriteTweet{
    self.tweet.favoriteCount +=1;
    self.tweet.favorited = YES;
    [[APIManager shared] favorite:self.tweet completion:^(Tweets *tweet, NSError *error) {
        if(error){
            NSLog(@"Error");
        }
        else{
            NSLog(@"Favorited");
        }
    }];
    [self refreshData];
}
-(void)unfavoriteTweet{
    self.tweet.favoriteCount -=1;
    self.tweet.favorited = NO;
    [[APIManager shared] unFavorite:self.tweet completion:^(Tweets *tweet, NSError *error) {
        if(error){
            NSLog(@"Error");
        }
        else{
            NSLog(@"Unfavorited");
        }
    }];
    [self refreshData];
}
-(void)refreshData{
    self.FavoriteCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.RTCount.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
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
    self.tweet = tweet;
    if(self.tweet.favorited){
        self.Favbutton.selected=YES;
    }
    else{
        self.Favbutton.selected=NO;
    }
    if(self.tweet.retweeted){
        self.RTbutton.selected=YES;
    }
    else{
        self.RTbutton.selected=NO;
    }
}
@end

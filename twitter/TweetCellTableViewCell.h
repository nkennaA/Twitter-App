//
//  TweetCellTableViewCell.h
//  twitter
//
//  Created by Nkenna Aniedobe on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweets.h"

@protocol TweetCellDelegate;
@interface TweetCellTableViewCell : UITableViewCell
@property (weak, nonatomic) id<TweetCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *RTCount;
@property (weak, nonatomic) IBOutlet UILabel *FavoriteCount;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) Tweets *tweet;
@property (weak, nonatomic) IBOutlet UIButton *Favbutton;
@property (weak, nonatomic) IBOutlet UIButton *RTbutton;

-(void)setWithTweet:(Tweets *)tweet;
@end

@protocol TweetCellDelegate
-(void)tweetCell:(TweetCellTableViewCell *)tweetCell didTap:(User *)user;
@end

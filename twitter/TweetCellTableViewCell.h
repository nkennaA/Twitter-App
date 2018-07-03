//
//  TweetCellTableViewCell.h
//  twitter
//
//  Created by Nkenna Aniedobe on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweets.h"
@interface TweetCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *RTCount;
@property (weak, nonatomic) IBOutlet UILabel *FavoriteCount;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) Tweets *tweet;

-(void)setWithTweet:(Tweets *)tweet;
@end

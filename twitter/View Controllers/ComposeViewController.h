//
//  ComposeViewController.h
//  twitter
//
//  Created by Nkenna Aniedobe on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweets.h"
@protocol ComposeViewControllerDelegate
-(void)hasTweet:(Tweets *)tweet;

@end
@interface ComposeViewController : UIViewController

@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
@end

